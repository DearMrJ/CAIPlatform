window.onload=function()
{
	var btn=document.getElementById("studentLoginBtn");//获取按钮
	btn.onclick=function()//添加按钮点击事件
	{
		/************************使用cookie实现记住我************************/
		var Remember = document.getElementById("rememberMe").checked;//返回true或false，不可用value作为后续判断依据
		if(Remember){//选中则true，否则false
			$.cookie('username',$("#username").val(),{ expires: 2 });
			$.cookie('password',$("#password").val(),{ expires: 2 });
		}else{
			$.cookie('username', "" , {expires: -1});
			//不可以把值设为null ，不然就真的显示"null"了
			$.cookie('password', "" , {expires: -1});//没有选中记住密码则将cookie中的password清空/销毁
		}
		
	    /*****************************************************************/
	    
	    /****************************输入规范*******************************/
		var Username = document.getElementById("username").value;//获取用户名
		var Password = document.getElementById("password").value;//获取密码
	   if(Username == "")
	   {
	   	alert("用户名不能为空");
	   	return false;
	   }
	   if(Username.length<3){
		   alert("用户名太短了");
		   return false;
	   }
	   if(Username.indexOf("-")!= -1){
			alert("用户名不能包含特殊字符");
			return false;
		}
	   if(Username.indexOf("#")!= -1){
		   alert("用户名不能包含特殊字符");
		   return false;
	   }
	   if(Password == "")
	   {
	   	alert("密码不能为空");
	   	return false;
	   }
	   if(Password.indexOf("-")!= -1){
			alert("密码不能包含特殊字符");
			return false;
		}
	   if(Password.indexOf("#")!= -1){
		   alert("密码不能包含特殊字符");
		   return false;
	   }else{
		   	var that = $('#password');
		   	console.log(Username);
		   	/***********Ajax获取公钥用于加密***********/
		   	//获取公钥
			$.ajax({
				url:"",
				type:"post",
				data:{},
				success:function(result){//返回公钥
					var publicKey = result;
					console.log(publicKey);
					//对密码进行加密
			        var encrypt = new JSEncrypt();
			        encrypt.setPublicKey(publicKey);
			        var password = that.val();
			        that.val(encrypt.encrypt(password));
			        $('#form').submit();
				}
			});
	   }
	}
}
