import { NavLink, useHistory } from "react-router-dom";

const HomePage = ({user, setGameId}) => {

    const history = useHistory()

    const findGoFish = async () => {
            let req = await fetch('http://localhost:4000/gofish/findgame', {
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(user)
        })
        let res = await req.json()
        setGameId(res.game_id)
        history.push(`/go-fish/${res.game_id}`)
    }

    return(
        <div className='home-page'>
           <h1 className='home-header'>Select a game!</h1>
          {/* <NavLink to='/blackjack' exact><button>Blackjack</button></NavLink> */}
          <a href='https://jchazen96.github.io/blackjack/'><button>Blackjack</button></a>
          {/* <NavLink to='/war' exact><button>War</button></NavLink> */}
          <button onClick={findGoFish}>Go Fish</button> <br/>
          <div>
          <img className='home-img' src='https://www.casino.org/blog/wp-content/uploads/Cards-and-Chips-scaled.jpg'/>
          </div>
        </div>
    )
}

export default HomePage;