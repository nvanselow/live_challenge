import React, { Component } from 'react';
import Markdown from 'react-rich-markdown';

class Answers extends Component {
  constructor(props) {
    super(props);

    this.state = {
      answers: []
    }

    this.getAnswers = this.getAnswers.bind(this);
    this.renderAnswers = this.renderAnswers.bind(this);
  }

  componentDidMount() {
    this.getAnswers();
  }

  getAnswers() {
    $.ajax({
      url: `/api/v1/questions/${this.props.questionId}/answers`,
      method: 'GET'
    })
    .done((data) => {
      this.setState({ answers: data.answers });
    });
  }

  renderAnswers() {
    return this.state.answers.map((answer) => {
      let student = answer.name;
      if(!student) {
        student = 'Anonymous';
      }

      let privateStatus = "This answer is public";
      if(answer.private_answer){
        privateStatus = "This answer is public";
      }

      return (
        <div className="answer callout" key={answer.id}>
          <div className="student">
            Student: {student}
          </div>
          <div className="answer-body">
            <Markdown source={answer.body} />
          </div>
          <div className="private-status">
            {privateStatus}
          </div>
        </div>
      );
    });
  }

  render() {
    return (
      <div className="answers">
        {this.renderAnswers()}
      </div>
    );
  }
}

export default Answers;
