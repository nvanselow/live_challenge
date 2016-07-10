import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import QuestionBodyInput from './QuestionBodyInput';

$(function() {
  let app = document.getElementById('app');
  let questionBodyInput = document.getElementById('react_question_body');

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
});
