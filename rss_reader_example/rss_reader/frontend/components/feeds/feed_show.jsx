import React from 'react'

import EntryList from '../entry/entries_list'

class FeedShow extends React.Component {
  componentDidMount () {
    this.props.fetchFeed()
  }

  render () {
    const { entries } = this.props
    return (
      <div>
        <pre>{JSON.stringify(this.props.feed)}</pre>
        <EntryList entries={entries} />
      </div>
    )
  }
}

export default FeedShow
