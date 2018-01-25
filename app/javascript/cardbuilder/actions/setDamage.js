import {
    SET_DAMAGE,
} from "../constants/actionTypes";


export default function setDamage(value) {
    return (dispatch) => {
        dispatch({
            type: SET_DAMAGE,
            payload: value
        });
    };
}
