var Store = require('flux/utils').Store,
    Dispatcher = require('../dispatcher'),
    FeedConstants = require('../constants/feed_constants');

var entries = [];

var FeedStore = new Store(Dispatcher);

FeedStore.__onDispatch = function (payload) {
  switch(payload.actionType){
    case FeedConstants.ENTRIES_RECEIVED:
      entries = payload.entries;
      this.__emitChange();
      break;
  }
};

FeedStore.all = function () {
  return entries;
};


module.exports = FeedStore;
