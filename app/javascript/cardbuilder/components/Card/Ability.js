import React from 'react';

export default class Ability extends React.Component {

    constructor() {
        super();
    }

    render() {
        return (
            <div className="cardbuilder-ability">
                { this.props.ability }
            </div>
        );
    }
}
