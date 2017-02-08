import React from 'react'
import { Provider } from 'react-redux'
import { Router, Route, IndexRoute, hashHistory } from 'react-router'

import App from './App'
import FeedsIndex from './feeds/feeds_index'
import FeedsIndexContainer from './feeds/feeds_index_container'

const Root = ({store}) => (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
          <IndexRoute component={FeedsIndexContainer} />
      </Route>
    </Router>
  </Provider>
)

export default Root
