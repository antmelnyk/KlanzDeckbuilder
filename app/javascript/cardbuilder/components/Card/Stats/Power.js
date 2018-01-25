import React from 'react';
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'

import setPower from '../../../actions/setPower'

class Power extends React.Component {

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

    updatePower(evt) {
        this.props.setPower(evt.target.value);
    }

    render() {
        return (
            <div className="cardbuilder-power" onClick={this.handleClick}>
                {
                    this.state.display === 'value' ?
                        this.props.power :
                        <input className="cardbuilder-power_input" type='number' pattern="[0-9]*" value={this.props.power}
                               onChange={ evt => this.updatePower(evt) } onBlur={ this.handleBlur } ref={input => input && input.focus()} />
                }
            </div>
        );
    }
}

function mapStateToProps (state) {
    return {
        power: state.cardReducer.card.power
    }
}

function mapDispatchToProps(dispatch) {
    return {
        setPower: bindActionCreators(setPower, dispatch)
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(Power)