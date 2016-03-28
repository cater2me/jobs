var Dispatcher = require("../dispatcher"),
    FeedConstants = require('../constants/feed_constants');

module.exports = {
  getEntries: function (feedUrl) {
    $.ajax({
      url: "/api/get_feed",
      query: {feed_url: feedUrl},
      success: function (response) {
        Dispatcher.dispatch({
          actionType: FeedConstants.RECEIVE_ENTRIES,
          entries: response
        });
      }
    });
  }
};
