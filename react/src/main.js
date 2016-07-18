import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import QuestionBodyInput from './QuestionBodyInput';
import DisplayBody from './DisplayBody';
import CodeEditor from './CodeEditor';

$(function() {
  let app = document.getElementById('app');
  let questionBodyInput = document.getElementById('react_question_body_input');

  if ( app ) {
    ReactDOM.render(
      <h1>No React Components initialized yet</h1>,
      app
    );
  }

  if(questionBodyInput){
    ReactDOM.render(
      <QuestionBodyInput />,
      questionBodyInput
    );
  }

  let questionBody = document.getElementById('react_question_body');

  if(questionBody){
    ReactDOM.render(
      <DisplayBody />,
      questionBody
    );
  }

  let codeAnswer = document.getElementById('answer')

  if(codeAnswer){
    ReactDOM.render(
      <CodeEditor />,
      codeAnswer
    );
  }
});
