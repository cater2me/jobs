import React from 'react'

import Modal from 'react-bootstrap/lib/Modal'

class EntryShow extends React.Component {
  render () {
    const { entry, show, toggleModal } = this.props
    return (
      <Modal className="entry-modal"
             onHide={toggleModal}
             show={show}>
        <Modal.Header>
          <Modal.Title>{entry.title}</Modal.Title>
        </Modal.Header>
      </Modal>
    )
  }
}

export default EntryShow
