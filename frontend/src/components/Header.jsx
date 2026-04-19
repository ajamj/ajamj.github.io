import { Link, useLocation } from 'react-router-dom'
import './Header.css'

function Header() {
  const location = useLocation()

  const isActive = (path) => location.pathname === path ? 'active' : ''

  return (
    <header className="header">
      <div className="header-container">
        <Link to="/" className="logo">Ajam Jamaludin</Link>
        <nav className="nav">
          <Link to="/" className={isActive('/')}>Home</Link>
          <Link to="/about" className={isActive('/about')}>About</Link>
          <Link to="/projects" className={isActive('/projects')}>Projects</Link>
          <Link to="/cv" className={isActive('/cv')}>CV</Link>
          <Link to="/blog" className={isActive('/blog')}>Blog</Link>
        </nav>
      </div>
    </header>
  )
}

export default Header