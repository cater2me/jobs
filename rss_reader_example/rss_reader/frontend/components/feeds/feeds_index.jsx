import React from 'react'

// components
import ListGroup from 'react-bootstrap/lib/ListGroup'
import ListGroupItem from 'react-bootstrap/lib/ListGroupItem'
import FeedsForm from './feeds_form'
import Link from 'react-router/lib/Link'

class FeedsIndex extends React.Component {
  componentDidMount () {
    this.props.fetchFeeds()
  }
  render () {
    const { feeds, createFeed } = this.props
    const _feeds = Object.keys(feeds).map((key) => {
      return (
        <ListGroupItem key={key}>
          <Link to={`feeds/${key}`}>{feeds[key].title}</Link>
        </ListGroupItem>
      )
    })
    return (
      <div>
        <FeedsForm createFeed={createFeed} />
        <section>
        Try entering these urls:
          <ul>
            <li><pre>http://www.npr.org/rss/rss.php?id=1001</pre></li>
            <li><pre>http://feeds.gawker.com/lifehacker/full.xml</pre></li>
            <li><pre>http://rss.cnn.com/rss/cnn_topstories.rss</pre></li>
          </ul>
        </section>
        <h4>Feeds</h4>
        <ListGroup>{_feeds}</ListGroup>
      </div>
    )
  }
}

export default FeedsIndex
