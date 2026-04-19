import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import DOMPurify from 'dompurify'

function BlogPost() {
  const { slug } = useParams()
  const [post, setPost] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    // Will fetch from API in Phase 10
    setPost(null)
    setLoading(false)
  }, [slug])

  if (loading) return <div>Loading...</div>
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