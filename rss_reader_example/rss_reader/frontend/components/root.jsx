import React from 'react'
import { Provider } from 'react-redux'
import { Router, Route, hashHistory } from 'react-router'

import App from './App'
import FeedsIndexContainer from './components/feeds/feeds_index_container'

const Root = ({store}) => (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={App}>
          <Route path="/feeds" component={FeedsIndexContainer} />
      </Route>
    </Router>
  </Provider>
)

export default Root
