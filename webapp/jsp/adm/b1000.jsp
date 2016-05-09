<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/include/top.jsp" />
<jsp:include page="/jsp/include/topMenu.jsp" />

<script>
menu_id ="b";
menu_num ="";
$(document).ready( function() { 
	Init();
});	
</script> 



<!-- SNB -->
<jsp:include page="/jsp/include/subMenuA.jsp" />
<!-- //SNB -->

<div id="contents">
<!-- contents -->
	내용..


<ul id="movieList"></ul>

<!--=================== Demo Section ===================-->

<script id="movieTemplate" type="text/x-jsrender">
	<div>
		{{:#index+1}}: <b>{{>name}}</b> ({{>releaseYear}})
	</div>
</script>

<div id="movieList"></div>

<script type="text/javascript">

	var movies = [
		{ name: "The Red Violin", releaseYear: "1998" },
		{ name: "Eyes Wide Shut", releaseYear: "1999" },
		{ name: "The Inheritance", releaseYear: "197116" }
	];

	// Render the template with the movies data and insert
	// the rendered HTML under the "movieList" element
	$( "#movieList" ).html(
		$( "#movieTemplate" ).render( movies )
	);

</script>

<!--================ End of Demo Section ================-->


	
<!-- //contents -->
</div>




<jsp:include page="/jsp/include/bottom.jsp" />


