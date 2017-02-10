import React from 'react'

import ListGroup from 'react-bootstrap/lib/ListGroup'
import EntryItem from './entries_list_item'

class EntryList extends React.Component {
  render () {
    const { entries } = this.props
    const _entries = Object.keys(entries).map((key) => {
      let entry = entries[key]
      return (
        <EntryItem key={key} entry={entry} />
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
