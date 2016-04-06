var ReactDOM = require('react-dom');
var React = require('react');
var Content = require('./components/Content');

$(function(){

  ReactDOM.render(
    <Content />,
    document.getElementById('rssReader')
  );

});
