import React, {useState} from 'react';
import Register from './pages/Register';
import Login from './pages/Login';
import Dashboard from './pages/Dashboard';

export default function App(){
  const [token, setToken] = useState(localStorage.getItem('token'));
  return (
    <div style={{padding:20}}>
      <h2>Sarraga Web</h2>
      {!token ? (
        <div>
          <Register />
          <hr />
          <Login onLogin={(t)=>{ setToken(t); localStorage.setItem('token', t); window.location.reload(); }} />
        </div>
      ) : (
        <Dashboard token={token} onLogout={() => { localStorage.removeItem('token'); setToken(null); window.location.reload(); }} />
      )}
    </div>
  )
}
