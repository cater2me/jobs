var React = require('react');
var PropTypes = React.PropTypes;

var LinkInput = React.createClass({

  getInitialState: function(){ return({url: null}); },

  componentDidMount: function(){
    this.refs.urlInput.addEventListener('keyup', this.handleEnterKey);
    this.refs.urlInput.focus();
  },

  componentWillUnmount: function(){
    this.refs.urlInput.removeEventListener('keyup', this.handleEnterKey);
  },

  handleEnterKey: function(e){
    e.preventDefault();
    if (e.which == 13) { this.getFeedClick(); }
  },

  getFeedClick: function(){
    this.props.fetchUrl(this.state.url);
  },

  changeUrlField: function(e){
    e.preventDefault();
    this.setState({ url: e.currentTarget.value });
  },

  render: function() {
    return (
      <div className='url-input-main'>

          <input type='submit'
            onClick={this.getFeedClick}
            value='get feed'
            className='url-input-button' />
          <input type='text'
            ref='urlInput'
            onChange={this.changeUrlField}
            value={this.state.url}
            className='url-input-field' />
          <div className='url-input-label'>
            RSS feed link:
          </div>

      </div>
    );
  }

});

module.exports = LinkInput;
