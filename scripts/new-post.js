import fs from 'fs';
import path from 'path';

const title = process.argv[2];

if (!title) {
  console.error('Please provide a title: npm run new-post "Your Blog Title"');
  process.exit(1);
}

const slug = title
  .toLowerCase()
  .replace(/[^\w\s-]/g, '')
  .replace(/[\s_-]+/g, '-')
  .replace(/^-+|-+$/g, '');

const date = new Date().toISOString().split('T')[0];
const fileName = `${slug}.md`;
const filePath = path.join(process.cwd(), 'src/content/blog', fileName);

const template = `---
title: "${title}"
description: "A brief summary of your research or insight."
date: ${date}
tags: ["RESEARCH", "GEOPHYSICS"]
---

Start writing your technical insights here...
`;

if (fs.existsSync(filePath)) {
  console.error(`Error: File ${fileName} already exists!`);
  process.exit(1);
}

fs.writeFileSync(filePath, template);
console.log(`\x1b[32m✔ Success!\x1b[0m Blog post created at: src/content/blog/${fileName}`);
