import React from 'react'
import Link from 'react-router/lib/Link'

const App = ({children}) => (
  <div className="app">
    <h1><Link to="/">RSS Reader </Link></h1>
    {children}
  </div>
)

export default App
