import { Link } from 'react-router-dom'
import Hero from '../components/Hero'

function Home() {
  return (
    <div className="home">
      <Hero />
      <section className="featured-section">
        <h2>Featured Work</h2>
        <p>Geophysics research and seismic data processing projects.</p>
        <Link to="/projects" className="btn">View Projects</Link>
      </section>
    </div>
  )
}

export default Home