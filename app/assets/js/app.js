import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter } from 'react-router-dom'
import Homepage from "./Components/Homepage.jsx";
import { Switch, Route } from 'react-router-dom'
import Loginpage from "./Components/Loginpage.jsx";
import Registerpage from "./Components/Registerpage.jsx";

class App extends Component {
    render() {
        const currentUrl = window.location.href.toString().split(window.location.host)[1];
        if(currentUrl === '/logout'){
            localStorage.removeItem('current_user');
            window.location.replace("http://0.0.0.0:3000/");
        }
        return (
            <Switch>
                <Route exact path='/' component={Homepage}/>
                <Route exact path='/login' component={Loginpage}/>
                <Route exact path='/register' component={Registerpage}/>
            </Switch>
        )
    }
}


ReactDOM.render(
    <BrowserRouter>
        <App/>
    </BrowserRouter>
    , document.getElementById('app'));