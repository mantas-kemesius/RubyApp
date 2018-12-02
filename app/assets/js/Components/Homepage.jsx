import React from 'react';
import {Logo} from "./logo/Component.jsx";
import { HeaderMenu } from "./headerMenu/Component.jsx";
import {StudentBody} from "./studentBody/Component.jsx";
import {TeacherBody} from "./teacherBody/Component.jsx";
import {WelcomeBody} from "./welcomeBody/Component.jsx";

class Homepage extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        let bodyContent;
        const currentUser = JSON.parse(localStorage.getItem('current_user'));
        if(currentUser !== null)
        {
            bodyContent = (currentUser.role === 'ROLE_STUDENT')? <StudentBody/> : <TeacherBody/>;
        }else
            bodyContent = <WelcomeBody/>;


        return (
            <div>
                <div className="home-header">
                    <Logo/>
                    <HeaderMenu/>
                </div>
                {bodyContent}
            </div>
        );
    }

}

export default Homepage;