import {useState, useEffect} from 'react'
import Card from './Card'


const GoFish = () => {

    const [playerCards, setPlayerCards] = useState([])
    const [selectedCardValue, setSelectedCardValue] = useState(0)
    const [startBtnDisabled, setStartBtnDisabled] = useState(false)

    const startGoFish = async () => {
        let req = await fetch('http://localhost:4000/start-go-fish')
        let res = await req.json()
        setPlayerCards(res)
        setStartBtnDisabled(true)
    }

    console.log(playerCards)
    console.log(selectedCardValue)

    return(
        <div>
            <h1>Go Fish</h1>

            <button onClick={startGoFish} disabled={startBtnDisabled}>Start Game</button>
            <div onClick={setSelectedCardValue}>
            {
                playerCards.map((element)=>{
                    return(<Card element={element} key={element.id} setSelectedCardValue={setSelectedCardValue}/>)
                })
            }
            </div>
        </div>
    )
}


export default GoFish;