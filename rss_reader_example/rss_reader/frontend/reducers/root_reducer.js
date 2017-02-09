import { combineReducers } from 'redux'
import feedsReducer from './feeds_reducer'
import entriesReducer from './entries_reducer'

const rootReducer = combineReducers({
  feeds: feedsReducer,
  entries: entriesReducer
})

export default rootReducer
