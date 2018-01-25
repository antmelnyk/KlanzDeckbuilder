import React from 'react';
import Card from './Card';

export default class App extends React.Component {

    constructor() {
        super();
    }

    render() {
        return (
            <div className="cardbuilder-app">
                <div className="cardbuilder-title">Klanz Cardbuilder</div>
                <div className="cardbuilder-cardWrapper">
                    <Card/>
                </div>
            </div>
        );
    }
}
