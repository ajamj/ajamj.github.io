import { useState } from 'react'
import { api } from '../services/api'
import './ContactForm.css'

function ContactForm() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    message: ''
  })
  const [status, setStatus] = useState('idle') // idle, submitting, success, error
  const [errorMessage, setErrorMessage] = useState('')

  const handleChange = (e) => {
    const { name, value } = e.target
    setFormData(prev => ({ ...prev, [name]: value }))
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    setStatus('submitting')
    setErrorMessage('')

    try {
      await api.submitContact(formData)
      setStatus('success')
      setFormData({ name: '', email: '', message: '' })
    } catch (error) {
      setStatus('error')
      setErrorMessage('Failed to send message. Please try again.')
    }
  }

  if (status === 'success') {
    return (
      <div className="contact-success">
        <h3>Message Sent!</h3>
        <p>Thank you for your message. I'll get back to you soon.</p>
        <button onClick={() => setStatus('idle')} className="btn">
          Send Another Message
        </button>
      </div>
    )
  }

  return (
    <form className="contact-form" onSubmit={handleSubmit}>
      <div className="form-group">
        <label htmlFor="name">Name</label>
        <input
          type="text"
          id="name"
          name="name"
          value={formData.name}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="email">Email</label>
        <input
          type="email"
          id="email"
          name="email"
          value={formData.email}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="message">Message</label>
        <textarea
          id="message"
          name="message"
          value={formData.message}
          onChange={handleChange}
          rows="5"
          required
        />
      </div>

      <button type="submit" disabled={status === 'submitting'}>
        {status === 'submitting' ? 'Sending...' : 'Send Message'}
      </button>

      {status === 'success' && (
        <p className="form-success">Message sent successfully!</p>
      )}

      {status === 'error' && (
        <p className="form-error">Failed to send message. Please try again.</p>
      )}
    </form>
  )
}

export default ContactForm