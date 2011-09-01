var obj_submenu_huodong;
var obj_submenu_changdi;
var obj_index_body_right_comment;
var obj_content_comment_huodong;
var obj_content_comment_changdi;

function do_commentswitch(submenu) {
	if (submenu=='huodong'){
		do_reset_submenustyle();
		obj_submenu_huodong.className = "index_body_right_commentswitch_on";
		obj_index_body_right_comment.innerHTML = obj_content_comment_huodong.innerHTML;
	}
	else if (submenu=='changdi'){
		do_reset_submenustyle();
		obj_submenu_changdi.className = "index_body_right_commentswitch_on";
		obj_index_body_right_comment.innerHTML = obj_content_comment_changdi.innerHTML;
	}
}

function do_reset_submenustyle() {
	obj_submenu_huodong.className = "index_body_right_commentswitch_off";
	obj_submenu_changdi.className = "index_body_right_commentswitch_off";
}

function init_switchObj() {
	obj_submenu_huodong = document.getElementById("index_body_right_commentswitch_huodong");
	obj_submenu_changdi = document.getElementById("index_body_right_commentswitch_changdi");
	obj_content_comment_huodong = document.getElementById("index_body_right_comment_huodong_forswitch");
	obj_content_comment_changdi = document.getElementById("index_body_right_comment_changdi_forswitch");
	obj_index_body_right_comment = document.getElementById("index_body_right_comment");
}