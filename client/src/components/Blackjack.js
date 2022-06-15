import {useState} from 'react'
import Card from './Card'


const Blackjack = ({allCards}) => {

    const [playerTotal, setPlayerTotal] = useState(0)
    const [dealerTotal, setDealerTotal] = useState(0)



    return(
        <div>
            <h1>Blackjack</h1>

            <form>
                <input type='integer' placeholder='Chips'></input>
                <input type='submit'/>
            </form>

                {
                    allCards.map((element)=>{
                        return(<Card element={element} key={element.id}/>)
                    })
                }

        </div>
    )
}

export default Blackjack;