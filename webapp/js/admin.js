/**
 * admin 
 */

var menu_id ,menu_num ;
function InitMenu(){
    if (menu_id) {
        $('li[id='+menu_id+'] a').addClass('on');
        if(menu_num){
        	$('#snb').hide();
        }else{
        	$('#snb').hide();
        }        
    }   
}

function Init(){
	InitMenu();
}






function InitA1000Sample(){
	$.get("/xml/simpleSelect.do?", {
		"selectId":"kr.co.hecorea.monitor.dao.Monitor.select_day"
	},
	function(xml){
		$(xml).find('record').each(function() {
			var $data = $(this);
			var textA = $data.find('A').text()
			alert("a : " + textA);
		})
		
		/*
		//복수일때 사용 미완성
		var xml = $(data);
		var list = xml.find("records");
		$.each(list,function(idx,item){
			var record = $(item);
			alert ("record " + record);
			var a = record.find("a").text();
			alert("a " + a);
		})
		*/
	},
	"xml");	
}