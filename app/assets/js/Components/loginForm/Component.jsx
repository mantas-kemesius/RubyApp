import React from 'react';

class LoginForm extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className="LoginForm">
                <h1>Prisijungimas</h1>
                <input type="text" placeholder="Username" className="input input-text"/>
                <input type="password" placeholder="password" className="input input-text"/>
                <button className="btn btn-login">Prisijungti</button>
            </div>
        );
    }
}


export default LoginForm;
