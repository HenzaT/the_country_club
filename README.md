## (In Progress) The Country Club - facts about countries and travel tracker
This is a self-directed project. I love travelling and learning geography facts, and so I wanted to create a space where the two come together. This is an ongoing project, and I plan to use it as an opportunity to practise some new technologies:
- TypeScript (in Rails)
- MySQL

## Goals
For this app, I wanted to:
- Consolidate my skills using Ruby on Rails, TypeScript and CSS3/SCSS.
- Use third-party APIs
- Introduce and use more unfamiliar technologies, like MySQL and React.js (which I am currently learning). To facilitate using React and TypeScript in a Rails application, I switched from Webpacker to using Vite.
- Set up CI/CD

## Tech Stack
- Ruby on Rails
- Vite
- HTML5
- SCSS
- JavaScript
- TypeScript
- MySQL (originally)
- PostgreSQL (deployment)
- Git
- Github

- Unsplash API
- REST Countries API


## Login
You can log in using thse details:
- username: tester@testing.com
- password: password


## Process
I started with: 
- a rough sketch of what I wanted the app to look like.
- the database schema.
- a trello board, to keep track of the features.
 
<img src="https://github.com/user-attachments/assets/8f8a0836-9f61-44f9-8902-d46254374641" width=50% height=50%><img src="https://github.com/user-attachments/assets/e4a9d07a-a979-4695-b110-bd6d859230c2" width=50% height=50%><img src="https://github.com/user-attachments/assets/dabdead3-e4c8-40de-86ad-e4e61599ddc6" width=35% height=35%>



Before beginning this project, I actually started building a separate frontend-only countries app using JavaScript, TailwindCSS and the REST Countries API a few months before this. This was a good way for me to practise using the REST Countries API, as well as an opportunity to practise using TailwindCSS. I learnt a lot about refactoring JavaScript to reduce repetition here, which helped me a lot when building my portfolio. Ultimately however, I decided that:
- I'd need to scale up this project and would need a backend.
- I would use SCSS instead of TailwindCSS, as I wanted to retain more control over styling and build fluency using CSS.

<img src="https://github.com/user-attachments/assets/1b75e23b-443f-499a-9a07-befa557baa40" width=60% height=60%><img src="https://github.com/user-attachments/assets/04ad539c-c7ce-4d6d-b12f-d46bda6afad9" width=50% height=50%>


## Reflections
Before starting, I debated whether to build a project entirely with new technologies, like React.js, or to stick with familiar tools while introducing a few new ones. Drawing from the concept of the Zone of Proximal Development, which suggests people learn best when challenged just beyond their comfort zone, I chose the latter. This approach let me focus on learning technologies like MySQL without being overwhelmed, since the rest of the stack was familiar.
I initially used MySQL to explore working with different relational databases. However, when deploying to Heroku, I switched to PostgreSQL as it’s better supported on the platform. This experience helped me understand the importance of deployment considerations when choosing tools.

## Future Additions
