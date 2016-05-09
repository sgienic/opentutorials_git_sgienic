/**
 * admin 
 */

var menu_id ,menu_num ;

$(document).ready( function() {
	//menu
    if (menu_id) {
        $('li[id='+menu_id+'] a').addClass('on');
        if(menu_num){
        	$('#snb').hide();
        }else{
        	$('#snb').hide();
        }        
    }    
});	