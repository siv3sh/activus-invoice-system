#!/bin/bash

# Alternative deployment script for Render
# This ensures the frontend is properly built and included

echo "🚀 Preparing Activus Invoice System for Render deployment..."

# Check if we're in the right directory
if [ ! -d "frontend" ] || [ ! -d "backend" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

# Build frontend with npm (more reliable than yarn)
echo "📦 Building frontend with npm..."
cd frontend

# Use npm instead of yarn for better compatibility
if [ -f "package-lock.json" ]; then
    npm ci
    npm run build
else
    echo "❌ Error: package-lock.json not found"
    exit 1
fi

# Check if build was successful
if [ ! -d "build" ]; then
    echo "❌ Error: Frontend build failed"
    exit 1
fi

echo "✅ Frontend built successfully"

# Copy frontend build to backend static directory
echo "📁 Copying frontend build to backend static directory..."
cd ..
mkdir -p backend/static
rm -rf backend/static/*
cp -r frontend/build/* backend/static/

# Verify the copy was successful
if [ ! -f "backend/static/index.html" ]; then
    echo "❌ Error: index.html not found in backend/static/"
    exit 1
fi

echo "✅ Frontend copied to backend/static"

# Show what was copied
echo "📋 Contents of backend/static/:"
ls -la backend/static/

echo ""
echo "✅ Build process completed!"
echo ""
echo "🎯 Your application is now ready for single deployment!"
echo "📁 Frontend files are in: backend/static/"
echo "🚀 Deploy the backend directory to get your single URL deployment"
echo ""
echo "Next steps:"
echo "1. Commit these changes: git add backend/static/ && git commit -m 'Update frontend build'"
echo "2. Push to GitHub: git push origin main"
echo "3. Render will automatically redeploy with the correct frontend"
echo "4. Your app will be available at: https://your-app-name.onrender.com"
echo "5. Both API (/api/*) and frontend will be served from the same URL"
