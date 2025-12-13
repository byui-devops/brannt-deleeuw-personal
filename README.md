Final Project: Bulletin Board with Categories
✅ Overview
This application is a simple Bulletin Board that organizes posts by categories, making it easy to filter and manage content. Built with Node.js/Express, containerized using Docker, and deployed to AWS EC2 via Terraform and GitHub Actions.

🚀 Features

Create, list, and filter posts by category
Health check endpoint for monitoring
Fully automated CI/CD pipeline:

Build pipeline: Runs tests, builds Docker image, pushes to Docker Hub
Release pipeline: Deploys to AWS EC2 using Terraform




🔗 Key URLs

GitHub Repo: brannt-deleeuw-personal-Final-Project
Docker Hub Image: brannt11/brannt-deleeuw-finalproject



🛠 Endpoints








































MethodEndpointDescriptionGET/Home pageGET/healthHealth checkGET/postsList all postsPOST/postsCreate a new postGET/posts?category=...Filter posts by categoryGET/posts/:idRetrieve a specific post

🐳 Docker Commands
Shell# Build imagedocker build -t team-app:latest .# Tag for Docker Hubdocker tag team-app:latest docker.io/brannt11/brannt-deleeuw-finalproject:latest# Login with PATdocker login -u brannt11# Push imagedocker push docker.io/brannt11/brShow more lines

✅ Deployment Steps

Push code to GitHub main branch → triggers build pipeline
Create a GitHub Release → triggers release pipeline
Terraform provisions EC2 and deploys container
Copy app_url from workflow logs and verify / and /health
