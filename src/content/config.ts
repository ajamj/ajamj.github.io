import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
	type: 'content',
	schema: z.object({
		title: z.string(),
		description: z.string().optional(),
		date: z.coerce.date(),
		author: z.string().default('Ajam Jamaludin'),
		tags: z.array(z.string()).default([]),
		image: z.string().optional(),
	}),
});

export const collections = { blog };
