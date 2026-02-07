import React, {useState} from 'react';

export default function Register(){
  const [form, setForm] = useState({username:'', password:'', email:''});
  const [msg, setMsg] = useState('');
  const submit = async e => {
    e.preventDefault();
    const res = await fetch('/api/auth/register', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify(form)});
    if (res.ok) setMsg('Registered successfully'); else setMsg('Registration failed');
  }
  return (
    <div>
      <h3>Register</h3>
      <form onSubmit={submit}>
        <input placeholder="username" value={form.username} onChange={e=>setForm({...form, username:e.target.value})} /> <br />
        <input placeholder="email" value={form.email} onChange={e=>setForm({...form, email:e.target.value})} /> <br />
        <input placeholder="password" type="password" value={form.password} onChange={e=>setForm({...form, password:e.target.value})} /> <br />
        <button type="submit">Register</button>
      </form>
      <div>{msg}</div>
    </div>
  )
}
