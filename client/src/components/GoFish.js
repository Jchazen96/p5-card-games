import {useState, useEffect} from 'react'
import Card from './Card'


const GoFish = ({user, gameId, setUser}) => {

    const [playerCards, setPlayerCards] = useState([])
    const [isTurn, setIsTurn] = useState(false)
    
    useEffect(()=>{
        handleCheckTurn()
    },[])

    const handleCheckTurn = async () => {
        let req = await fetch(`http://localhost:4000/gofish/refresh/${gameId}?id=${user.id}`)
        let res = await req.json()
        setIsTurn(res.user_turn)
        if (res.user_turn === true) {
            alert('It is your turn!')
        } else {
            alert('It is not your turn!')
        }
        setPlayerCards(res.user_cards)
    }

    const askGoFish = async(value) => {
        let req = await fetch('http://localhost:4000/gofish/ask', {
            method: "POST",
            headers: {"Content-type": "application/json"},
            body: JSON.stringify({value: value, id: user.id})
        })
        let res = await req.json()
        console.log('askgofish res', res)
        setIsTurn(res.user_turn)
        setPlayerCards(res.user_cards)
    }
    console.log(playerCards)

    return(
        <div>
            <h1>Go Fish</h1>

            <button onClick={handleCheckTurn}>Check turn</button>
            <div>
            {
                playerCards.map((element)=>{
                    return(<Card element={element} key={element.id} setPlayerCards={setPlayerCards} onClick={()=>isTurn ? askGoFish(element.value) : null}/>)
                })
            }
            </div>
        </div>
    )
}


export default GoFish;