SimpleRss.Routers.Feeds = Backbone.Router.extend({
	
	routes: {
		"": "index",
		"entry/:id": "show"
	},
	
	index: function() {
		var indexView = new SimpleRss.Views.FeedsIndex({
			collection: SimpleRss.feeds
		});
		$('#content').html(indexView.render().$el);
	},
	
	show: function(id) {
		var entry = SimpleRss.feeds.models[0].attributes.items[id]
		
		$('.modal-body').html('<iframe src="' + entry.link + '" width="100%" height="600px"></iframe>')
	}

});
