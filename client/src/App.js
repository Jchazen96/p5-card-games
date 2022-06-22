import './App.css';
import {Route, Switch, useHistory} from 'react-router-dom'
import HomePage from './components/HomePage';
import War from './components/War';
import Blackjack from './components/Blackjack';
import GoFish from './components/GoFish'
import Login from './components/Login';
import Navbar from './components/Navbar';
import Signup from './components/Signup';
import {useState, useEffect} from 'react'


function App() {

    const history = useHistory()
    const [user, setUser] = useState({id: 0, name: "", chips: 0, username: "", game_id: 0, is_turn: false})
    const [allCards, setAllCards] = useState([])
    const [gameId, setGameId] = useState(0)

    useEffect(()=>{
      if (!user.username) {
        history.push('/login')
      } else {
        history.push('/')
      }
    },[user.username])

    useEffect(()=>{
      (async()=>{
        let req = await fetch('http://localhost:4000/cards')
        let res = await req.json()
        setAllCards(res)
      })()
    },[])


if (user.username) {
  return (
    <div className="App">
      <h2>Welcome, {user.username}!</h2>
      <Navbar  setUser={setUser}/>
      <Switch>
        <Route exact path ='/'>
          <HomePage user={user} setGameId={setGameId}/>
        </Route>
        <Route exact path ='/war'>
          <War />
        </Route>
        <Route exact path ='/blackjack'>
          <Blackjack allCards={allCards}/>
        </Route>
        <Route exact path ='/go-fish/:id'>
          <GoFish user={user} gameId={gameId}/>
        </Route>
      </Switch>
    </div>
  )
} else {
    return( 
    <Switch>
       <Route exact path = '/login'>
          <Login history={history} setUser={setUser} />
        </Route>
        <Route exact path = '/signup'>
          <Signup setUser={setUser}/>
        </Route>
    </Switch>
        )
  }
}

export default App;
