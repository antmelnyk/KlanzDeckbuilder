import {
    SET_POWER,
} from "../constants/actionTypes";


export default function setPower(value) {
    return (dispatch) => {
        dispatch({
            type: SET_POWER,
            payload: value
        });
    };
}
