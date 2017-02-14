import React from 'react'

import EntryList from '../entry/entries_list'

class FeedShow extends React.Component {
  constructor (props) {
    super(props)
    this.state = { url: '', title: '' }
  }
  componentDidMount () {
    const { feed } = this.props
    if (typeof feed === 'undefined') {
      this.props.fetchFeed()
    } else {
      const {url, title} = feed
      this.setState({url, title})
    }
  }

  render () {
    const { entries } = this.props
    let { url, title } = this.state

    return (
      <div>
        <h1><a href={url}>{title}</a></h1>
        <EntryList entries={entries} />
      </div>
    )
  }
}

export default FeedShow
