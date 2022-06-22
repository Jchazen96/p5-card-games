const Card = ({element, onClick}) => {


    const {value, suit, image, name} = element
 
    

    return (
        <div className='card'>
            <img className='card-img' src={image} onClick={onClick}/>
            {/* <h2>Value {value}</h2> */}
            {/* <h2>Suit {suit}</h2> */}
            <h2>{name} of {suit}</h2>
        </div>
    )
}


export default Card;