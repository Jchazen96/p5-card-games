import {useState, useEffect} from 'react'
import Card from './Card'


const GoFish = ({user, gameId}) => {

    const [playerCards, setPlayerCards] = useState([])
    const [isTurn, setIsTurn] = useState(false)
    const [gameOver, setGameOver] = useState(false)
    const [drawBtnVisible, setDrawBtnVisible] = useState(false)
    const [message, setMessage] = useState('')
    
    let currentHand = (playerCards.filter((element)=>!element.in_set))

    useEffect(()=>{
        handleCheckTurn()
        if (gameOver){
            clearInterval(interval)
        } else {
            var interval =setInterval(handleCheckTurn, 2000)
        }
        return () => clearInterval(interval)
    },[gameOver])

    useEffect(()=>{
        if ((currentHand.length === 0 && isTurn === true)){
            setDrawBtnVisible(true)
        } else {
            setDrawBtnVisible(false)
        }
    },[currentHand])

    const drawForEmptyHand = async () => {
            let req = await fetch(`http://localhost:4000/gofish/drawempty/${gameId}?id=${user.id}`)
            let res = await req.json()
            setPlayerCards(res.user_cards)
    }

    const handleCheckTurn = async () => {
        let req = await fetch(`http://localhost:4000/gofish/refresh/${gameId}?id=${user.id}`)
        let res = await req.json()
        if (res.message === 'Game Over') {
            alert('Game Over')
            setGameOver(true)
        }else {
        setIsTurn(res.user_turn)
        setPlayerCards(res.user_cards)
        setMessage(res.message)
    }}
    

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

    let sets = ((playerCards.filter((element)=>element.in_set).length) / 4)

    return(
        <div className='gofish'>
            <h1>Go Fish</h1>
            <h2>{message}</h2>
            <h2>Sets: {sets}</h2>
            <div className='card-container'>
                { drawBtnVisible ?
                    <button onClick={drawForEmptyHand}>Draw!</button> :
                    null
                }
            {
                playerCards.filter((element)=>!element.in_set).map((element)=>{
                    return(<Card element={element} key={element.id} setPlayerCards={setPlayerCards} onClick={()=>isTurn ? askGoFish(element.value) : alert('It is not your turn, please wait')}/>)
                })
            }
            </div>
        </div>
    )
}


export default GoFish;