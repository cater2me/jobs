import React from 'react'

// components
import ListGroup from 'react-bootstrap/lib/ListGroup'
import ListGroupItem from 'react-bootstrap/lib/ListGroupItem'
import FeedsForm from './feeds_form'
class FeedsIndex extends React.Component {
  componentDidMount () {
    this.props.fetchFeeds()
  }
  render () {
    const { feeds, createFeed } = this.props
    const _feeds = Object.keys(feeds).map((key) => {
      return (
        <ListGroupItem key={key}><pre>{JSON.stringify(feeds[key])}</pre></ListGroupItem>
      )
    })
    return (
      <div>
        <FeedsForm createFeed={createFeed}/>
        <h4>Feeds Index</h4>
        <ListGroup>{_feeds}</ListGroup>
      </div>
    )
  }
}

export default FeedsIndex
