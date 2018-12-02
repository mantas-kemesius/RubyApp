import * as React from 'react';
import {Link} from "react-router-dom";

export const Logo = () => {
    return (
        <div className="Logo">
            <Link to='/'>
                <span className="Logo-title">Uni<span className="Logo-dot">.</span></span>
            </Link>
        </div>
    );
};
