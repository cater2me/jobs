var React = require('react'),
    FeedStore = require('../stores/feed_store'),
    FeedIndexItem = require('./entry_index_item');
module.exports = React.createClass({

  getInitialState: function() {
    return {
      entries: FeedStore.all()
    };
  },

  componentDidMount: function() {
    this.entryListener = FeedStore.addListener(this._onEntriesChange);
  },

  componentWillUnmount: function() {
    this.entryListener.remove();
  },

  _onEntriesChange: function () {
    this.setState({
      entries: FeedStore.all()
    });
  },

  render: function () {
    var entries = this.state.entries.map(
      function (entry, i) {
        return <FeedIndexItem entry={entry} key={i}/>;
      }
    );
    return (
      <ul>
        {entries}
      </ul>
    );
  }
});
