import React from 'react';

export default class CardFrame extends React.Component {

    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div className={ "cardFrame_" + this.props.rarity } >
            </div>
        );
    }
}
