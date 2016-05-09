
function DisplayCharts() {

	var all_value = 0;
	var male_value = 0;
	var female_value = 0;
	
	$.ajax({
		url: "/admin/select_length_user_static.do",
		dataType: "json",
		type: "POST",
		async: false,
		data: {selectUserSex : "Y"},
    	success: function(data) {
			all_value = data.dataList[0].cntAll;
			male_value = data.dataList[0].cntMale;
			female_value = data.dataList[0].cntFemale;
    		
    	},
    	error: function(e) {
    		alert(e);
    		return false;
    	}
	});
	
	var color_value = ['#1D78A6', '#E56D52'];
	
	
	$('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '가입된 총 인원: ' + all_value + '명 남녀 성비'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.y}명</b>'
        },
        plotOptions: {
            pie: {
            	size: 150,
                allowPointSelect: true,
                cursor: 'pointer',
                colors: color_value,
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.y} 명',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: '총 인원',
            colorByPoint: true,
            data: [{
                name: 'male',
                y: male_value
            }, {
                name: 'Female',
                y: female_value
            }]
        }]
    });
}

$(document).ready(function() {
	DisplayCharts();
});
