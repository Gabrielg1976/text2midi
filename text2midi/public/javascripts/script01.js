$(document).ready(function(){
	$("#bodyText").hide();
	
	$("#textToggle").toggle(
		function(){
			$("#bodyText").show("slow");
			$("#bodyText").effect("highlight",{}, 2000);
			
		},
		
		function(){
			
		$("#bodyText").hide();
		}
	);
});