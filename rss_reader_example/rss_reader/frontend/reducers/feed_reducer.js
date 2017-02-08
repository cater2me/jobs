import { RECEIVE_FEED, RECEIVE_FEEDS, REMOVE_FEED } from '../actions/feed_actions'
import merge from 'lodash/merge'

const initialState = {
  '1': {
    id: 0,
    title: 'Title',
    url: 'url',
    note: ''
  }
}

const feedsReducer = (state = initialState, action) => {
  Object.freeze(state)
  let newState = {}
  switch (action.type) {
    case RECEIVE_FEEDS:
      action.feeds.forEach(feed => { newState[feed.id] = feed })
      return newState
    case RECEIVE_FEED:
      const newFeed = { [action.feed.id]: action.feed }
      newState = merge({}, state, newFeed)
      return newState
    case REMOVE_FEED:
      newState = merge({}, state)
      delete newState[action.feed.id]
      return newState
    default:
      return state
  }
}

export default feedsReducer
