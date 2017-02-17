import React from 'react'
import { Provider } from 'react-redux'
import { Router, Route, IndexRoute, hashHistory } from 'react-router'

import App from './App'
import FeedsIndexContainer from './feeds/feeds_index_container'
import FeedShowContainer from './feeds/feed_show_container'
import * as feedActions from '../actions/feed_actions'

class Root extends React.Component {
  constructor (props) {
    super(props)
    this.fetchFeed = this.fetchFeed.bind(this)
  }
  fetchFeed (nextState, replace) {
    const { id } = nextState.params
    this.props.store.dispatch(feedActions.fetchFeed(id))
  }
  render () {
    const { store } = this.props
    return (
      <Provider store={store}>
        <Router history={hashHistory}>
          <Route path="/" component={App}>
            <IndexRoute component={FeedsIndexContainer} />
            <Route path="feeds/:id" component={FeedShowContainer} onEnter={this.fetchFeed} />
            <Route path="feeds" component={FeedsIndexContainer} />
          </Route>
        </Router>
      </Provider>
    )
  }
}

export default Root
