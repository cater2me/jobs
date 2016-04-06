var React = require('react');
var PropTypes = React.PropTypes;

var EntryDetail = React.createClass({

  dateString: function() {
    var date = new Date(this.props.entry.publishedDate);
    return date.toDateString() + ", " + date.toLocaleTimeString();
  },

  render: function() {

    debugger;

    return (
      <div className='entry-snippet-main'>

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

        <div className='entry-snippet-content'>
          {this.props.entry.contentSnippet}
        </div>

        <div className='full-entry-link'
          onClick={this.showFullEntry}>
          See full post!
        </div>

      </div>
    );
  }

});

module.exports = EntryDetail;
