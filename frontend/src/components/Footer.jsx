import './Footer.css'

function Footer() {
  const currentYear = new Date().getFullYear();
  const timestamp = new Date().toISOString().split('T')[0];

  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-info">
          <div className="hud-label">SYSTEM_LITHOSPHERE_ACTIVE</div>
          <p>&copy; {currentYear} AJAM JAMALUDIN | {timestamp}</p>
          <span className="academic-affiliation">DEPARTMENT OF GEOPHYSICS | UGM</span>
        </div>
        <div className="footer-links">
          <a href="https://github.com/ajamj" target="_blank" rel="noopener noreferrer" className="hud-label">GITHUB</a>
          <a href="https://linkedin.com/in/ajamj" target="_blank" rel="noopener noreferrer" className="hud-label">LINKEDIN</a>
          <a href="mailto:ajamj@email.com" className="hud-label">EMAIL</a>
        </div>
      </div>
    </footer>
  )
}

export default Footer
