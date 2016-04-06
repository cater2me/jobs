var React = require('react');
var EntryDetail = require('./EntryDetail');

var Entries = React.createClass({

  showFeed: function() {

    return(
      <div>
        <div className='entries-title'>
          {this.props.feedData.title}
        </div>
        <div className=''>
          {this.props.feedData.link}
        </div>
        <div className=''>
          {this.props.feedData.description}
        </div>
        {this.feedEntries()}
      </div>
    );

  },

  feedEntries: function(){

    var entries = this.props.feedData.entries.map(function(entry, i){
      return(
        <EntryDetail key={i} entry={entry} />
      );
    }, this);

    return entries;
  },

  render: function() {

    var toScreen;


    if (this.props.feedData == 'INITIAL_STATE') {
      toScreen = <div className='entries-title'> enter an rss feed link </div>
    } else if (this.props.feedData == 'FAILED_FETCH') {
      toScreen = <div className='entries-title alert'> could not retrieve feed </div>
    } else {
      toScreen = this.showFeed();
    }

    return (
      <div className='entries-main'>
        {toScreen}
      </div>
    );
  }

});

module.exports = Entries;
