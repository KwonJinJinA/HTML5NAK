$(document).pjax('a[pjax!="exclude"]', '#pjax', {
	fragment: '#pjax',
	timeout: 8000
});
$(document).on('pjax:send', function () {
	layer.load(2);
});
$(document).on('pjax:complete', function () {
	layer.closeAll('loading');
	layer.msg('加载成功');
});
//网址跳转
function url(url) {
	$.pjax({
		url: url,
		container: '#pjax',
		fragment: '#pjax',
		timeout: 8000
	});
}
//复制内容
//复制文本内容
function copy(text) {
	var oInput = document.createElement('input');
	oInput.value = text;
	document.body.appendChild(oInput);
	oInput.select(); 
	document.execCommand("Copy");
	oInput.className = 'oInput';
	oInput.style.display = 'none';
	layer.msg('复制成功');
}
//表单提交
function submit_form(url, choose) {
	layer.load(1);
	$.ajax({
		url: url,
		type: 'post',
		dataType: 'json',
		data: $(choose).serialize(),
		success: function (data) {
			layer.closeAll('loading');
			layer.msg(data.msg);
			if (choose == "#addkm" && data.code == 1) {
				var txt = data.msg + "</br>";
				$.each(data.resault, function (x, d) {
					txt += "卡密：" + d.key + "----" + d.money + "￥</br>";
				});
				$("#kms").css('display', 'block');
				$("#kms").html(txt);
			}
		},
		error: function (error) {
			layer.closeAll('loading');
			layer.msg('服务器错误！');
		}
	});
}
//ajax提交
function ajax(url, pararm) {
	layer.load(1);
	$.ajax({
		url: url,
		type: 'post',
		dataType: 'json',
		data: pararm,
		success: function (data) {
			layer.closeAll('loading');
			layer.msg(data.msg);
			if (data.code == 1) {
				/*$.pjax({
					url: window.location.href,
					container: '#pjax',
					fragment: '#pjax',
					timeout: 8000
				});*/
			}
		},
		error: function (error) {
			layer.closeAll('loading');
			layer.msg('服务器错误！');
		}
	});
}
