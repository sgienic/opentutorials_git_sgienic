<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SWG</title>
	<link rel="stylesheet" href="/css/admin.css" />
	
	<script src="http://code.jquery.com/jquery-1.11.2.js" type="text/javascript"></script>
	<script src="/js/admin.js"></script>
	<script src="/js/jsrender.js" type="text/javascript"></script>
	<script src="/js/spin.min.js" type="text/javascript"></script>
	<script>
	$.fn.spin = function(opts) {
		  this.each(function() {
		    var $this = $(this),
		        data = $this.data();

		    if (data.spinner) {
		      data.spinner.stop();
		      delete data.spinner;
		    }
		    if (opts !== false) {
		      data.spinner = new Spinner($.extend({color: $this.css('color')}, opts)).spin(this);
		    }
		  });
		  return this;
		};	
	</script>

</head>
<body>