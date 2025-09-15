#!/bin/bash

# Deployment script for Activus Invoice Management System
# This script handles Docker-based deployment

set -e

echo "🚀 Starting Activus Invoice Management System Deployment..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Create environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating environment file from template..."
    cp env.template .env
    echo "⚠️  Please edit .env file with your actual configuration before running again."
    echo "   Especially change the SECRET_KEY and MongoDB credentials!"
    exit 1
fi

# Create SSL directory for nginx (optional)
mkdir -p ssl

# Build and start services
echo "🔨 Building and starting services..."
docker-compose down --remove-orphans
docker-compose build --no-cache
docker-compose up -d

# Wait for services to be ready
echo "⏳ Waiting for services to start..."
sleep 10

# Check if services are running
echo "🔍 Checking service status..."
docker-compose ps

# Test backend health
echo "🏥 Testing backend health..."
if curl -f http://localhost:8001/api/health > /dev/null 2>&1; then
    echo "✅ Backend is healthy!"
else
    echo "❌ Backend health check failed!"
    echo "📋 Backend logs:"
    docker-compose logs backend
fi

echo ""
echo "🎉 Deployment completed!"
echo ""
echo "📋 Access Information:"
echo "   Frontend: http://localhost"
echo "   Backend API: http://localhost:8001"
echo "   MongoDB: localhost:27017"
echo ""
echo "📊 Useful commands:"
echo "   View logs: docker-compose logs -f"
echo "   Stop services: docker-compose down"
echo "   Restart services: docker-compose restart"
echo "   Update services: docker-compose pull && docker-compose up -d"
echo ""
echo "⚠️  Remember to:"
echo "   1. Change default passwords in MongoDB"
echo "   2. Update SECRET_KEY in .env file"
echo "   3. Configure SSL certificates for production"
echo "   4. Set up proper firewall rules"
