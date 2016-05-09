$.ajaxSetup ({
	async:false
});

function GoSaveId(){
	var check_status = $("#check_user_id").is(":checked"); 

	if(check_status == true) {
		if($("#user_id").val() !== null || $("#user_id").val() != "") {
			$.cookie("checkUserId" , $("#user_id").val(), { expires : 90 });
		} else {
			$.cookie("checkUserId", "");
		}
		
	} else {
		$.cookie("checkUserId", "");		
	}
}

function GoFormCheck() {
	if($.trim($("#user_id").val())==''){
		alert("아이디를 입력하십시오.");
		$("#user_id").focus();
		return false;
	}
	
	if($.trim($("#user_password").val())==''){
		alert("비밀번호를 입력하십시오.");
		$("#user_password").focus();
		return false;
	}
	
	return true;
}


$(document).ready(function() {
	
	var user_id = $.cookie("checkUserId"); //쿠기호출
	
	if(user_id != null && user_id != "") {
		$("#user_id").val(user_id);
		$("#check_user_id").attr("checked", "checked");
	}
	
	$("#btn_login").click(function() {
		if(!GoFormCheck()) return false;
		$("#form_login").submit();
	});
	
	$("#user_password").keyup(function(e) {
	    if(e.keyCode == 13) {
	    	$("#btn_login").trigger("click");
	    }       
	});
	
	$("#check_user_id").click(function() {
		GoSaveId();
	});
	
});