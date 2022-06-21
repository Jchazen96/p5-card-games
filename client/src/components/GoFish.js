import {useState, useEffect} from 'react'
import Card from './Card'


const GoFish = ({user, gameId}) => {

    const [playerCards, setPlayerCards] = useState([])
    
    useEffect(()=>{
        (async()=>{
            let req = await fetch(`http://localhost:4000/users/${user.id}`)
            let res = await req.json()
            setPlayerCards(res)
        })()
    },[])

    const handleCheckTurn = async () => {
        let req = await fetch(`http://localhost:4000/gofish/refresh/${gameId}?id=${user.id}`)
        let res = await req.json()
        if (res.user_turn === true) {
            alert('It is your turn!')
        } else {
            alert('It is not your turn!')
        }
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
                    return(<Card element={element} key={element.id} user={user} setPlayerCards={setPlayerCards}/>)
                })
            }
            </div>
        </div>
    )
}


export default GoFish;