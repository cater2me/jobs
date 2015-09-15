NewsReader.Views.EntryShow = Backbone.View.extend({
  template: JST["entryShow"],
  tagName: "li",
  render: function() {
    this.$el.html(this.template({entry: this.model}))
    return this;
  }

});
