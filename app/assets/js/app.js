import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter } from 'react-router-dom'
import Homepage from "./Components/Homepage.jsx";
import { Switch, Route } from 'react-router-dom'
import Login from "./Components/Login.jsx";
import Register from "./Components/Register.jsx";

class App extends Component {
    render() {
        return (
            <Switch>
                <Route exact path='/' component={Homepage}/>
                <Route exact path='/login' component={Login}/>
                <Route exact path='/register' component={Register}/>
            </Switch>
        )
    }
}


ReactDOM.render(
    <BrowserRouter>
        <App/>
    </BrowserRouter>
    , document.getElementById('app'));