SimpleRss.Views.FeedsIndex = Backbone.View.extend({
	
	// initialize: function() {
	// 	this.listenTo(this.collection, "add", this.render);
	// },

	template: JST['feeds/index'],
	
	events: {
		"click button": "createFeeds"
	},
	
	render: function() {
		var entries;
		debugger
		if (this.collection.length > 0) {
			entries = this.collection.models[0].attributes.items.slice(0,10)
		}
		var renderedContent = this.template({
			entries: entries
		});
		
		this.$el.html(renderedContent);
		return this;
	},
	
	createFeeds: function(event) {
		var that = this
		event.preventDefault();
		data = $('form').serializeJSON()['feed'];
		this.collection.reset();
		feed = this.collection.create({ url: data.url }, {
			success: function(e) {
				that.render();
			},
			error: function(e) {
				that.collection.reset();
				$('#entries').html('<li>Invalid Feed URL. Please try again.</li>')
			}
		});
	}

});
