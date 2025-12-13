const express = require('express');
const app = express();

// Use PORT from environment (defaults to 8080)
const PORT = process.env.PORT || 8080;

// Parse JSON request bodies
app.use(express.json());

// ---- In-memory posts (demo) ----
// For a real app, you can persist to a JSON file or database later.
let posts = [
  {
    id: 1,
    title: 'Welcome',
    body: 'First post!',
    category: 'general',
    votes: 0,
    createdAt: new Date().toISOString(),
  },
];

// ---- Routes ----

// Home page
app.get('/', (req, res) => {
  res.send('<h1>Bulletin Board App (with Categories) is Running!</h1>');
});

// Health check
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

// Create a post
// Body: { "title": "...", "body": "...", "category": "general|projects|news|..." }
app.post('/posts', (req, res) => {
  const { title, body, category = 'general' } = req.body || {};
  if (!title || !body) {
    return res.status(400).json({ error: 'title and body are required' });
  }
  const post = {
    id: posts.length ? Math.max(...posts.map(p => p.id)) + 1 : 1,
    title,
    body,
    category,
    votes: 0,
    createdAt: new Date().toISOString(),
  };
  posts.push(post);
  return res.status(201).json(post);
});

// List posts (optional filter by ?category=general)
app.get('/posts', (req, res) => {
  const { category } = req.query;
  const result = category ? posts.filter(p => p.category === category) : posts;
  return res.json(result);
});

// Get one post by id
app.get('/posts/:id', (req, res) => {
  const id = Number(req.params.id);
  const post = posts.find(p => p.id === id);
  if (!post) return res.status(404).json({ error: 'not found' });
  return res.json(post);
});

// Optional: update a post (title/body/category)
app.patch('/posts/:id', (req, res) => {
  const id = Number(req.params.id);
  const post = posts.find(p => p.id === id);
  if (!post) return res.status(404).json({ error: 'not found' });

  const { title, body, category } = req.body || {};
  if (title !== undefined) post.title = title;
  if (body !== undefined) post.body = body;
  if (category !== undefined) post.category = category;

  return res.json(post);
});

// Optional: delete a post
app.delete('/posts/:id', (req, res) => {
  const id = Number(req.params.id);
  const before = posts.length;
  posts = posts.filter(p => p.id !==  posts = posts.filter(p => p.id !== id);
  if (posts.length === before) return res.status(404).json({ error: 'not found' });
  return res.status(204).send();
});

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

// Export for tests (optional)


