const SET_NAME = 'SET_NAME';
const SET_COVER = 'SET_COVER';
const SET_POWER = 'SET_POWER';
const SET_DAMAGE = 'SET_DAMAGE';
const SET_ABILITY = 'SET_ABILITY';
const SET_BONUS = 'SET_BONUS';
const SET_CLAN = 'SET_CLAN';
const SET_RARITY = 'SET_RARITY';


const initialState = {
    card: {
        name: 'Rozenstal',
        cover: 'clans/1/cards/351/default.jpg',
        overlay: false,
        //cover: 'clans/6/cards/1835/event_1_overlay.png',
        //overlay: true,
        power: 1,
        damage: 8,
        ability: 'Стая ворон 2',
        bonus: 'Хамелеон 3',
        clan: 27,
        rarity: 'legend'
    }
};

export default function cardReducer(state = initialState, action) {
    switch (action.type) {
        case SET_NAME:
            return { card: { ...state.card,  name: action.payload } };
        case SET_COVER:
            return { card: { ...state.card,  cover: action.payload } };
        case SET_POWER:
            return { card: { ...state.card,  power: action.payload } };
        case SET_DAMAGE:
            return { card: { ...state.card,  damage: action.payload } };
        case SET_ABILITY:
            return { card: { ...state.card,  ability: action.payload } };
        case SET_BONUS:
            return { card: { ...state.card,  bonus: action.payload } };
        case SET_CLAN:
            return { card: { ...state.card,  clan: action.payload } };
        case SET_RARITY:
            return { card: { ...state.card,  rarity: action.payload } };
        default:
            return state;
    }
}
