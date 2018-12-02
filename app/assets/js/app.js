import React, {Component} from 'react';
import ReactDOM from 'react-dom';

import CoolName from './Components/CoolNameComponent.jsx';

class App extends Component {
    render() {
        return (
            <div>
                <p> Hello React Project</p>
                <CoolName/>
            </div>
        )
    }
}


ReactDOM.render(<App/>, document.getElementById('app'));