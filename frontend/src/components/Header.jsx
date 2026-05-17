import { Link, useLocation } from 'react-router-dom'
import './Header.css'

function Header() {
  const location = useLocation()
  const isActive = (path) => location.pathname === path ? 'active' : ''

  return (
    <header className="header glass-card">
      <div className="header-container">
        <div className="logo-group">
          <Link to="/" className="logo">Ajam Jamaludin</Link>
          <span className="hud-label">LITHOSPHERE_v1.0</span>
        </div>
        <nav className="nav">
          <Link to="/" className={isActive('/')}>HOME</Link>
          <Link to="/about" className={isActive('/about')}>ABOUT</Link>
          <Link to="/projects" className={isActive('/projects')}>PROJECTS</Link>
          <Link to="/cv" className={isActive('/cv')}>CV</Link>
          <Link to="/blog" className={isActive('/blog')}>BLOG</Link>
        </nav>
      </div>
    </header>
  )
}

export default Header
