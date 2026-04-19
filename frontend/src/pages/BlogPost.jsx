import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'

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

  return (
    <div className="blog-post">
      <h1>{post.title}</h1>
      <p className="post-date">{post.date}</p>
      <div className="post-content">
        {/* Content rendered as HTML */}
        <div dangerouslySetInnerHTML={{ __html: post.content }} />
      </div>
    </div>
  )
}

export default BlogPost