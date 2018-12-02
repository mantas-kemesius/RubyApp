import * as React from 'react';

const MenuItem = ({id, name}) => {
    return (
        <span key = {id}>{name}</span>
    );
};

export default MenuItem;
