
function GoResult(xml) {
	$(xml).find('record').each(function() {
		var $data = $(this);
		
		$("#text_user_id").text($data.find('user_id').text());
		$("#text_user_tel_no").text($data.find('user_tel_no').text());
		$("#text_user_name").text($data.find('user_name').text());
		$("#text_user_email").text($data.find('user_email').text());
		$("#text_user_appr_id").text('admin');
		$("#text_user_sex").text($data.find('user_sex').text());
		$("#text_user_appr_date").text('-');
		$("#text_user_age").text($data.find('user_age').text());
		$("#text_user_reg_date").text('-');
		$("#text_user_private_no").text($data.find('user_private_no').text());
		$("#text_user_point").val($data.find('user_point').text());
		
		
	});
}

function GoDetail(user_id) {
	$.ajax({
        type: "post",
        dataType: "xml",
        async: false,
        url: "/xml/simpleSelect.do?selectId=com.kth.web.admin.dao.Admin.select_user_detail&user_id=" + user_id,
        success: GoResult,
        error: function(xhr, status, error) {
        	alert(status);
    	}
	});
}





















$(document).ready(function() {
	GoDetail("admin");
	//table_detail
});