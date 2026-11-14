$(function () {
    $(".tishi").hide();

    if(lr==1){
        $(".reg").hide();//登录
    }else{
        $(".login").hide();//注册
    }
	
    //是否微信浏览器
    if(is_weixin()){
        $(".open_authorize").show();
    }else{
		$(".open_authorize").hide();
	}

    //验证账号是否可注册
    $("#uname").blur(function(){
        $(".regts").hide();
        var requ=unameVeify();
        if(requ.state){
            isreg(isreg_url);
        }else{
            $(".regts").show();
            $(".regts span").empty().text(requ.msg);
        }

    });
    //验证密码
    $("#password").blur(function(){
        $(".regts").hide();
        var requ=passVeify();
        if(!requ.state){
            $(".regts").show();
            $(".regts span").empty().text(requ.msg);
        }
    });
	
	//验证真实姓名是否符合规范
	$("#truename").blur(function(){
        $(".regts").hide();		
		var requ=ck_truename();
		if(!requ.state){
            $(".regts").show();
            $(".regts span").empty().text(requ.msg);
        }
	});
	
	//验证身份证号格式是否正确
	$("#idcard").blur(function(){
        $(".regts").hide();			
		var requ=ck_idcard();
		if(!requ.state){
            $(".regts").show();
            $(".regts span").empty().text(requ.msg);
        }
	});

    /**
     * 登录
     */
    $("#btnlogin").click(function () {
        $(".logints").hide();
        var re=checkLoginForm();
        if(re.state){
            parent.location.href=index_url;
        }else{
            $(".logints").show();
            $(".logints span").empty().text(re.msg);
        }

    });
    /**
     * 注册并登录
     */
    $("#btnreg").click(function () {
        if(isReg){
            isReg=!1;
            var re=checkRegForm();
            if(re.state){
                parent.location.href=index_url;
            }else{
                $(".regts").show();
                $(".regts span").empty().text(re.msg);
                isReg=!0;
            }
        }
    });
	//20628
	/*$("#username").blur(function(){
		var username=$("#username").val();
		if(username!=''){
			$.ajax({
				type:"post",
				async:false,
				dataType:"json",
				url: "//h5.ku25.com/index.php/Login/get_login_sign",
				data: {"username":username},
				success: function(data){
					user_login_sign=data.msg;
					//alert(user_login_sign);
				}
			});
		}
	});*/

});

//验证账号是否可用
var user_reg_sign;
function isreg(url){
	var uname=$("#uname").val();
    if(uname!=""){
		$.ajax({
			type:"post",
			async:false,
			dataType:"json",
			url: "//h5.ku25.com/index.php/Login/get_reg_sign.html",
			data: {"username":uname},
			success: function(data){
				user_reg_sign=data.msg;
			}
		});
        var data={username:uname,user_reg_sign:user_reg_sign};
        var re=ajaxsubmit(url,data);
        //console.log(re);
        if(!re.state){
            $(".regts").show();
            $(".regts span").text(re.msg);
        }else{
            $(".regts span").text("");
            $(".regts").hide();
        }
    }
}
function regShow(){
    $(".content_box").hide();
    $(".reg").show();
}
function loginShow(){
    $(".content_box").hide();
    $(".login").show();
}
var user_login_sign;
function checkLoginForm() {
    $(".logints").hide();
    var lvUsername = $("#username").val();
    var lvPWD = $("#passwd").val();
    if (lvUsername == "") {

        return {state:!1,msg:"请输入用户名！"};
    }
    else if (lvPWD == "") {

        return {state:!1,msg:"输入密码！"};
    }
    else {
		if(lvUsername!=''){
			$.ajax({
				type:"post",
				async:false,
				dataType:"json",
				url: "//h5.ku25.com/index.php/Login/get_login_sign",
				data: {"username":lvUsername},
				success: function(data){
					user_login_sign=data.msg;
					//alert(user_login_sign);
				}
			});
		}
        var data=$("#frmLogin").serialize();
		data=data+"&user_login_sign="+user_login_sign;
        var re=ajaxsubmit(login_url,data);
        return  re;
    }

}

function ajaxsubmit(url,data){
    var re_data;
    //console.log(data+url);
    $.ajax({
        type: "post",
        url: url,
        data: data,
        dataType: "json",
        async:false,
        complete : function(){
            isReg=!0;
        },
        success: function(re){
            re_data = re;
        }
    });
    return re_data;

}

//验证手机号格式
function checkmobile()
{ //debugger;
    var mobile = $.trim($("#username").val());
    var my = false;
    var partten = /^1[3-9]\d{9}$/;
    if (partten.test(mobile))
        my = true;
    if (mobile.length != 11)
        my = false;
    if (!my) {
        return false;
    }
    return true;
}

//不能含有汉字！
function funcChina(str) {
    if (/.*[\u4e00-\u9fa5]+.*$/.test(str))
    {
        return false;
    }
    return true;
}

/**
 * 判断数字和字母
 */
function checkUserName(str) {
    if (/^[A-Za-z0-9]+$/.test(str))
    {
        return false;
    }
    return true;
}

//验证账号格式
function unameVeify(){
    var lvUsername = $("#uname").val();

    if (lvUsername == "") {
        return {state:!1,msg:"请输入用户名！"};
    }
    else if (lvUsername.length < 6) {
        return {state:!1,msg:"用户名长度不得小于6位！"};
    }
    else if (lvUsername.length > 15) {
        return {state:!1,msg:"用户名长度不得大于15位！"};
    }
    else if (!funcChina(lvUsername)) {

        return {state:!1,msg:"用户名不能含有汉字！"};
    }
    else if (checkUserName(lvUsername)) {
        return {state:!1,msg:"用户名只能是字母和数字！"};
    }else{
        return {state:!0};
    }

}

//密码格式验证
function passVeify(){
    var lvPWD = $("#password").val();
    if (lvPWD == "" || lvPWD == "输入密码") {
        return {state:!1,msg:"请输入密码！"};
    }
    else if (lvPWD.length < 6) {
        return {state:!1,msg:"密码长度不得小于6位！"};
    }
    else if (lvPWD.length > 15) {
        return {state:!1,msg:"密码长度不得大于15位！"};
    }
    else if (checkUserName(lvPWD)) {
        return {state:!1,msg:"密码只能是字母和数字！"};
    }else{
        return {state:!0};
    }
}

//验证用户姓名是否符合规范
function ck_truename(){
	var ck_val = $("#truename").val();
	var myreg =  /^[\u4e00-\u9fa5]{2,4}$/i;
	if(ck_val.length==0){
		return {state:0,msg:"真实姓名不能为空！"};
	}else if(!myreg.test(ck_val)){
		return {state:0,msg:"请输入真实的中文姓名！"};
	}else{
		return {state:1};
	}	
}	
//验证身份证号格式是否正确	
function ck_idcard(){
	var ck_val = $("#idcard").val();			
	var intStrLen =ck_val.length; 
	var myreg =  /[^\d]/i;
	if ((intStrLen*1 != 18)){
		return {state:0,msg:"请输入18位的身份证号码！"};
	}else if(!is_IDCard(ck_val)){
		return {state:0,msg:"身份证格式错误，请重新填写！"};
	}else if(!Age(ck_val)){
		return {state:0,msg:"身份证不满18周岁！"};
		return 0;
	}else{
		return {state:1};
	}		
}

//验证是否同意逍游服务协议
function ck_checkxy(){
	if ($('#checkxy').attr('checked')) {
		return {state:1};				
	}else{
		return {state:0,msg:"请阅读并同意用户注册服务协议！"};
	}
}

/**
 * 注册
 */

function checkRegForm() {
    $(".tishi").hide();
    var requ = unameVeify();
    if (!requ.state) {
        return requ;
    }

    var repass = passVeify();
    if (!repass.state) {
        return repass;
    }
    var lvPWD = $("#password").val();
    var rePWD = $("#repassword").val();
    if (lvPWD != rePWD) {
        return {state: !1, msg: "两次输入的密码不一致！"};
    }
	
	if(smrz==1){
		//smrz为1时验证姓名和身份证号码
		var cktname = ck_truename();
		if (!cktname.state) {
			return cktname;
		}
		var ckid = ck_idcard();
		if (!ckid.state) {
			return ckid;
		}
	}
	
	var checkxy = ck_checkxy();
    if (!checkxy.state) {
        return checkxy;
    }

    var data = $("#frmReg").serialize();
    return ajaxsubmit(reg_url, data);
}


//身份证验证函数
function is_IDCard(num){
	var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "}
	num = num.toUpperCase(); 
	//身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。   
	if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))){		
		return false;
	}
	if(aCity[parseInt(num.substr(0,2))]==null)return false;
	var len, re; 
	len = num.length; 
	/*if (len == 15){
		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/); 
		var arrSplit = num.match(re); 
		var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay){ 
			return false;   
		}else{
			return true;   
		}   
	}*/
	if (len == 18){
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/); 
		var arrSplit = num.match(re); 
		var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]); 
		var bGoodDay; 
		bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4])); 
		if (!bGoodDay) { 
			return false; 
		}else{ 
			var valnum; 
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); 
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'); 
			var nTemp = 0, i; 
			for(i = 0; i < 17; i ++) { 
				nTemp += num.substr(i, 1) * arrInt[i]; 
			}
			valnum = arrCh[nTemp % 11]; 
			if (valnum != num.substr(17, 1)) { 
				return false; 
			} 
			return true; 
		} 
	} 
	return false; 
}

//年龄验证
function Age(cardNum){
	var birthdayValue;
	/*if(15==cardNum.length){
		//15位身份证号码
		birthdayValue = cardNum.charAt(6) + cardNum.charAt(7);
		if(parseInt(birthdayValue) < 12){
			birthdayValue = '20' + birthdayValue;
		}else{
			birthdayValue = '19' + birthdayValue;
		}
		birthdayValue = birthdayValue + '-' + cardNum.charAt(8) + cardNum.charAt(9)+ '-' + cardNum.charAt(10) + cardNum.charAt(11);			
	}*/		 
	if(18==cardNum.length){
		//18位身份证号码
		birthdayValue = cardNum.charAt(6) + cardNum.charAt(7) + cardNum.charAt(8)+ cardNum.charAt(9) + '-' + cardNum.charAt(10) + cardNum.charAt(11) + '-'+ cardNum.charAt(12) + cardNum.charAt(13);
	}	 
	var r = birthdayValue.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	if(r==null){return false;}
	var d= new Date(r[1], r[3]-1, r[4]);
	if (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]){
		var dt2 = new Date();
		var age = dt2.getFullYear() - r[1];
		var m = dt2.getMonth() - r[3] + 1;
		var d = dt2.getDate() - r[4];
		if(m<0){
			age--;
			if(age >17){
				return true;
			}else{
				return false;
			}
		}else{
			if(age >17){
				if(age == 18 && m == 0 && d <0){
					return false;
				}else{
					return true;
				}
			}else{
				return false;
			}
		}
	}
}

//退出登录
function login_out(){
    var re = ajaxsubmit(out_url,{type:'out'});
    if(re.state)parent.location.href=index_url;
}

function open_win(type){
    var textst="go_back="+encodeURI(index_url)+"&extend="+ext;
    if(type==1){
        var url="http://www.ku25.com/qq/?"+textst;
    }
    else if(type==2){
        var url="http://www.ku25.com/wechat/?"+textst;
    }
    parent.location.href=url;
}
//是否微信内置浏览器打开页面
function is_weixin(){
    var ua = navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i)=="micromessenger") {
        return true;
    } else {
        return false;
    }
}
function authorize(type){
    if(type==1){//微信公众号授权登陆

            var r_url=encodeURI("http://h5.ku25.com/index.php/Mobile/wxMpAuthorize");
            var open_url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx815e1f09cf45c4dd&redirect_uri=";
            var url=open_url+r_url+"&response_type=code&scope=snsapi_userinfo&state="+gid+"#wechat_re";

        //alert(url);
        parent.location.href=url;
    }else if(type==2){//qq授权登陆次方法已废弃(因回调地址只能是http://www.ku25.com/qq/)
        var r_url=encodeURI("http://www.ku25.com/h5/index.php/Mobile/qqAuthorize");
        var url="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=100358764&redirect_uri="+r_url+"&state=ku25h5qq";
        parent.location.href=url;
    }
}