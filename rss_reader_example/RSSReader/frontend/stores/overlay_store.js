var Store = require('flux/utils').Store,
    Dispatcher = require('../dispatcher'),
    FeedConstants = require('../constants/feed_constants');

var overlayUrl = "";

var OverlayStore = new Store(Dispatcher);

OverlayStore.__onDispatch = function (payload) {
  switch(payload.actionType){
    case FeedConstants.OVERLAY_OPENED:
      overlayUrl = payload.url;
      this.__emitChange();
      break;
  }
};

OverlayStore.url = function () {
  return overlayUrl;
};

module.exports = OverlayStore;
