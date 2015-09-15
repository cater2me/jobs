window.NewsReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $root = $("#content");
    var router = new NewsReader.Routers.FeedRouter({$rootEl: $root});
    Backbone.history.start();
  }
};

$(document).ready(function(){
  NewsReader.initialize();
});
