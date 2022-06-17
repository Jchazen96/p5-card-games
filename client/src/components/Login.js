import {useState} from 'react'



const Login = ({onLogin}) => {

    const [username, setUsername] = useState('')
   

    const handleSubmit = (e) => {
        e.preventDefault();
        fetch("http://localhost:4000/login", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ username }),
        })
          .then((r) => r.json())
          .then((user) => onLogin(user));
      }

    return(
        <div>
            <form onSubmit={handleSubmit}>
      <input
        type="text"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
      />
      <button type="submit">Login</button>
    </form>
        </div>
    )
}

export default Login;