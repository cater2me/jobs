NewsReader.Views.FeedShow = Backbone.CompositeView.extend({
  initialize: function(){
    this.listenTo (this.model, "sync", this.render);
    this.listenTo (this.model, "sync", this.getEntries);
    this.listenTo (this.model.entries(), "sync", this.getEntries)

  },

  template: JST["feedShow"],

  events: {
    "click .refresh": "refresh"
  },

  getEntries: function() {
    this.model.entries().each(function(entry){
        var json = entry.attributes.json
        var author = JSON.parse(entry.attributes.json).dc_creator
        entry.set({"author": author})
        view = new NewsReader.Views.EntryShow({model: entry});
        this.addSubview(".entries", view);
    }.bind(this));
  },

  render: function() {
    this.$el.html(this.template({feed: this.model}));
    this.attachSubviews();
    return this;
  },

  removeEntries: function() {
    this.model.entries().each(function(entry){
      this.removeModelSubview(".entries", entry);
    }.bind(this));
  },

  refresh: function() {
    this.removeEntries();
    this.model.entries().reset();
    this.model.fetch();
  }

});
