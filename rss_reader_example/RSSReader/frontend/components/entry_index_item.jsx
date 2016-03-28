var React = require('react');

module.exports = React.createClass({
  render: function () {
    return (
      <li className="entry">
        <a href={this.props.entry.link}>
          <h3>{this.props.entry.title}</h3>
        </a>

        <section>
          <p>{this.props.entry.author}</p>

          <p>{this.props.entry.description}</p>
          <p className="date">{this.props.entry.date}</p>
        </section>
      </li>
    );
  }
});
