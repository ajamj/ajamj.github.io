function CV() {
  return (
    <div className="cv">
      <h1>Curriculum Vitae</h1>
      <div className="cv-section">
        <h2>Education</h2>
        <div className="cv-item">
          <h3>B.Sc. Geophysics</h3>
          <p>Universitas Gadjah Mada</p>
          <p className="date">2022 - 2026</p>
        </div>
      </div>
      <div className="cv-section">
        <h2>Experience</h2>
        <div className="cv-item">
          <h3>Research Assistant</h3>
          <p>Geophysics Laboratory, UGM</p>
          <p className="date">2024 - Present</p>
        </div>
      </div>
      <a href="/cv.pdf" className="btn" download>Download CV</a>
    </div>
  )
}

export default CV