import React from 'react'

import ListGroupItem from 'react-bootstrap/lib/ListGroupItem'

class EntryListItem extends React.Component {
  render () {
    const { entry } = this.props

    return (
      <ListGroupItem>
        <h5>{entry.title}</h5>
        <section>{entry['published-date']}</section>
        <section>{entry.preview}</section>
      </ListGroupItem>
    )
  }
}

export default EntryListItem
