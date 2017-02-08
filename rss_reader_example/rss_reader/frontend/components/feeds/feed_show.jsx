import React from 'react'

class FeedShow extends React.Component {
  componentDidMount () {
    this.props.fetchFeed()
  }

  render () {
    return (
      <div>
        <pre>{JSON.stringify(this.props.feed)}</pre>
        <pre>{JSON.stringify(this.props)}</pre>
      </div>
    )
  }
}

export default FeedShow
