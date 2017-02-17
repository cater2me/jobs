export const fetchFeeds = (success, error) => {
  return $.ajax({
    method: 'GET',
    url: 'api/feeds',
    success,
    error
  })
}

export const fetchFeed = (id, success, error) => {
  return $.ajax({
    method: 'GET',
    url: `api/feeds/${id}`,
    success,
    error
  })
}

export const createFeed = (data, success, error) => {
  return $.ajax({
    method: 'POST',
    url: 'api/feeds',
    data,
    success,
    error
  })
}
