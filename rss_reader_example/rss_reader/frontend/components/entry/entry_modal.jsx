import React from 'react'

import Modal from 'react-bootstrap/lib/Modal'
import Button from 'react-bootstrap/lib/Button'

class EntryShow extends React.Component {
  render () {
    const { entry, show, toggleModal } = this.props
    const markUp = () => { return { __html: entry.content } }
    return (
      <Modal {...this.props} dialogClassName="entry-modal"
        onHide={toggleModal}
        show={show}>
        <Modal.Header>
          <Modal.Title>{entry.title}</Modal.Title>
          <p>{entry.author}</p>
          <section><a href={entry.link}>{entry.link}</a></section>
        </Modal.Header>
        <Modal.Body>
          <div dangerouslySetInnerHTML={markUp()} />
        </Modal.Body>
        <Modal.Footer>
          <Button onClick={toggleModal}>Close</Button>
        </Modal.Footer>
      </Modal>
    )
  }
}

export default EntryShow
