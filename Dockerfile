# Use a standard Node image
FROM node:18-slim

# Set the working directory
WORKDIR /app

# Copy the package files
COPY package*.json ./

# Install dependencies (ignoring the pnpm lockfile)
RUN npm install

# Copy the rest of the code
COPY . .

# Build the project
RUN npm run build

# Set the environment to SSE (required for HuggingFace/Web)
ENV PORT=3000

# Start the server
CMD ["node", "build/index.js"]
