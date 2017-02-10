import React from 'react'

import ListGroupItem from 'react-bootstrap/lib/ListGroupItem'

class EntryListItem extends React.Component {
  constructor (props) {
    super(props)
    this.handleClick = this.handleClick.bind(this)
  }

  handleClick () {
    const { toggleModal, selectEntry, entry } = this.props
    selectEntry(entry)
    toggleModal()
  }
  render () {
    const { entry } = this.props
    return (
      <ListGroupItem >
        <div className="entry-list-item-content" onClick={this.handleClick}>
          <h5>{entry.title}</h5> <p>{entry.author}</p>
          <section>{entry['published-date']}</section>
          <section>{entry.preview}</section>
        </div>
      </ListGroupItem>
    )
  }
}

export default EntryListItem
