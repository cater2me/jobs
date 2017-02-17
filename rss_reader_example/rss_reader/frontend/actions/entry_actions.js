export const RECEIVE_FEED = 'RECEIVE_FEED'

export const RECEIVE_ENTRIES = 'RECEIVE_ENTRIES'
export const RECEIVE_ENTRY = 'RECEIVE_ENTRY'
export const REMOVE_ENTRY = 'REMOVE_ENTRY'

// sync actions
export const receiveEntry = entry => ({
  type: RECEIVE_ENTRY,
  entry
})

export const receiveFeed = feed => ({
  type: RECEIVE_FEED,
  feed
})

export const removeEntry = entry => ({
  type: REMOVE_ENTRY,
  entry
})
