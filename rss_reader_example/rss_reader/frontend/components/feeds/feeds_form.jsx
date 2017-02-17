import React from 'react'
import FormGroup from 'react-bootstrap/lib/FormGroup'
import ControlLabel from 'react-bootstrap/lib/ControlLabel'
import FormControl from 'react-bootstrap/lib/FormControl'
import HelpBlock from 'react-bootstrap/lib/HelpBlock'
import Button from 'react-bootstrap/lib/Button'
import ErrorsList from './errors_list'

class FeedsForm extends React.Component {
  constructor (props) {
    super(props)
    this.state = { url: '', errors: [] }
    this.update = this.update.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  update (property) {
    return (e) => this.setState({[property]: e.target.value})
  }
  handleSubmit () {
    const {url} = this.state
    const feed = {feed: {url}}
    const suc = () => { console.log('yay') }
    const err = (resp) => {
      let errors = resp.responseJSON
      this.setState({errors})
    }
    this.props.createFeed(feed).then(suc.bind(this), err.bind(this))
  }
  getValidationState () {
    const reg = new RegExp(/^(ftp|http|https):\/\/[^ "]+$/)
    const {url} = this.state
    
    if (reg.test(url)) {
      return 'success'
    } else {
      return 'error'
    }
  }
  render () {
    const { errors } = this.state
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
        <ErrorsList errors={errors} />
        <Button type="submit">
          Submit
        </Button>
      </form>
    )
  }
}

export default FeedsForm
