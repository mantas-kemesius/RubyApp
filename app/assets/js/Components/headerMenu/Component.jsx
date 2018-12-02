import * as React from 'react';
import MenuItem from "../menuItem/Component.jsx";

export const HeaderMenu = () => {
    return (
        <div className="HeaderMenu" >
            <MenuItem id={1} name={"Prisijungti"} />
            <MenuItem id={2} name={"Registracija"} />
        </div>
    );
};

