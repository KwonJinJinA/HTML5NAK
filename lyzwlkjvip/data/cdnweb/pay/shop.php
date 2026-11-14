<?php
error_reporting(0);
include "../config.php";

$uid = $_GET['uid'];
$rid = $_GET['rid'];
$sid = $_GET['sid'];



$conn = mysqli_connect(DBHOST,DBUSER,DBPASS,DBNAME) or die('1112, 数据库错误');
$conn->query('set names utf8');
$sql = "SELECT * FROM shop";
$result = mysqli_query($conn,$sql);
if (!$result) {
    printf("Error: %s\n", mysqli_error($conn));
    exit();
}

?>

<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>阴阳界</title>
    <link rel="icon" href="http://58yx.top:81/images/favicon.ico" type="image/ico">
    <meta name="author" content="yinqi">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <!--对话框-->
    <link rel="stylesheet" href="css/jquery-confirm.min.css">
    <link href="css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="js/layer.js"></script>
    <script type="text/javascript" src="js/jquery.pjax.min.js"></script>
    <script type="text/javascript" src="js/clwl.js?ver=1.0"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jconfirm/jquery-confirm.min.js"></script>
    <style>
        .lyear-wrapper {
            position: relative;
        }
        
.media {
  background-color: #f0f0f0; /* 设置背景颜色 */
  padding: 10px; /* 设置内边距 */
}        
.custom-heading {
  font-size: 15px;
  color: red;
}        
    </style>
</head>

<body>
    <div class="lyear-wrapper" id="pjax">
                <div style="margin: 0 auto;">
            <div class="col-xs-12 col-sm-10 col-lg-8 center-block" style="float: none;">
                <div class="panel panel-primary">

                    <div class="panel-body">






<?php
if($result){
    while($row = mysqli_fetch_assoc($result)){

echo '<div class="media"><div class="media-left media-middle"><a href="#" onclick="openImage('.$row['id'].','.$row['num'].','.$row['money'].',\''.$row['txt'].'\')"><img class="media-object" src="'.$row['icon'].'" alt="..."></a></div><div class="media-body"><a href="#" onclick="openImage('.$row['id'].','.$row['num'].','.$row['money'].',\''.$row['txt'].'\')"> <h4 class="media-heading custom-heading">'.$row['name'].'</h4>礼包售价：'.$row['money'].'平台币</a></div></div> ';
							

    }

}

?>



                

                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        
function openImage(id, num, money, name) {
  var uid = "<?php echo $uid; ?>";
  var rid = '<?php echo $rid; ?>';
  var sid = '<?php echo $sid; ?>';
  if (num == 0) {
    var num = '不限购';
  }
  $.confirm({
    title: '温馨提示',
    content: '' +
      '<form class="formName">' +
      '<div class="form-group">' +
      '<label>限购礼包为账号限购</br>当前礼包限购数量：' + num + ' </br>购买价格为：' + money + '平台币<div class="alert alert-success" role="alert">礼包内容：</br>' + name + '</div></label>' +
      '</div>' +
      '</form>',
    buttons: {
      formSubmit: {
        text: '购买',
        btnClass: 'btn-blue',
        action: function () {
          if (!rid) {
            $.alert('请从正常渠道进入');
            return false;
          }
          layer.load(1);

          $.ajax({
            url: '../api.php?type=shop',
            type: 'post',
            dataType: 'json',
            data: { uid: uid, rid: rid, sid: sid, tid: id },
            beforeSend: function () {
              // 发送请求前的操作，例如显示弹窗提示
              layer.msg('正在叫醒收银小姐姐，请稍后...', { icon: 16, area: ['600px', '600px'] });
            },
            success: function (data) {
              console.log(data);
              layer.closeAll('loading');
              layer.msg(data.msg);
            },
            error: function (error) {
              layer.closeAll('loading');
              layer.msg('服务器错误！');
            },

          });
        }
      },
      cancel: {
        text: '放弃'
      },
    },
    onContentReady: function () {
      var jc = this;
      this.$content.find('form').on('submit', function (e) {
        e.preventDefault();
        jc.$formSubmit.trigger('click');
      });
    }
  });
}
    </script>
</body>

</html>