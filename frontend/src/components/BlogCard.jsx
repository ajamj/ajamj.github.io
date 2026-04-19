import { Link } from 'react-router-dom'
import './BlogCard.css'

function BlogCard({ post }) {
  return (
    <div className="blog-card">
      <Link to={`/blog/${post.slug}`} className="blog-card-link">
        <h3>{post.title}</h3>
      </Link>
      <p className="blog-date">{post.date}</p>
      {post.excerpt && <p className="blog-excerpt">{post.excerpt}</p>}
      {post.tags && (
        <div className="blog-tags">
          {post.tags.map((tag, index) => (
            <span key={index} className="blog-tag">{tag}</span>
          ))}
        </div>
      )}
    </div>
  )
}

export default BlogCard