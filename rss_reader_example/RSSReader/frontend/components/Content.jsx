var React = require('react');
var LinkInput = require('./LinkInput');
var Entries = require('./Entries');

var Content = React.createClass({

  getInitialState: function(){

    return({
      url: undefined,
      content: 'INITIAL_STATE'
    });

  },

  fetchUrl: function(url){

    $.ajax({
      // found this little trick on stackoverflow to avoid access-control-allow-origin error
      // http://stackoverflow.com/questions/11346990/reading-rss-feed-with-jquery
      url: document.location.protocol + '//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=1000&callback=?&q=' + encodeURIComponent(url),
      type: 'GET',
      dataType: 'json',
      success: this.fetchSuccess,
      error: this.fetchFailure
    });

  },

  fetchSuccess: function(r){
    if (r.responseData && r.responseData.feed) {
      this.setState({ content: r.responseData.feed });
    } else {
      this.setState({ content: 'FAILED_FETCH' });
    }
  },

  fetchFailure: function(r){
    this.setState({ content: 'FAILED_FETCH' });
  },

  render: function(){


    return(
      <div>
        <LinkInput fetchUrl={this.fetchUrl} />
        <Entries feedData={this.state.content} />
      </div>
    );

  }
})

module.exports = Content;
