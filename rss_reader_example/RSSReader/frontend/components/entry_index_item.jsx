var React = require('react'),
    FeedActions = require('../actions/feed_actions');

module.exports = React.createClass({
  _overlayClick: function (event) {
    event.preventDefault();
    FeedActions.overlayOpen(this.props.entry.link);
  },

  render: function () {
    return (
      <li className="entry">
        <a href={this.props.entry.link}>
          <h3>{this.props.entry.title}</h3>
        </a>

        <section>
          <p><strong>{this.props.entry.author}</strong></p>

          <p className="description" dangerouslySetInnerHTML={{__html: this.props.entry.description}}></p>
          <p className="date">{this.props.entry.date}</p>
          <button className="overlay-button" onClick={this._overlayClick}>View in overlay</button>
        </section>
      </li>
    );
  }
});
