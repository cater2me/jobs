var React = require('react'),
    FeedStore = require('../stores/feed_store');
module.exports = React.createClass({

  componentDidMount: function() {
    this.entryListener = FeedStore.addListener(this._onEntriesChange);
  },

  componentWillUnmount: function() {
    this.entryListener.remove();
  },

  render: function () {
    return (
      <ul>

      </ul>
    );
  }
});
