
function FormCheck() {
	if($.trim($("#user_name").val()) == '') {
		alert("이름을 입력하시오.");
		$("#user_name").focus();
		return false;
	}
	
	if($.trim($("#user_id").val()) == '') {
		alert("아이디를 입력하시오.");
		$("#user_id").focus();
		return false;
	}
	
	if($("#check_id").val() == '0') {
		alert("아이디 중복확인을 체크하시오.");
		return false;
	}
	
	if($.trim($("#user_password").val()) == ''){
		alert("비밀번호를 입력하시오.");
		$("#user_password").focus();
		return false;
	}
	
	var user_password = $("#user_password").val().length;
	if (user_password < 6) {
		alert("비밀번호는 6자리 이상으로 입력하시오.");
		return false;
	}
	
	if($.trim($("#re_user_password").val()) == ''){
		alert("비밀번호(확인)을 입력하시오.");
		$("#re_user_password").focus();
		return false;
	}
	
	if($("#user_password").val() != $("#re_user_password").val()){
		alert("비밀번호를 올바르게 입력하시오.");
		$("#user_password").val("");
		$("#re_user_password").val("");
		$("#user_password").focus();
		return false;
	}
	
	if($.trim($("#user_tel_no").val()) == '') {
		alert("전화번호를 입력하시오.");
		$("#user_tel_no").focus();
		return false;
	}
	
	if($.trim($("#user_email").val())!=''){
		if(!EmailCheck($("#user_email").val())){
			alert("이메일 주소가 올바르지 않습니다.");
			$("#user_email").val("");
			$("#user_email").focus();
			return false;
		}
	}

	return true;
}


function EmailCheck(str) {
	var form = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(!form.test(str)) {
		return false;
	}
	
	return true;
}


function UserDateProc(select_year, select_month) {
	var select_day = (new Date(select_year, select_month, 0)).getDate(); //해당 년,월에 마지막날 구하기

	for(var i=1; i<=select_day; i++) {
		$("#user_private_day").append("<option value=\""+ i  +"\">"+ i + "</option>");
	}
	
}


function GoResult(xml) {
	$(xml).find('record').each(function() {
		var $data = $(this);
		var msg = "";
		
		if($data.find('cnt').text() == 0) {
			msg = "사용 가능한 아이디입니다.";
			$("#check_id").val("1");
			
		} else {
			msg = "이미 등록된 아이디입니다.";
			$("#check_id").val("0");
		}
		$("#text_msg").text(msg);
	});
}


function GoDetail(user_id) {
	$.ajax({
        type: "post",
        dataType: "xml",
        async: false,
        url: "/xml/simpleSelect.do?selectId=com.kth.web.manage.dao.User.select_duplicate_id&user_id=" + user_id,
        success: GoResult,
        error: function(xhr, status, error) {
        	alert(status);
    	}
	});
}


$(document).ready(function() {

	var current_date = new Date();

	for(var i=current_date.getFullYear()-10; i>=current_date.getFullYear()-50; i--) $("#user_private_year").append("<option value=\""+ i  +"\">"+ i + "</option>");
	for(var i=1; i<=12; i++) $("#user_private_month").append("<option value=\""+ i  +"\">"+ i + "</option>");
	for(var i=1; i<=(new Date(current_date.getFullYear()-10, 1, 0)).getDate(); i++) $("#user_private_day").append("<option value=\""+ i  +"\">"+ i + "</option>");
	
	UserDateProc(current_date.getFullYear()-10, "01");
	
	
	$(".select_date").change(function() {
		$("#user_private_day").empty();
		var select_year = $("#user_private_year option:selected").val();
		var select_month = $("#user_private_month option:selected").val();
		
		UserDateProc(select_year, select_month);
	});
	
	
	$("#btn_check_id").click(function(){
		var user_id = $("#user_id").val();
		
		if(user_id == ''){
			alert("아이디를 입력하세오.");
			$("#user_id").focus();
			return false;
		}
		
		GoDetail(user_id);
	});
	
	
	$("#btn_submit").click(function() {
		var form_data = $("#form").serialize();
		
		if(!FormCheck()) return false;
		if(!confirm("등록하시겠습니까?")) return false;
		
		$("#form_regedit").submit();
	});
	
});