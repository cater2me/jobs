import * as util from '../util/feed_api_util'

export const RECEIVE_FEEDS = 'RECEIVE_FEEDS'
export const RECEIVE_FEED = 'RECEIVE_FEED'
export const REMOVE_FEED = 'REMOVE_FEED'

// async actions
export const fetchFeeds = () => {
  return (dispatch) => {
    return util.fetchFeeds().then(response => {
      dispatch(receiveFeeds(response.data))
    })
  }
}

export const fetchFeed = (id) => {
  return (dispatch) => {
    return util.fetchFeed(id).then(response => {
      dispatch(receiveFeed(response.data))
    })
  }
}

export const createFeed = (data) => {
  return (dispatch) => {
    return util.createFeed(data).then(response => {
      dispatch(receiveFeed(response.data))
    })
  }
}

// sync actions
export const receiveFeed = feed => ({
  type: RECEIVE_FEED,
  feed
})

export const receiveFeeds = feeds => ({
  type: RECEIVE_FEEDS,
  feeds
})

export const removeFeed = feed => ({
  type: REMOVE_FEED,
  feed
})
