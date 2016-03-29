var React = require('react'),
    Modal = require('react-overlays').Modal,
    OverlayStore = require('../stores/overlay_store');

module.exports =  React.createClass({
  modalStyle: function() {
    return {
      position: 'fixed',
      zIndex: 1040,
      top: 0, bottom: 0, left: 0, right: 0
    };
  },

  backdropStyle: function() {
    return {
      position: 'fixed',
      top: 0, bottom: 0, left: 0, right: 0,
      zIndex: 'auto',
      backgroundColor: '#000',
      opacity: 0.5
    };
  },

  frameStyle: function () {
    return {
      width: '100%',
      height: '100%'
    };
  },

  dialogStyle: function() {
    return {
      position: 'absolute',
      width: 800,
      height: 800,
      margin: 'auto',
      top: '50%',
      left: '50%',
      transform: 'translate(-50%, -50%)',
      border: '1px solid #e5e5e5',
      outline: 'none',
      backgroundColor: 'white',
      boxShadow: '0 5px 15px rgba(0,0,0,.5)',
      padding: 20
    };
  },

  getInitialState: function () {
    return { showModal: false };
  },

  componentDidMount: function() {
    this.listener = OverlayStore.addListener(this.urlChange);
  },

  urlChange: function () {
    this.open(OverlayStore.url());
  },

  componentWillUnmount: function() {
    this.listener.remove();
  },

  render: function () {
    /*
    note: I'm not sure how to catch an error produced by an iframe.
    overriding window.onerror() didn't work.
    so, some links will appear to be broken in the overlay because the site has
    x-frame-options set to SAMEORIGIN.
    */
    var frame = <iframe id="frame" src={this.state.url} style={this.frameStyle()}></iframe>;
    return (
      <div className='modal-example'>

        <Modal
          aria-labelledby='modal-label'
          style={this.modalStyle()}
          backdropStyle={this.backdropStyle()}
          show={this.state.showModal}
          onHide={this.close}
        >
          <div style={this.dialogStyle()} >
            {frame}
          </div>
        </Modal>
      </div>
    );
  },

  close: function () {
    this.setState({ showModal: false });
  },

  open: function (url){
    this.setState({ showModal: true, url: url });
  }
});
