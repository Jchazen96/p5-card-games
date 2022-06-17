import { NavLink } from "react-router-dom"

const Navbar = ({onLogout}) => {

async function handleLogout () {
    let req = await fetch('http://localhost:4000/logout', {
        method: "DELETE"
    })
    onLogout()
}


    return(
        <div>
            <header>
                <NavLink to='/' exact>Home</NavLink>
                <button onClick={handleLogout}>Logout</button>
            </header>
        </div>
    )
}


export default Navbar;