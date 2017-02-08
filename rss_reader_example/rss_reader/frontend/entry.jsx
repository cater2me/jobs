import React from 'react'
import configureStore from './store/store'
import ReactDOM from 'react-dom'
import Root from './components/root'

document.addEventListener('DOMContentLoaded', function () {
  const store = configureStore()
  ReactDOM.render(
    <Root store={store} />, document.getElementById('root'))
})
