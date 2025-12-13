
# Use the official Node.js image as the base
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first for better layer caching
COPY package*.json ./

# Install dependencies; use npm ci for reproducible builds with lockfile
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Environment & port
ENV NODE_ENV=production
ENV PORT=8080

# Expose port 8080
EXPOSE 8080

# Optional healthcheck (uncomment ONE of these)
# HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
#   CMD node -e "fetch('http://localhost:8080/health').then(r=>{if(!r.ok)process.exit(1)}).catch(()=>process.exit(1))"

# HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
#   CMD node -e "require('http').get('http://localhost:8080/health',res=>{if(res.statusCode<200||res.statusCode>=300)process.exit(1)}).on('error',()=>process.exit(1))"

# Start the application via npm (package.json should have: "start": "node server.js")
CMD ["npm",


