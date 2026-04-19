import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { api } from '../services/api'
import ProjectCard from '../components/ProjectCard'

function Home() {
  const [featuredProjects, setFeaturedProjects] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function loadFeatured() {
      try {
        const projects = await api.getProjects()
        // Show first 3 projects as featured
        setFeaturedProjects(projects.slice(0, 3))
      } catch (err) {
        console.error('Failed to load featured projects', err)
      } finally {
        setLoading(false)
      }
    }
    loadFeatured()
  }, [])

  return (
    <div className="home">
      <section className="hero">
        <h1>Ajam Jamaludin</h1>
        <p className="tagline">Geophysics Researcher | Seismology | Data Science</p>
        <p className="intro">
          Junior geophysics researcher specializing in seismic data processing
          and earthquake monitoring. Currently at Universitas Gadjah Mada.
        </p>
        <div className="hero-links">
          <Link to="/projects" className="btn">View My Work</Link>
          <Link to="/about" className="btn btn-outline">Learn More</Link>
        </div>
      </section>

      <section className="featured-section">
        <h2>Featured Projects</h2>
        {loading ? (
          <p>Loading...</p>
        ) : featuredProjects.length > 0 ? (
          <div className="projects-grid">
            {featuredProjects.map(project => (
              <ProjectCard key={project.id} project={project} />
            ))}
          </div>
        ) : (
          <p>No projects yet.</p>
        )}
        <Link to="/projects" className="view-all">View All Projects →</Link>
      </section>
    </div>
  )
}

export default Home