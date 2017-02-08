import { combineReducers } from 'redux'
import feedsReducer from './feed_reducer'

const rootReducer = combineReducers({
  feeds: feedsReducer
})

export default rootReducer
