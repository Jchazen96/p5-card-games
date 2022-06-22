const Card = ({element, onClick}) => {


    const {value, suit, image, name} = element
 
    

    return (
        <div>
            <img src={image} onClick={onClick}/>
            <h2>Value {value}</h2>
            <h2>Suit {suit}</h2>
            <h2>Name {name}</h2>
        </div>
    )
}


export default Card;