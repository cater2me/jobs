SimpleRss.Routers.Feeds = Backbone.Router.extend({
	
	routes: {
		"": "index"
	},
	
	index: function() {
		var indexView = new SimpleRss.Views.FeedsIndex({
			collection: SimpleRss.feeds
		});
		$('#content').html(indexView.render().$el);
	}

});
