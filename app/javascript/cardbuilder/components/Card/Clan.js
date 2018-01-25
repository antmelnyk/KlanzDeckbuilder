import React from 'react';

export default class Clan extends React.Component {

    constructor() {
        super();
    }

    render() {
        return (
            <div className="cardbuilder-clan">
                <img src={ 'http://s.klanz.ru/clans/' + this.props.clan + '/deck_logo.png' } />
            </div>
        );
    }
}
