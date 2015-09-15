NewsReader.Views.FeedIndex = Backbone.View.extend({
  template: JST["feedIndex"],

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.render);
    this.listenTo(this.collection, "remove", this.render);
  },

  events: {
    "click .delete": "deleteFeed",
    "submit form": "newFeed"
  },


  render:function() {
    this.$el.html(this.template({feeds: this.collection}));
    return this;
  },

  deleteFeed:function(e) {
    var id = $(e.currentTarget).data("id")
    this.collection.get(id).destroy();
  },

  newFeed:function(e) {
    e.preventDefault()
    var attributes = $(e.currentTarget).serializeJSON();
    var model = new NewsReader.Models.Feed()
    model.save(attributes.feed, {
      success: function(){
        this.collection.add(model);
      }.bind(this)
    });
  }


});
