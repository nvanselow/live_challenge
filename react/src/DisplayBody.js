import React, { Component } from 'react';
import Markdown from 'react-rich-markdown';

class DisplayBody extends Component {
  constructor(props) {
    super(props)

    this.state = {
      text: ''
    }
  }

  componentDidMount() {
    let text = $('#question_body').val();
    this.setState({ text: text });
  }

  render() {
    let markdown_options = {
      'math': false
    };

    return (
      <div>
        <Markdown source={this.state.text} options={markdown_options} />
      </div>
    );
  }
}

export default DisplayBody;
