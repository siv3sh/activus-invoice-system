#!/bin/bash

# Build script for single deployment
echo "🚀 Building Activus Invoice System for single deployment..."

# Check if we're in the right directory
if [ ! -d "frontend" ] || [ ! -d "backend" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

# Build frontend
echo "📦 Building frontend..."
cd frontend
if [ -f "yarn.lock" ]; then
    yarn install
    yarn build
else
    npm install
    npm run build
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

echo "✅ Frontend copied to backend/static"

# Create a simple index.html redirect for root path
echo "📄 Creating root redirect..."
cat > backend/static/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta name="description" content="Activus Invoice Management System" />
    <title>Activus Invoice System</title>
    <script>
        // Redirect to the actual React app
        window.location.href = '/';
    </script>
</head>
<body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root">
        <h1>Loading Activus Invoice System...</h1>
        <p>If you see this message, please refresh the page.</p>
    </div>
</body>
</html>
EOF

echo "✅ Build process completed!"
echo ""
echo "🎯 Your application is now ready for single deployment!"
echo "📁 Frontend files are in: backend/static/"
echo "🚀 Deploy the backend directory to get your single URL deployment"
echo ""
echo "Next steps:"
echo "1. Deploy the backend directory to Render"
echo "2. Your app will be available at: https://your-app-name.onrender.com"
echo "3. Both API (/api/*) and frontend will be served from the same URL"
