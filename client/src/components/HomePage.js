import { NavLink } from "react-router-dom";

const HomePage = () => {
    return(
        <div>
           <h1>Select a game!</h1>
          <NavLink to='/blackjack' exact><button>Blackjack</button></NavLink>
          <NavLink to='/war' exact><button>War</button></NavLink>
          <NavLink to='/go-fish' exact><button>Go Fish</button></NavLink>
        </div>
    )
}

export default HomePage;