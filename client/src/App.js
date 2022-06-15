import './App.css';
import {Route, Switch} from 'react-router-dom'
import HomePage from './components/HomePage';
import War from './components/War';
import Blackjack from './components/Blackjack';
import GoFish from './components/GoFish'
import Login from './components/Login';
import Navbar from './components/Navbar';
import {useState, useEffect} from 'react'


function App() {

    const [user, setUser] = useState(null)
    const [allCards, setAllCards] = useState([])


    useEffect(() => {
      fetch("http://localhost:4000/me").then((response) => {
        if (response.ok) {
          response.json().then((user) => setUser(user));
        }
      });
    }, []);

    useEffect(()=>{
      (async()=>{
        let req = await fetch('http://localhost:4000/cards')
        let res = await req.json()
        setAllCards(res)
      })()
    },[])

    console.log(allCards)

if (user) {
  return (
    <div className="App">
      <h2>Welcome, {user.username}!</h2>
      <Navbar />
      <Switch>
        <Route exact path ='/'>
          <HomePage />
        </Route>
        <Route exact path = '/login'>
          <Login />
        </Route>
        <Route exact path ='/war'>
          <War />
        </Route>
        <Route exact path ='/blackjack'>
          <Blackjack allCards={allCards}/>
        </Route>
        <Route exact path ='/go-fish'>
          <GoFish />
        </Route>
      </Switch>


    </div>
  )} else {
    return( <Login onLogin={setUser} onLogout={setUser} />)
  }
}

export default App;
