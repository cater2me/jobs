import React from 'react'
import ListGroup from 'react-bootstrap/lib/ListGroup'
import ListGroupItem from 'react-bootstrap/lib/ListGroupItem'

class ErrorsList extends React.Component {
  render () {
    let { errors } = this.props
    const _errors = errors.map((error, idx) => {
      return (
        <ListGroupItem bsStyle="warning" key={idx}>{error}</ListGroupItem>
      )
    })
    return (
      <ListGroup>
        {_errors}
      </ListGroup>
    )
  }
}

export default ErrorsList
