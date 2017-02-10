import React from 'react'

import ListGroup from 'react-bootstrap/lib/ListGroup'
import EntryItem from './entries_list_item'
import EntryModal from './entry_modal'

class EntryList extends React.Component {
  constructor (props) {
    super(props)
    this.state = { showModal: false, selectedEntry: {} }
    this.selectEntry = this.selectEntry.bind(this)
    this.toggleModal = this.toggleModal.bind(this)
  }

  selectEntry (entry) {
    this.setState({ selectedEntry: entry })
  }

  toggleModal (e) {
    if (e) e.preventDefault()
    this.setState({ showModal: !this.state.showModal })
  }

  render () {
    const { entries } = this.props
    const { toggleModal, selectEntry } = this
    const _entries = Object.keys(entries).map((key) => {
      let entry = entries[key]
      return (
        <EntryItem key={key} entry={entry} toggleModal={toggleModal} selectEntry={selectEntry} />
      )
    })

    const { selectedEntry } = this.state
    const entryModal = <EntryModal entry={selectedEntry}
                                   show={this.state.showModal}
                                   toggleModal={this.toggleModal} />

    return (
      <ListGroup>
        <h2>RSS Entries</h2>
        {_entries}
        {entryModal}
      </ListGroup>
    )
  }
}

export default EntryList
