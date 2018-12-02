import * as React from 'react';
import MenuItem from "../menuItem/Component.jsx";
import { Link } from 'react-router-dom'

export const HeaderMenu = () => {
    return (
        <div className="HeaderMenu" >
            <Link to='/login'>
                <MenuItem id={1} name={"Prisijungti"} />
            </Link>
            <Link to='/register'>
            <MenuItem id={2} name={"Registracija"} />
            </Link>
        </div>
    );
};

