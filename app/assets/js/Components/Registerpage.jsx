import React from 'react';
import {Logo} from "./logo/Component.jsx";
import { HeaderMenu } from "./headerMenu/Component.jsx";
import RegisterForm from "./registerForm/Component.jsx";

class Registerpage extends React.Component {

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
                    <RegisterForm />
                </div>
            </div>
        );
    }

}

export default Registerpage;