import {useState} from 'react'

const Signup = ({setUser}) => {

    const [formData, setFormData] = useState({username: '', password:'', password_confirmation:''})

    const handleSubmit = async (e) => {
        e.preventDefault()
        let req = await fetch('http://localhost:4000/signup', {
            method: "POST",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(formData)
        })
        let signupRes = await req.json()
        let req2 = await fetch('http://localhost:4000/sessions', {
          method: "POST",
          headers: {'Content-Type': 'application/json'},
          body: JSON.stringify(
            {
                username: signupRes.username, password: formData.password
            }
            )
      })
      let res = await req2.json()
        if (res.username) {
            setUser(prevState=> ({...prevState, username: res.username}))
            }
            else {
              alert(res.error)
            }
    }

  

    return(
        <div className='signup'>
            <h1 className='signup-title'>Signup</h1>
            <form onSubmit={handleSubmit}>
                <input type='text' placeholder='Username' onChange={(e)=>{setFormData({...formData, username:e.target.value})}}></input>
                <input type='password' placeholder='Password' onChange={(e)=>{setFormData({...formData, password:e.target.value})}}></input><br/>
                <input type='password' placeholder='Confirm Password' onChange={(e)=>{setFormData({...formData, password_confirmation:e.target.value})}}></input><br/>
                <input type='submit'></input>
            </form>
        </div>
    )
}

export default Signup;