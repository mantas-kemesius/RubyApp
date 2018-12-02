import React from 'react';
import {Logo} from "./logo/Component.jsx";
import { HeaderMenu } from "./headerMenu/Component.jsx";

class Login extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div>
                <div className="home-header">
                    <Logo/>
                    <HeaderMenu/>
                </div>
                <div className="home-body">
                    Login
                </div>
            </div>
        );
    }

}

export default Login;