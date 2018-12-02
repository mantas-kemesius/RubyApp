import React from 'react';

class LoginForm extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="LoginForm">
                <input type="text" placeholder="Username"/>
                <input type="password" placeholder="password"/>
            </div>
        );
    }
}


export default LoginForm;
