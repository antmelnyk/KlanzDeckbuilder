import React from 'react';

export default class Bonus extends React.Component {

    constructor() {
        super();
    }

    render() {
        return (
            <div className="cardbuilder-bonus">
                { this.props.bonus }
            </div>
        );
    }
}
