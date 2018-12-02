import React from 'react';
import {Logo} from "./logo/Component.jsx";
import { HeaderMenu } from "./headerMenu/Component.jsx";

class Homepage extends React.Component {

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
                    body
                </div>
            </div>
        );
    }

}

export default Homepage;