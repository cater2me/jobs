window.SimpleRss = {
	Models: {},
	Collections: {},
	Views: {},
	Routers: {},
	initialize: function() {
		new SimpleRss.Routers.Feeds();
		Backbone.history.start();
	}
};

$(document).ready(function(){
	SimpleRss.initialize();
	
	$('#article-modal').on('hide.bs.modal', function(event) {
		Backbone.history.navigate("/#");
	});
});
