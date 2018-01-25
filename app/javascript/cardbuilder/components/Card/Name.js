import React from 'react';

export default class Name extends React.Component {

    constructor() {
        super();
    }

    render() {
        return (
            <div className='cardbuilder-name'>
                { this.props.name }
            </div>
        );
    }
}
