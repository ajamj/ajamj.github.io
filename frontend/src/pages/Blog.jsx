import { useState, useEffect } from 'react'
import { api } from '../services/api'
import BlogCard from '../components/BlogCard'

function Blog() {
  const [posts, setPosts] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    async function loadPosts() {
      try {
        const data = await api.getPosts()
        setPosts(data)
      } catch (err) {
        setError('Failed to load blog posts')
        console.error(err)
      } finally {
        setLoading(false)
      }
    }
    loadPosts()
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