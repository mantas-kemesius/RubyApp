import * as React from 'react';
import MenuItem from "../menuItem/Component.jsx";
import { Link } from 'react-router-dom'

export class HeaderMenu extends React.Component {

    render() {
        const currentUser = JSON.parse(localStorage.getItem('current_user'));
        let menu;
        if(currentUser!== null) {
            const loggedIn = !!currentUser.loggedIn || false;
            if (!loggedIn) {
                menu = (
                    <div className="HeaderMenu">
                        <Link to='/login'>
                            <MenuItem id={1} name={"Prisijungti"}/>
                        </Link>
                        <Link to='/register'>
                            <MenuItem id={2} name={"Registracija"}/>
                        </Link>
                    </div>
                );
            } else {
                menu = (
                    <div className="HeaderMenu">
                        <Link to='/logout'>
                            <MenuItem id={1} name={"Atsijungti"}/>
                        </Link>
                    </div>
                );
            }
        }else{
            menu = (
                <div className="HeaderMenu">
                    <Link to='/login'>
                        <MenuItem id={1} name={"Prisijungti"}/>
                    </Link>
                    <Link to='/register'>
                        <MenuItem id={2} name={"Registracija"}/>
                    </Link>
                </div>
            );
        }

        return menu;
    }
}

