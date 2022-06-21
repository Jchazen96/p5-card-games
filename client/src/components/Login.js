import {useState} from 'react'



const Login = ({setUser, history}) => {

    const [formData, setFormData] = useState({username: '', password: ''})

    const signupClick = () => {
      history.push('/signup')
    }


    const handleSubmit = async (e) => {
      e.preventDefault()
      let req = await fetch('http://localhost:4000/sessions', {
          method: "POST",
          headers: {'Content-Type': 'application/json'},
          body: JSON.stringify(formData)
      })
      let res = await req.json()
      if (res) {
        console.log(res)
      setUser(res)
      }
      else {
        alert(res.error)
      }
    }

    return(
        <div>
            <form onSubmit={handleSubmit}>
      <input type="text" placeholder='Username' onChange={(e) => setFormData({...formData, username:e.target.value})}/>
      <input type='password' placeholder='Password' onChange={(e) => setFormData({...formData, password:e.target.value})} />
      <button type="submit">Login</button>
    </form>
    <div>
      <button onClick={signupClick}>Sign Up</button>
    </div>
        </div>
    )
}

export default Login;