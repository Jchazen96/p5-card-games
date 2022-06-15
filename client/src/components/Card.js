const Card = ({element}) => {

    // ({value, suit, image} = element)

    return (
        <div>
            <img src={element.image} />
            <h2>Value {element.value}</h2>
            <h2>Suit {element.suit}</h2>
            {/* <h2>Name {name}</h2> */}
        </div>
    )
}


export default Card;