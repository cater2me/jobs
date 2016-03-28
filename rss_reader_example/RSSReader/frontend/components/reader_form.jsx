var React = require('react'),
    LinkedStateMixin = require('react-addons-linked-state-mixin'),
    FeedActions = require('../actions/feed_actions');

module.exports = React.createClass({
  mixins: [LinkedStateMixin],

  getInitialState: function() {
    return {
      feedUrl: ""
    };
  },

  _onSubmit: function (event) {
    FeedActions.getEntries(this.state.feedUrl);
    event.preventDefault();
  },

  render: function () {
    return (
      <form id="reader_form" onSubmit={this._onSubmit}>
        <input className="feed-input" type="text" valueLink={this.linkState("feedUrl")} placeholder="Enter a feed url..."/>
        <input className="feed-submit" type="submit" value="Get feed" />
      </form>
    );
  }
});
