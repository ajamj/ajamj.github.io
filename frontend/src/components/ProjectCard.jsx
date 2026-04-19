import './ProjectCard.css'

function ProjectCard({ project }) {
  return (
    <div className="project-card">
      {project.image && (
        <img src={project.image} alt={project.title} className="project-image" />
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
        {project.link && (
          <a href={project.link} target="_blank" rel="noopener noreferrer" className="project-link">
            View Project
          </a>
        )}
      </div>
    </div>
  )
}

export default ProjectCard