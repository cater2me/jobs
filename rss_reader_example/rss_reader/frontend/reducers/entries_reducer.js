import { RECEIVE_ENTRY, RECEIVE_FEED, REMOVE_ENTRY } from '../actions/entry_actions'
import merge from 'lodash/merge'

const initialState = {
  '0': {
    title: '',
    author: '',
    preview: '',
    content: ''
  }
}

const entriesReducer = (state = initialState, action) => {
  Object.freeze(state)
  let newState = {}
  switch (action.type) {
    case RECEIVE_FEED:
      const entries = action.feed.included
      entries.forEach(entry => { newState[entry.id] = entry["attributes"] })
      return newState
    case RECEIVE_ENTRY:
      const newEntry = { [action.entry.id]: action.entry["attributes"] }
      newState = merge({}, state, newEntry)
      return newState
    case REMOVE_ENTRY:
      newState = merge({}, state)
      delete newState[action.entry.id]
      return newState
    default:
      return state
  }
}

export default entriesReducer
