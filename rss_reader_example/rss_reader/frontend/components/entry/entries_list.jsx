import React from 'react'

import ListGroup from 'react-bootstrap/lib/ListGroup'
import ListGroupItem from 'react-bootstrap/lib/ListGroupItem'

class EntryList extends React.Component {
  render () {
    const { entries } = this.props
    const _entries = Object.keys(entries).map((key) => {
      let entry = entries[key]
      return (
        <ListGroupItem key={key}>
          <h3>{entry.title}</h3>
          <pre>{JSON.stringify(entry)}</pre>
        </ListGroupItem>
      )
    })
    return (
      <ListGroup>
        <h2>RSS Entries</h2>
        {_entries}
      </ListGroup>
    )
  }
}

export default EntryList
