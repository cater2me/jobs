import { connect } from 'react-redux'
import FeedsIndex from './feeds_index'

// actions
import { fetchFeeds, createFeed } from '../../actions/feed_actions'

const mapStateToProps = state => ({
  feeds: state.feeds
})

const mapDispatchToProps = (dispatch) => ({
  createFeed: (feed) => dispatch(createFeed(feed)),
  fetchFeeds: () => dispatch(fetchFeeds())
})

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FeedsIndex)
