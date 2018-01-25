import { connect } from 'react-redux'

import React from 'react';
import Cover from './Card/Cover';
import Power from './Card/Stats/Power';
import Damage from './Card/Stats/Damage';
import Name from './Card/Name';
import Ability from './Card/Ability';
import Bonus from './Card/Bonus';
import Clan from './Card/Clan';
import CardFrame from './Card/CardFrame';

class Card extends React.Component {

    constructor() {
        super();
    }

    render() {
        return (
            <div className={"cardbuilder-card " + this.props.card.rarity } >
                <Cover cover={this.props.card.cover} overlay={this.props.card.overlay} />
                <Power power={this.props.card.power} />
                <Name name={this.props.card.name} />
                <Damage damage={this.props.card.damage} />
                <Ability ability={this.props.card.ability} />
                <Bonus bonus={this.props.card.bonus} />
                <Clan clan={this.props.card.clan} />
                <CardFrame rarity={this.props.card.rarity}/>
            </div>
        );
    }
}

function mapStateToProps (state) {
    return {
        card: state.cardReducer.card
    }
}

export default connect(mapStateToProps)(Card)