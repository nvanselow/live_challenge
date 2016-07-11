import React, { Component } from 'react';
import Markdown from 'react-rich-markdown';

class QuestionBodyInput extends Component {
  constructor(props) {
    super(props);

    this.state = {
      body: ''
    }

    this.handleChange = this.handleChange.bind(this);
  }

  componentWillMount() {
    let originalBody = $('#original_body').val();
    this.setState({ body: originalBody });
  }

  handleChange(event) {
    let updatedBody = event.target.value;
    this.setState({ body: updatedBody });
  }


  render() {
    let markdown_options = {
      'math': false
    };

    return (
      <div className='markdown-body row'>
        <div className='columns small-12 medium-6'>
          <label htmlFor="question_body">Body</label>
          <textarea name="question[body]"
                    id="question_body"
                    onChange={this.handleChange}
                    value={ this.state.body }
                    rows={15} >
          </textarea>
        </div>
        <div className='columns hide-for-small-only medium-6'>
          <p>Preview:</p>
          <Markdown source={this.state.body} options={markdown_options} />
        </div>
      </div>
    );
  }
}

export default QuestionBodyInput;
