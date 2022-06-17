import {useState} from 'react'
import Card from './Card'


const Blackjack = ({allCards}) => {

    const [playerTotal, setPlayerTotal] = useState(0)
    const [dealerTotal, setDealerTotal] = useState(0)
    const [playerCards, setPlayerCards] = useState([])
    const [dealerCards, setDealerCards] = useState([])
    const [cards, setCards] = useState({dealer: [], player:[]})
    const [isDisabled, setIsDisabled] = useState(false)

    const dealerDraw = async () => {
        let req = await fetch('http://localhost:4000/draw')
        let res = await req.json()
        setCards({dealer: res})
        let req2 = await fetch('http://localhost:4000/draw2')
        let res2 = await req2.json()
        setCards({player: res2})
        setIsDisabled(true)
    }

    // const playerDraw = async () => {
    //     let req = await fetch('http://localhost:4000/draw2')
    //     let res = await req.json()
    //     setPlayerCards(res)
    // }

    // const startGame = () => {
    //     dealerDraw()
    //     playerDraw()
    // }

    console.log('playerCards', cards.player)
    console.log('dealerCards', cards.dealer)

    return(
        <div>
            <h1>Blackjack</h1>

            <form>
                <input type='integer' placeholder='Chips'></input>
                <input type='submit'/>
            </form>


            <button onClick={dealerDraw} disabled={isDisabled}>Start Game!</button>
            <h1>Player Cards</h1>
                {/* {
                    cards.player.map((element)=>{
                        return(<Card element={element} key={element.id}/>)
                    })
                } */}
            <h1>Dealer Cards</h1>
                {
                    cards.dealer.map((element)=>{
                        return(<Card element={element} key={element.id} />)
                    })
                }

        </div>
    )
}

export default Blackjack;