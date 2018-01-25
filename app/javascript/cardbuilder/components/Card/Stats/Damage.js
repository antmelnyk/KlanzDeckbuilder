import React from 'react';
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'

import setDamage from '../../../actions/setDamage'

class Damage extends React.Component {

    constructor() {
        super();

        this.state = {
            display: 'value'
        };

        this.handleClick = this.handleClick.bind(this);
        this.handleBlur = this.handleBlur.bind(this);
    }

    handleClick() {
        if(this.state.display === 'value') {
            this.setState({ display: 'input' });
        }
    };

    handleBlur() {
        this.setState({ display: 'value' })
    }

    updateDamage(evt) {
        this.props.setDamage(evt.target.value);
    }

    render() {
        return (
            <div className="cardbuilder-damage" onClick={this.handleClick}>
                {
                    this.state.display === 'value' ?
                        this.props.damage :
                        <input className="cardbuilder-power_input" type='number' pattern="[0-9]*" value={this.props.damage}
                               onChange={ evt => this.updateDamage(evt) } onBlur={ this.handleBlur } ref={input => input && input.focus()} />
                }
            </div>
        );
    }
}

function mapStateToProps (state) {
    return {
        damage: state.cardReducer.card.damage
    }
}

function mapDispatchToProps(dispatch) {
    return {
        setDamage: bindActionCreators(setDamage, dispatch)
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(Damage)