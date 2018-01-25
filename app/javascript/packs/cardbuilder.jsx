import React from 'react';
import ReactDOM  from 'react-dom';

import { Provider } from 'react-redux'

import App from '../cardbuilder/components/App'

import configureStore from '../cardbuilder/configureStore'
const store = configureStore();

ReactDOM.render(
    <Provider store={store}>
        <App />
    </Provider>,
    document.getElementById('KlanzCardbuilder')
);
