import React from 'react';
import ReactDOM from 'react-dom';
import PropertiesReservations from './properties_reservations';

document.addEventListener('DOMContentLoaded', () => {
    const node = document.getElementById('data');
    const data = JSON.parse(node.getAttribute('data-params'));

    ReactDOM.render(
        <PropertiesReservations data={data}/>,
        document.body.appendChild(document.createElement('div'))
    )
})