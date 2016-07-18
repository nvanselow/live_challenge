import React, { Component } from 'react';
import brace from 'brace';
import AceEditor from 'react-ace';

import 'brace/mode/ruby';
import 'brace/theme/monokai';

class CodeEditor extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let editor = null;
    let code_question = $('#code_question').val();

    if(code_question){
      editor = <AceEditor mode="ruby"
                          theme="monokai"
                          name="code-editor"
                          height="400px" />;
    } else {
      editor = <textarea name="answer[body]" id="answer_body"></textarea>;
    }

    return (
      <div id='answer-body-field'>
        {editor}
      </div>
    );
  }
}

export default CodeEditor;
