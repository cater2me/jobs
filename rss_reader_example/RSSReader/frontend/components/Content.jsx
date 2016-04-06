var React = require('react');

var Content = React.createClass({

  getInitialState: function(){

    return({
      url: undefined,
      content: undefined
    });

  },

  render: function(){

    return(
      <div> hello </div>
    );

  }
})

module.exports = Content;
