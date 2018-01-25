import React from 'react';

export default class Cover extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className={ this.props.overlay ? 'cardbuilder-coverOverlay' : 'cardbuilder-cover' } >
                <img src={ 'http://s.klanz.ru/' + this.props.cover } />
            </div>
        );
    }
}
