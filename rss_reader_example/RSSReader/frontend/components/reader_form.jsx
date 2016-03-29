var React = require('react'),
    LinkedStateMixin = require('react-addons-linked-state-mixin'),
    FeedActions = require('../actions/feed_actions'),
    FeedStore = require('../stores/feed_store');

module.exports = React.createClass({
  mixins: [LinkedStateMixin],

  getInitialState: function() {
    return {
      feedUrl: "",
      loading: false
    };
  },

  componentDidMount: function() {
    this.listener = FeedStore.addListener(this.onStoreChange);
  },

  componentWillUnmount: function() {
    this.listener.remove();
  },

  onStoreChange: function () {
    this.setState({
      loading: false
    });
  },

  _onSubmit: function (event) {
    FeedActions.getEntries(this.state.feedUrl);
    this.setState({
      loading: true
    });
    event.preventDefault();
  },

  render: function () {
    return (
      <form id="reader_form" onSubmit={this._onSubmit}>
        <input className="feed-input" type="text" valueLink={this.linkState("feedUrl")} placeholder="Enter a feed url..."/>
        <input className="feed-submit" type="submit" value={this.state.loading ? "Loading" : "Get feed"} />
      </form>
    );
  }
});
