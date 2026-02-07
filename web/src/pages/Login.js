import React, {useState} from 'react';

export default function Login({onLogin}){
  const [form, setForm] = useState({username:'', password:''});
  const [msg, setMsg] = useState('');
  const submit = async e => {
    e.preventDefault();
    const res = await fetch('/api/auth/login', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify(form)});
    if (res.ok){
      const data = await res.json();
      onLogin(data.token);
    } else setMsg('Login failed');
  }
  return (
    <div>
      <h3>Login</h3>
      <form onSubmit={submit}>
        <input placeholder="username" value={form.username} onChange={e=>setForm({...form, username:e.target.value})} /> <br />
        <input placeholder="password" type="password" value={form.password} onChange={e=>setForm({...form, password:e.target.value})} /> <br />
        <button type="submit">Login</button>
      </form>
      <div>{msg}</div>
    </div>
  )
}
