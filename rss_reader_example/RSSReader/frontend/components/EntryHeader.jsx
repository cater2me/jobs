var React = require('react');
var PropTypes = React.PropTypes;

var EntryHeader = React.createClass({

  dateString: function() {
    var date = new Date(this.props.entry.publishedDate);
    return date.toDateString() + ", " + date.toLocaleTimeString();
  },

  render: function() {
    return (
      <div>
        <div className='entry-title'>
          {this.props.entry.title}
        </div>

        <div className='entry-info'>
          <div className='entry-info-label'> Link: </div>
          <div className='entry-info-text'>
            <a href={this.props.entry.link}
              className='entry-link'>
              {this.props.entry.link}
            </a>
          </div>
        </div>

        <div className='entry-info'>
          <div className='entry-info-label'> Date: </div>
          <div className='entry-info-text'>
            {this.dateString()}
          </div>
        </div>

        <div className='entry-info'>
          <div className='entry-info-label'> Author: </div>
          <div className='entry-info-text'>
            {this.props.entry.author}
          </div>
        </div>
      </div>
    );
  }

});

module.exports = EntryHeader;
