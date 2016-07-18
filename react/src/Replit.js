import React, { Component } from 'react';
import ReplitClient from 'replit-client';

class Replit extends Component {
  constructor(props){
    super(props)

    this.state = {
      replClient: null,
      output: ''
    }

    this.setupReplitClient = this.setupReplitClient.bind(this);
    this.runCode = this.runCode.bind(this);
  }

  componentDidMount() {
    this.setupReplitClient();
  }

  setupReplitClient() {
    $.ajax({
      url: '/api/v1/replit',
      method: 'get'
    })
    .success((data) => {
      let repl = new ReplitClient('api.repl.it', 80, 'ruby', data);
      this.setState({ replClient: repl });
    });
  }

  runCode() {
    let ReplComponent = this;

    this.state.replClient.evaluateOnce(this.props.currentCode).then(
      function success(result) {
        ReplComponent.setState({ output: result.data });
      },
      function error(error) {
        console.error('Error connecting to repl.it');
      }
    );
  }

  render() {
    return (
      <div id="replit-editor">
        <button type="button" className="button" onClick={this.runCode}>
          Run <i className="fa fa-play"></i>
        </button>
        <p>
          Output:
        </p>
        <p>
          {this.state.output}
        </p>
      </div>
    );
  }
}

export default Replit;
