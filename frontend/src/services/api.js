const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:8000/api'

async function fetchAPI(endpoint, options = {}) {
  const url = `${API_URL}${endpoint}`
  
  const config = {
    headers: {
      'Content-Type': 'application/json',
      ...options.headers,
    },
    ...options,
  }

  try {
    const response = await fetch(url, config)
    
    if (!response.ok) {
      throw new Error(`API Error: ${response.status}`)
    }
    
    return await response.json()
  } catch (error) {
    console.error(`API call failed: ${endpoint}`, error)
    throw error
  }
}

// API methods
export const api = {
  // Projects
  getProjects: () => fetchAPI('/projects/'),
  getProject: (id) => fetchAPI(`/projects/${id}/`),
  
  // Blog
  getPosts: () => fetchAPI('/blog/'),
  getPost: (slug) => fetchAPI(`/blog/${slug}/`),
  
  // Contact
  submitContact: (data) => 
    fetchAPI('/contact/', {
      method: 'POST',
      body: JSON.stringify(data),
    }),
  
  // Skills
  getSkills: () => fetchAPI('/skills/'),
}