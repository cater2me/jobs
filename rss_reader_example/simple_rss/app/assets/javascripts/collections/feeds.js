SimpleRss.Collections.Feeds = Backbone.Collection.extend({

  model: SimpleRss.Models.Feed,
	
	url: "/feed"

});

SimpleRss.feeds = new SimpleRss.Collections.Feeds()