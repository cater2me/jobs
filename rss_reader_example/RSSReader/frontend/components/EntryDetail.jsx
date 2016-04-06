var React = require('react');
var PropTypes = React.PropTypes;

var EntryDetail = React.createClass({

  render: function() {

    debugger;

    return (
      <div className='entry-snippet-main'>

        <div className='entry-title'>
          {this.props.entry.title}
        </div>

        <div className='entry-info'>
          <div className='entry-info-label'> Link: </div>
          <a href={this.props.entry.link}
            className='entry-link'>
            {this.props.entry.link}
          </a>
        </div>

        <div className='entry-info'>
          <div className='entry-info-label'> Date: </div>
          {this.props.entry.publishedDate}
        </div>
        <div className='entry-auth'>
          <div className='entry-info-label'> Author: </div>
          {this.props.entry.author}
        </div>

      </div>
    );
  }

});

module.exports = EntryDetail;
