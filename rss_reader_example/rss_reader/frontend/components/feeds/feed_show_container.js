import { connect } from 'react-redux'
import { fetchFeed } from '../../actions/feed_actions'

import FeedShow from './feed_show'

const mapStateToProps = (state, {params}) => ({
  feed: state.feeds[params.id],
  entries: state.entries
})

const mapDispatchToProps = (dispatch, props) => ({
  deleteFeed: () => console.log('deleting feed test'),
  fetchFeed: () => {
    dispatch(fetchFeed(props.params.id))
  }
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FeedShow)
