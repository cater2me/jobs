import React from 'react'
import FormGroup from 'react-bootstrap/lib/FormGroup'
import ControlLabel from 'react-bootstrap/lib/ControlLabel'
import FormControl from 'react-bootstrap/lib/FormControl'
import HelpBlock from 'react-bootstrap/lib/HelpBlock'
import Button from 'react-bootstrap/lib/Button'

class FeedsForm extends React.Component {
  constructor (props) {
    super(props)
    this.state = { url: '' }
    this.update = this.update.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  update (property) {
    return (e) => this.setState({[property]: e.target.value})
  }
  handleSubmit () {
    const {url} = this.state
    const feed = {feed: {url}}
    this.props.createFeed(feed)
  }
  getValidationState () {
    const reg = new RegExp(/^(ftp|http|https):\/\/[^ "]+$/)
    const {url} = this.state
    console.log('reg.test(url)', reg.test(url))
    if (reg.test(url)) {
      return 'success'
    } else {
      return 'error'
    }
  }
  render () {
    return (
      <form onSubmit={this.handleSubmit}>
        <FormGroup controlId="feedFormGroup" validationState={this.getValidationState()}>
          <ControlLabel>Enter a new RSS feed</ControlLabel>
          <FormControl
            type="text"
            value={this.state.url}
            placeholder="Enter a valid RSS url"
            onChange={this.update('url')}
          />
          <FormControl.Feedback />
          <HelpBlock>Requires a valid RSS url</HelpBlock>
        </FormGroup>
        <Button type="submit">
          Submit
        </Button>
      </form>
    )
  }
}

export default FeedsForm
