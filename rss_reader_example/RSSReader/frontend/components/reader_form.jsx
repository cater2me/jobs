var React = require('react'),
    LinkedStateMixin = require('react-addons-linked-state-mixin');

module.exports = React.createClass({
  mixins: [LinkedStateMixin],

  getInitialState: function() {
    return {
      feed: ""
    };
  },

  render: function () {
    return (
      <form id="reader_form">
        <input type="text" valueLink={this.linkState.feed} placeholder="Enter a feed url..."/>

        <input type="submit" value="Get feed"/>
      </form>
    );
  }
});
