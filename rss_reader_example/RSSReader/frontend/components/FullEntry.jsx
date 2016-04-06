var React = require('react');
var PropTypes = React.PropTypes;
var EntryHeader = require('./EntryHeader');
// var HtmlToReact = new require('html-to-react');

var FullEntry = React.createClass({


  hideEntry: function(e) {
    e.preventDefault();

    if (e.target.className == 'full-entry-main') {
      this.props.hideEntry();
    }

  },

  contentMarkup: function() {

    //
    // var htmlInput = this.props.entry.content;
    // var htmlToReactParser = new HtmlToReact.Parser(React);
    // return htmlToReactParser.parse(htmlInput);

    return {__html: this.props.entry.content };

  },

  render: function() {
    return (
      <div className='full-entry-main'
        onClick={this.hideEntry}>
        <div className='full-entry-body'>
          <EntryHeader entry={this.props.entry} />
          <div className='full-entry-text' dangerouslySetInnerHTML={this.contentMarkup()} />
        </div>}
      </div>
    );
  }

});

module.exports = FullEntry;
