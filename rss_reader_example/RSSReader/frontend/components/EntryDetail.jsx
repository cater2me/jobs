var React = require('react');
var FullEntry = require('./FullEntry');
var EntryHeader = require('./EntryHeader');

var EntryDetail = React.createClass({

  getInitialState: function() {
    return({ showingFull: false });
  },

  showFullPost: function() {
    this.setState({ showingFull: true });
  },

  hideEntry: function() {
    this.setState({ showingFull: false });
  },

  fullPost: function() {
    if (!this.state.showingFull) {
      return null;
    } else {
      return(
        <FullEntry
          entry={this.props.entry}
          hideEntry={this.hideEntry}/>
      );
    }
  },

  render: function() {

    return (
      <div className='entry-snippet-main'>

        <EntryHeader entry={this.props.entry} />

        <div className='entry-snippet-content'>
          {this.props.entry.contentSnippet}
        </div>

        <div className='full-entry-link'
          onClick={this.showFullPost}>
          See full post!
        </div>

        {this.fullPost()}

      </div>
    );
  }

});

module.exports = EntryDetail;
