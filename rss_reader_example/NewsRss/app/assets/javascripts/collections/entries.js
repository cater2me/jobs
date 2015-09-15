NewsReader.Collections.Entries = Backbone.Collection.extend({
  url: "/api/entries", 
  model: NewsReader.Models.Entry
});
