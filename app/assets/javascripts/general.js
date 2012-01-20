var App = {
	GenerateInput: function(name, id, type)
	{
		var $input = $('<input type="' + type + '" />');
		$input.attr("name", name);
		$input.attr("id", id);

		return $input;
	},
	SetViewMode:function()
	{
		var orientation = window.orientation;
		  switch(orientation) {
		    case 0:
			$('.landscape-mode').hide();
			$('.portrait-mode').show();
			window.scrollTo(0, 1)
			break; 
		       
		    case 90:
			$('.landscape-mode').show();
			$('.portrait-mode').hide();
			window.scrollTo(0, 1)
			break;
		    case -90: 
			$('.landscape-mode').show();
			$('.portrait-mode').hide();
			window.scrollTo(0, 1)
			break;
		  }	
	}
	
};

$(document).ready(function(){
	window.onorientationchange = function() {App.SetViewMode()}
});

