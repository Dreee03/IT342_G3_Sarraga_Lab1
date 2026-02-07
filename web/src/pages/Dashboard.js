import React, {useEffect, useState} from 'react';

export default function Dashboard({token, onLogout}){
  const [user, setUser] = useState(null);
  useEffect(()=>{
    fetch('/api/user/me', {headers:{'Authorization':'Bearer '+token}})
      .then(r=>r.ok? r.json(): Promise.reject('error'))
      .then(setUser).catch(()=>setUser(null));
  },[token]);
  return (
    <div>
      <h3>Dashboard / Profile</h3>
      {user ? (<div>
        <div>Username: {user.username}</div>
        <div>Email: {user.email}</div>
      </div>) : (<div>Loading...</div>)}
      <button onClick={onLogout}>Logout</button>
    </div>
  )
}
