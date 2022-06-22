import { NavLink } from "react-router-dom"

const Navbar = ({setUser}) => {

async function handleLogout () {
    let req = await fetch('http://localhost:4000/sessions', {
        method: "DELETE"
    })
    setUser('')
}


    return(
        <div className='navbar'>
            <header>
                <div className='home-nav'>
                <NavLink to='/' exact><button>Home</button></NavLink>
                </div>
                <div className='logout-nav'>
                <button onClick={handleLogout}>Logout</button>
                </div>
            </header>
        </div>
    )
}


export default Navbar;