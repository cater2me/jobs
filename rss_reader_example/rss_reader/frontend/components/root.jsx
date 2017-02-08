import React from 'react'
import { Provider } from 'react-redux'
import { Router, Route, IndexRoute, hashHistory } from 'react-router'

import App from './App'
import FeedsIndexContainer from './feeds/feeds_index_container'
import FeedShowContainer from './feeds/feed_show_container'

const Root = ({store}) => (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
        <IndexRoute component={FeedsIndexContainer} />
        <Route path="feeds/:id" component={FeedShowContainer} />
        <Route path="feeds" component={FeedsIndexContainer} />
      </Route>
    </Router>
  </Provider>
)

export default Root
