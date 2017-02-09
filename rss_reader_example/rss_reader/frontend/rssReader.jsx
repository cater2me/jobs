import React from 'react'
import configureStore from './store/store'
import ReactDOM from 'react-dom'
import Root from './components/root'

// testing
import * as feedActions from './actions/feed_actions'
import * as feedUtil from './util/feed_api_util'

document.addEventListener('DOMContentLoaded', function () {
  const store = configureStore()

  // testing
  window.feedActions = feedActions
  window.feedUtil = feedUtil
  window.store = store

  ReactDOM.render(
    <Root store={store} />, document.getElementById('root'))
})
