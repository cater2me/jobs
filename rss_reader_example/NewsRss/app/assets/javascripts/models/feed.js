NewsReader.Models.Feed = Backbone.Model.extend({
  urlRoot: "/api/feeds",

  entries: function() {
    if(!this._entries) {
      var entries = new NewsReader.Collections.Entries([], { feed: this });
      this._entries = entries;
    }
    return this._entries;
  },

  parse: function(response) {
    var attr = response.latest_entries;
    // debugger
    if(attr){
      this.entries().set(attr);
      delete response.latest_entries;
    }
    return response;

  }
});
