import React, { Component } from 'react';
import Markdown from './Markdown';

class QuestionBodyInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      body: ''
    }

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    let updatedBody = event.target.value;
    this.setState({ body: updatedBody });
  }


  render() {
    return (
      <div className='markdown-body'>
        <label htmlFor="question_body">Body</label>
        <textarea name="question[body]"
                  id="question_body"
                  onChange={this.handleChange}
                  value={ this.state.body }
                  rows={15} >
        </textarea>

        <Markdown text={this.state.body} />
      </div>
    );
  }
}

export default QuestionBodyInput;
