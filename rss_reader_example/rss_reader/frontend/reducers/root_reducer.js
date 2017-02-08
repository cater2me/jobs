import { combineReducers } from 'redux'
import feedsReducer from './feeds_reducer'

const rootReducer = combineReducers({
  feeds: feedsReducer
})

export default rootReducer
