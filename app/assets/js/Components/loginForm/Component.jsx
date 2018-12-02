import React from 'react';
import axios from "axios";

class LoginForm extends React.Component {

    state = {
        email: "",
        password: "",
    };

    constructor(props) {
        super(props);
    }

    handleEmail(event) {
        this.setState({email: event.target.value});
    }

    handlePassword(event) {
        this.setState({password: event.target.value});
    }

    handleClick = () => {
        if(
            this.state.email !== "" &&
            this.state.password !== ""
        ) {
            const user = {...this.state};
            axios.post(`http://0.0.0.0:3000/user/login`, {user})
                .then(res => {
                    if (res.status >= 200 && res.status < 300 && res.data !== null) {
                        localStorage.setItem('current_user', JSON.stringify({...res.data, loggedIn: true}));
                        window.location.replace("http://0.0.0.0:3000/");
                    }
                })
        }
    };

    render() {
        return (
            <div className="LoginForm">
                <h1>Prisijungimas</h1>
                <input type="email" placeholder="El. paštas" className="input input-text" value={this.state.email} onChange={(e) => this.handleEmail(e)}/>
                <input type="password" placeholder="Slaptažodis" className="input input-text" value={this.state.password} onChange={(e) => this.handlePassword(e)}/>
                <button className="btns btn-login" onClick={this.handleClick}>Prisijungti</button>
            </div>
        );
    }
}


export default LoginForm;
