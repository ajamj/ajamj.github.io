import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { api } from '../services/api'
import DOMPurify from 'dompurify'

function BlogPost() {
  const { slug } = useParams()
  const [post, setPost] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    async function loadPost() {
      try {
        const data = await api.getPost(slug)
        setPost(data)
      } catch (err) {
        setError('Failed to load post')
        console.error(err)
      } finally {
        setLoading(false)
      }
    }
    loadPost()
  }, [slug])

  if (loading) return <div className="loading">Loading...</div>
  if (error) return <div className="error">{error}</div>
  if (!post) return <div>Post not found</div>

  const sanitizedContent = DOMPurify.sanitize(post.content)

  return (
    <div className="blog-post">
      <h1>{post.title}</h1>
      <p className="post-date">{post.date}</p>
      <div className="post-content">
        <div dangerouslySetInnerHTML={{ __html: sanitizedContent }} />
      </div>
    </div>
  )
}

export default BlogPost