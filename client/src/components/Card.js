const Card = ({element, setSelectedCardValue}) => {

    const {value, suit, image, name} = element
 
    return (
        <div>
            <img src={image} />
            <h2>Value {value}</h2>
            <h2>Suit {suit}</h2>
            <h2>Name {name}</h2>
        </div>
    )
}


export default Card;