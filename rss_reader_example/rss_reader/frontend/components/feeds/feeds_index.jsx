import React from 'react'

// components
import ListGroup from 'react-bootstrap/lib/ListGroup'
import ListGroupItem from 'react-bootstrap/lib/ListGroupItem'

class FeedsIndex extends React.Component {
  componentDidMount () {
    this.props.fetchFeeds()
  }
  render () {
    const { feeds } = this.props
    const _feeds = Object.keys(feeds).map((key) => {
      return (
        <ListGroupItem key={key}><pre>{JSON.stringify(feeds[key])}</pre></ListGroupItem>
      )
    })
    return (
      <div>FeedsIndex
        <ListGroup>{_feeds}</ListGroup>
      </div>
    )
  }
}

export default FeedsIndex
