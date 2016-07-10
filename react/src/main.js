import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

$(function() {
  let app = document.getElementById('app')

  if ( app ) {
    ReactDOM.render(
      <h1>No React Components initialized yet</h1>,
      app
    );
  }
});
