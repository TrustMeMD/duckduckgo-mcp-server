# Use a standard Node image
FROM node:18-slim

# Set the working directory
WORKDIR /app

# Install pnpm globally so the "prepare" script doesn't fail
RUN npm install -g pnpm

# Copy the package files
COPY package*.json ./

# Install dependencies using pnpm (since the repo expects it)
# We use --no-frozen-lockfile to bypass the error you saw earlier
RUN pnpm install --no-frozen-lockfile

# Copy the rest of the code
COPY . .

# Build the project
RUN pnpm run build

# Set the port (Railway uses this)
ENV PORT=3000

# Start the server
CMD ["node", "build/index.js"]
