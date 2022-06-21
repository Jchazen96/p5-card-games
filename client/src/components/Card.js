const Card = ({element, user, setPlayerCards}) => {


    // const [selectedCardValue, setSelectedCardValue] = useState(0)
    const {value, suit, image, name} = element
 
    const askGoFish = async() => {
        // setSelectedCardValue(value)
        let req = await fetch('http://localhost:4000/gofish/ask', {
            method: "POST",
            headers: {"Content-type": "application/json"},
            body: JSON.stringify({value: value, id: user.id})
        })
        let res = await req.json()
        setPlayerCards(res.user_cards)
        console.log('response', res)
    }


    return (
        <div>
            <img src={image} onClick={askGoFish}/>
            <h2>Value {value}</h2>
            <h2>Suit {suit}</h2>
            <h2>Name {name}</h2>
        </div>
    )
}


export default Card;