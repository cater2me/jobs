var React = require('react'),
    ReactDom = require('react-dom'),
    ReaderForm = require('./components/reader_form'),
    ReaderIndex = require('./components/entry_index');

var App = React.createClass({
  render: function () {
    return (
      <div>
        <ReaderForm />
        <ReaderIndex />
      </div>
    );
  }
});


document.addEventListener("DOMContentLoaded", function functionName() {
  var appDiv = document.getElementById('app');
  ReactDom.render(<App />, appDiv);
});
