import { NavLink, useHistory } from "react-router-dom";

const HomePage = ({user}) => {

    const history = useHistory()

    const findGoFish = async () => {
            let req = await fetch('http://localhost:4000/gofish/findgame', {
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(user)
        })
        let res = await req.json()
        history.push(`/go-fish/${res.game_id}`)
    }

    return(
        <div>
           <h1>Select a game!</h1>
          <NavLink to='/blackjack' exact><button>Blackjack</button></NavLink>
          <NavLink to='/war' exact><button>War</button></NavLink>
          <button onClick={findGoFish}>Go Fish</button>
        </div>
    )
}

export default HomePage;