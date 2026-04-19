import { useState, useEffect } from 'react'
import BlogCard from '../components/BlogCard'

function Blog() {
  const [posts, setPosts] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    // Will fetch from API in Phase 10
    setPosts([])
    setLoading(false)
  }, [])

  return (
    <div className="blog">
      <h1>Blog</h1>
      {loading ? (
        <p>Loading...</p>
      ) : posts.length === 0 ? (
        <p>No posts yet. Check back soon!</p>
      ) : (
        <div className="blog-grid">
          {posts.map(post => (
            <BlogCard key={post.id} post={post} />
          ))}
        </div>
      )}
    </div>
  )
}

export default Blog