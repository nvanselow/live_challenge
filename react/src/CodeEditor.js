import React, { Component } from 'react';
import brace from 'brace';
import AceEditor from 'react-ace';
import Replit from './Replit';

import 'brace/mode/ruby';
import 'brace/theme/monokai';

class CodeEditor extends Component {
  constructor(props) {
    super(props);

    this.state = {
      currentCode: ''
    }

    this.updateCode = this.updateCode.bind(this);
  }

  updateCode(value) {
    this.setState({ currentCode: value });
  }

  render() {
    let editor = null;
    let code_question = $('#code_question').val();

    if(code_question){
      editor = (
        <div>
          <input type="hidden"
                 name="answer[body]"
                 id="answer_body"
                 value={this.state.currentCode} />
          <AceEditor mode="ruby"
                     theme="monokai"
                     name="code-editor"
                     height="400px"
                     onChange={this.updateCode}
                     value={this.state.currentCode} />
        </div>
      );
    } else {
      editor = <textarea name="answer[body]" id="answer_body"></textarea>;
    }

    return (
      <div className="row">
        <div className="columns small-12 medium-6">
          <div id='answer-body-field'>
            {editor}
          </div>
        </div>
        <div className="columns small-12 medium-6">
          <Replit currentCode={this.state.currentCode} />
        </div>
      </div>

    );
  }
}

export default CodeEditor;
