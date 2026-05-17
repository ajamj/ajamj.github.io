import './ProjectCard.css'

function ProjectCard({ project }) {
  return (
    <div className="project-card glass-card card-hover">
      <div className="card-hud hud-label">PROJECT_ID: {project.id || 'N/A'}</div>
      {project.image && (
        <div className="card-image-wrapper">
          <img src={project.image} alt={project.title} className="project-image" />
        </div>
      )}
      <div className="project-content">
        <h3>{project.title}</h3>
        <p>{project.description}</p>
        {project.tech_stack && (
          <div className="tech-stack">
            {project.tech_stack.map((tech, index) => (
              <span key={index} className="tech-tag">{tech}</span>
            ))}
          </div>
        )}
        <div className="card-footer">
          {project.link ? (
            <a href={project.link} target="_blank" rel="noopener noreferrer" className="btn btn-outline btn-small">
              EXPLORE_DATA
            </a>
          ) : (
            <span className="hud-label">STATUS: ARCHIVED</span>
          )}
        </div>
      </div>
    </div>
  )
}

export default ProjectCard
