function do_ucmenuswitch(submenu) {
	var ucmenuobj;
	ucmenuobj = document.getElementById(submenu)
	if(submenu=='ucm_1'){
		if(ucmenuobj.className!="uc_user_info_menuidx1_on"){
			ucmenuobj.className = "uc_user_info_menuidx1_highlight";
		}
	}
	else{
		if(ucmenuobj.className!="uc_user_info_menu_on"){
			ucmenuobj.className = "uc_user_info_menu_highlight";
		}	
	}
}

function do_ucmenurestore(){
	var ucmenuobj;
	ucmenuobj = document.getElementById("ucm_1")
	if(ucmenuobj.className!="uc_user_info_menuidx1_on"){
		ucmenuobj.className = "uc_user_info_menuidx1_off";
	}
	for(var i=2; i<=7; i++){
		ucmenuobj = document.getElementById("ucm_" + i)
		if(ucmenuobj.className!="uc_user_info_menu_on"){
			ucmenuobj.className = "uc_user_info_menu_off";
		}
	}
}

function do_reset_ucmenu() {
}