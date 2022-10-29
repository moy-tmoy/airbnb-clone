import React from 'react';
import  ReactDOM from 'react-dom';
import SuccessPage from './success';

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <SuccessPage />,
      document.body.appendChild(document.createElement('div')),
    )
})