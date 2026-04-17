---
title: "Disable vertical resize on contact form message box"
status: "pending"
priority: "low"
area: "design"
created: "2026-04-17"
---

## Description
The user wants to disable the vertical resizability of the message text box (textarea) in the contact form to maintain the design's layout integrity.

## Implementation Details
- Locate the `textarea` styling in `src/components/ContactForm.astro`.
- Add the CSS property `resize: none;` to the textarea styles.
- Verify that the textarea still looks correct with the other existing styles.

## Constraints
- Ensure the fix doesn't affect other text inputs if they share styles.
