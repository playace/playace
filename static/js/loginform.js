function do_loginemailfocus(){
	var loginform_email = document.getElementById("loginform_email");
	var txt_loginform_email = loginform_email.value;
	if (txt_loginform_email=='请输入注册时填写的email'){
		loginform_email.value="";
	}
}

function do_loginemailblur(){
	var loginform_email = document.getElementById("loginform_email");
	var txt_loginform_email = loginform_email.value;
	if (txt_loginform_email==''){
		loginform_email.value="请输入注册时填写的email";
	}
}

function do_loginpasswordfocus(){
	var loginform_password = document.getElementById("loginform_password");
	var txt_loginform_password = loginform_password.value;
	if (txt_loginform_password=='********'){
		loginform_password.value="";
	}
}

function do_loginpasswordblur(){
	var loginform_password = document.getElementById("loginform_password");
	var txt_loginform_password = loginform_password.value;
	if (txt_loginform_password==''){
		loginform_password.value="********";
	}
}

