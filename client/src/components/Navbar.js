const Navbar = () => {

    const handleLogout = ({onLogout}) => {
        fetch("http://localhost:4000/logout", {
            method: "DELETE",
          }).then(() => onLogout(null));
    }

    return(
        <div>
            <header>
                <button onClick={handleLogout}>Logout</button>
            </header>
        </div>
    )
}


export default Navbar;