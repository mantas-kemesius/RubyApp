import React, {Component} from 'react';
import ReactDOM from 'react-dom';

// import CoolName from './Components/Homepage.jsx';
import Homepage from "./Components/Homepage.jsx";

class App extends Component {
    render() {
        return (
            <div className = "Homepage">
                <Homepage/>
            </div>
        )
    }
}


ReactDOM.render(<App/>, document.getElementById('app'));