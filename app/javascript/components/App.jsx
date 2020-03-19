import React, {Component} from 'react'
import {Jumbotron} from 'react-bootstrap';

class App extends Component {

  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="container m-3">
        <Jumbotron>
          <h1>Rails App</h1>
          <p>Welcome :)</p>
        </Jumbotron>

      </div>
    );
  }
}

export default App;

