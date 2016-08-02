import React, { Component } from 'react';

class Markdown extends Component {
  constructor(props) {
    super(props);

    this.state = {
      formattedHtml: null
    }

    this.renderMarkdown = this.renderMarkdown.bind(this);
    this.updateHtml = this.updateHtml.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    this.renderMarkdown(nextProps.text);
  }

  renderMarkdown(text) {
    $.ajax({
      url: '/api/v1/markdown',
      method: 'POST',
      data: {
        text: text
      },
      success: this.updateHtml
    });
  }

  updateHtml(data) {
    this.setState({ formattedHtml: data.html })
  }

<input type="hidden" id="membership_current" value="true" />

  render() {
    if(!this.state.formattedHtml){
      return (
        <div className="loading">
          <p>Loading Preview...</p>
        </div>
      )
    } else {
      return (
        <div className="markdown-preview">
          <span dangerouslySetInnerHTML={{__html: this.state.formattedHtml}} />
        </div>
      );
    }
  }
}

export default Markdown;
