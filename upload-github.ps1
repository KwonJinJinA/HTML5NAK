
# ============================================================
# HTML5NAK - AUTOMATED GITHUB UPLOAD
# Upload toàn bộ Server-side theo từng batch
# Có resume, Git LFS và kiểm tra file > 100 MB
# ============================================================

$ErrorActionPreference = "Stop"

# CONFIG
$RepoRoot = (Get-Location).Path
$Remote = "origin"
$Branch = "main"
$BatchLimit = 750MB

$ProgressFile = Join-Path `
    (Split-Path $RepoRoot -Parent) `
    ".HTML5NAK-upload-progress.json"

$TempPath = Join-Path $env:TEMP "HTML5NAK-upload"

# ------------------------------------------------------------
# 1. PRE-FLIGHT CHECK
# ------------------------------------------------------------

Write-Host "`n=== HTML5NAK UPLOAD ===" -ForegroundColor Cyan

if (!(Test-Path ".git")) {
    throw "Không tìm thấy .git. Hãy chạy script tại thư mục Server-side."
}

if (!(Test-Path ".\lyzwlkjvip")) {
    throw "Không tìm thấy thư mục lyzwlkjvip."
}

if (!(Test-Path ".\.gitattributes")) {
    throw "Không tìm thấy .gitattributes."
}

if (!(Test-Path $TempPath)) {
    New-Item -ItemType Directory -Path $TempPath | Out-Null
}

$remoteUrl = git remote get-url $Remote
if ($LASTEXITCODE -ne 0 -or !$remoteUrl) {
    throw "Không tìm thấy remote origin."
}

if ($remoteUrl -notmatch "KwonJinJinA/HTML5NAK") {
    throw "Remote không đúng repository HTML5NAK: $remoteUrl"
}

# Kiểm tra Git LFS
git lfs version
if ($LASTEXITCODE -ne 0) {
    throw "Git LFS chưa hoạt động."
}

# Kiểm tra branch
$currentBranch = git branch --show-current
if ($currentBranch -ne $Branch) {
    throw "Branch hiện tại không phải main."
}

# ------------------------------------------------------------
# 2. SCAN FILES
# ------------------------------------------------------------

Write-Host "`n[1/6] Đang quét toàn bộ dữ liệu..." -ForegroundColor Yellow

$Files = @(
    Get-ChildItem -LiteralPath $RepoRoot -Recurse -File -Force |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]'
    } |
    Sort-Object FullName
)

if ($Files.Count -eq 0) {
    throw "Không tìm thấy file để upload."
}

$TotalBytes = [long](($Files | Measure-Object Length -Sum).Sum)
$TotalGB = [math]::Round($TotalBytes / 1GB, 3)

Write-Host "Số file: $($Files.Count)"
Write-Host "Tổng dung lượng: $TotalGB GB"

# ------------------------------------------------------------
# 3. CHECK GITHUB FILE LIMIT
# ------------------------------------------------------------

Write-Host "`n[2/6] Kiểm tra file lớn hơn 100 MB..." -ForegroundColor Yellow

$TooLarge = @(
    $Files | Where-Object {
        $_.Length -gt 100MB -and
        $_.Extension -ne ".rpm"
    }
)

if ($TooLarge.Count -gt 0) {
    Write-Host "`nPhát hiện file > 100 MB chưa được cấu hình LFS:" -ForegroundColor Red

    $TooLarge | ForEach-Object {
        Write-Host "$($_.FullName) - $([math]::Round($_.Length / 1MB, 2)) MB"
    }

    throw "Dừng upload. Hãy cấu hình Git LFS cho các file trên."
}

# Đảm bảo RPM được track bằng LFS
git lfs track "*.rpm"
if ($LASTEXITCODE -ne 0) {
    throw "Không cấu hình được Git LFS."
}

git add .gitattributes
if ($LASTEXITCODE -ne 0) {
    throw "Không add được .gitattributes."
}

git diff --cached --quiet
if ($LASTEXITCODE -eq 1) {
    git commit -m "Configure Git LFS"
    if ($LASTEXITCODE -ne 0) {
        throw "Không commit được cấu hình LFS."
    }
}

# ------------------------------------------------------------
# 4. BUILD BATCHES
# ------------------------------------------------------------

Write-Host "`n[3/6] Đang chia batch..." -ForegroundColor Yellow

$Batches = [System.Collections.Generic.List[object]]::new()
$CurrentFiles = [System.Collections.Generic.List[string]]::new()
[long]$CurrentBytes = 0

foreach ($File in $Files) {

    $RelativePath = $File.FullName.Substring($RepoRoot.Length).TrimStart('\','/')
    $RelativePath = $RelativePath.Replace('\','/')

    if ($CurrentFiles.Count -gt 0 -and
        ($CurrentBytes + $File.Length) -gt $BatchLimit) {

        $Batches.Add([PSCustomObject]@{
            Files = @($CurrentFiles.ToArray())
            Bytes = $CurrentBytes
        })

        $CurrentFiles.Clear()
        $CurrentBytes = 0
    }

    $CurrentFiles.Add($RelativePath)
    $CurrentBytes += $File.Length
}

if ($CurrentFiles.Count -gt 0) {
    $Batches.Add([PSCustomObject]@{
        Files = @($CurrentFiles.ToArray())
        Bytes = $CurrentBytes
    })
}

Write-Host "Tổng số batch: $($Batches.Count)"

for ($i = 0; $i -lt $Batches.Count; $i++) {
    $size = [math]::Round($Batches[$i].Bytes / 1GB, 3)
    Write-Host "Batch $($i + 1): $size GB - $($Batches[$i].Files.Count) files"
}

# ------------------------------------------------------------
# 5. CHECK REMOTE AND RESUME
# ------------------------------------------------------------

Write-Host "`n[4/6] Kiểm tra GitHub..." -ForegroundColor Yellow

$RemoteRefs = git ls-remote --heads $Remote $Branch
if ($LASTEXITCODE -ne 0) {
    throw "Không thể kết nối GitHub. Kiểm tra mạng và quyền truy cập."
}

$Progress = $null

if (Test-Path $ProgressFile) {

    $Progress = Get-Content $ProgressFile -Raw | ConvertFrom-Json

    if ($Progress.FileCount -ne $Files.Count -or
        $Progress.TotalBytes -ne $TotalBytes) {
        throw "Danh sách file đã thay đổi kể từ lần upload trước. Không thể resume an toàn."
    }

    if ($Progress.NextBatch -gt $Batches.Count) {
        throw "Tiến độ upload không hợp lệ."
    }

    Write-Host "Tìm thấy tiến độ cũ. Tiếp tục từ batch $($Progress.NextBatch + 1)." -ForegroundColor Green

    # Đẩy commit đang chờ nếu lần trước push bị lỗi
    git push -u $Remote $Branch

    if ($LASTEXITCODE -ne 0) {
        throw "Push failed. Check GitHub and run the script again."
    }
}
else {

    if ($RemoteRefs) {
        throw "GitHub đã có branch main nhưng chưa có file tiến độ. Dừng để tránh ghi đè."
    }

    $Progress = [PSCustomObject]@{
        FileCount = $Files.Count
        TotalBytes = $TotalBytes
        NextBatch = 0
    }

    $Progress |
        ConvertTo-Json |
        Set-Content -LiteralPath $ProgressFile -Encoding UTF8
}

# ------------------------------------------------------------
# 6. UPLOAD EACH BATCH
# ------------------------------------------------------------

Write-Host "`n[5/6] Bắt đầu upload..." -ForegroundColor Cyan

for ($i = [int]$Progress.NextBatch; $i -lt $Batches.Count; $i++) {

    $Batch = $Batches[$i]

    $SizeGB = [math]::Round($Batch.Bytes / 1GB, 3)

    Write-Host "`n------------------------------------" -ForegroundColor DarkGray
    Write-Host "BATCH $($i + 1) / $($Batches.Count)" -ForegroundColor Cyan
    Write-Host "Files: $($Batch.Files.Count)"
    Write-Host "Size: $SizeGB GB"
    Write-Host "------------------------------------" -ForegroundColor DarkGray

    $PathspecFile = Join-Path $TempPath "batch-$i.txt"

    # Ghi danh sách file UTF-8 không BOM
    [System.IO.File]::WriteAllLines(
        $PathspecFile,
        [string[]]$Batch.Files,
        [System.Text.UTF8Encoding]::new($false)
    )

    # Add file theo danh sách batch
    git --literal-pathspecs add --pathspec-from-file="$PathspecFile"

    if ($LASTEXITCODE -ne 0) {
        throw "Git add thất bại tại batch $($i + 1)."
    }

    git diff --cached --quiet
    $DiffExit = $LASTEXITCODE

    if ($DiffExit -eq 1) {

        git commit -m "Upload batch $($i + 1) of $($Batches.Count)"

        if ($LASTEXITCODE -ne 0) {
            throw "Commit thất bại tại batch $($i + 1)."
        }
    }
    elseif ($DiffExit -ne 0) {
        throw "Không kiểm tra được staged changes."
    }
    else {
        Write-Host "Batch không có thay đổi mới, bỏ qua commit."
    }

    # Lưu tiến độ TRƯỚC khi push.
    # Nếu push lỗi, lần sau sẽ push lại commit này.
    $Progress.NextBatch = $i + 1

    $Progress |
        ConvertTo-Json |
        Set-Content -LiteralPath $ProgressFile -Encoding UTF8

    # Push batch
    git push -u $Remote $Branch

    if ($LASTEXITCODE -ne 0) {
        throw "Push thất bại ở batch $($i + 1). Chạy lại script để tiếp tục."
    }

    Write-Host "Batch $($i + 1) upload thành công!" -ForegroundColor Green
}

# ------------------------------------------------------------
# 7. FINAL CHECK
# ------------------------------------------------------------

Write-Host "`n[6/6] Kiểm tra kết quả..." -ForegroundColor Yellow

git lfs ls-files

git status --short

git ls-remote --heads $Remote $Branch

if ($LASTEXITCODE -ne 0) {
    throw "Không xác minh được branch remote."
}

Write-Host "`n====================================" -ForegroundColor Green
Write-Host "UPLOAD HOÀN TẤT!" -ForegroundColor Green
Write-Host "Repository: $remoteUrl"
Write-Host "Branch: $Branch"
Write-Host "Files scanned: $($Files.Count)"
Write-Host "Total data: $TotalGB GB"
Write-Host "====================================" -ForegroundColor Green

Write-Host "`nTiến độ được lưu tại: $ProgressFile"
Write-Host "Không xóa file tiến độ cho đến khi xác minh dữ liệu thành công."
