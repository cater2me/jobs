NewsReader.Routers.FeedRouter = Backbone.Router.extend({
  routes: {
    "": "feedIndex",
    "feeds/:id": "feedShow"
  },

  initialize: function(options){
    this.collection = new NewsReader.Collections.Feeds();
    this.$rootEl = options.$rootEl;
  },

  feedIndex: function(){
    this.collection.fetch();
    var view = new NewsReader.Views.FeedIndex({collection: this.collection});
    this.swap(view);
  },

  feedShow: function(id) {
    var feed = this.collection.getOrFetch(id);
    var view = new NewsReader.Views.FeedShow({model: feed});
    this.swap(view);
  },

  swap: function(view) {
    if(this._view) {
      this._view.remove();
    }
    this._view = view;
    this.$rootEl.html(this._view.render().$el);
  }

});
