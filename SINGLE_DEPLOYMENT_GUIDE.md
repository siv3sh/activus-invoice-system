# 🚀 Single Deployment Guide for Activus Invoice System

## Overview
This guide will help you deploy your Activus Invoice System as a **single application** with one URL that serves both the backend API and frontend.

## 🎯 What You'll Get
- **Single URL**: `https://your-app-name.onrender.com`
- **API Endpoints**: `https://your-app-name.onrender.com/api/*`
- **Frontend**: `https://your-app-name.onrender.com/` (serves React app)
- **No CORS issues**: Everything served from the same domain

## 📋 Prerequisites
- GitHub repository with your code
- Render account (free)
- MongoDB Atlas database (free)

## 🛠️ Step-by-Step Deployment

### 1. Prepare Your Repository

First, run the build script to prepare your application:

```bash
# In your project root directory
./build_single_deployment.sh
```

This will:
- Build your React frontend
- Copy the build files to `backend/static/`
- Prepare everything for single deployment

### 2. Deploy to Render

#### Option A: Using Docker (Recommended)

1. **Go to [Render Dashboard](https://dashboard.render.com)**
2. **Click "New +" → "Web Service"**
3. **Connect your GitHub repository**
4. **Configure the service**:
   - **Name**: `activus-invoice-system`
   - **Environment**: `Docker`
   - **Dockerfile Path**: `./Dockerfile` (use the existing Dockerfile)
   - **Auto-Deploy**: `Yes`

#### Option B: Using Build Commands

1. **Go to [Render Dashboard](https://dashboard.render.com)**
2. **Click "New +" → "Web Service"**
3. **Connect your GitHub repository**
4. **Configure the service**:
   - **Name**: `activus-invoice-system`
   - **Environment**: `Python 3`
   - **Build Command**: 
     ```bash
     cd frontend && yarn install && yarn build && cd .. && cp -r frontend/build backend/static && cd backend && pip install -r requirements.txt
     ```
   - **Start Command**: `cd backend && python server.py`
   - **Auto-Deploy**: `Yes`

### 3. Set Environment Variables

In your Render service settings, add these environment variables:

```bash
MONGO_URL=mongodb+srv://username:password@cluster.mongodb.net/
DB_NAME=activus_invoice_db
SECRET_KEY=your_very_secure_secret_key_here
PORT=10000
```

### 4. Deploy

Click **"Create Web Service"** and wait for deployment to complete.

## 🎉 Success!

Once deployed, your application will be available at:
- **Main App**: `https://your-app-name.onrender.com`
- **API Docs**: `https://your-app-name.onrender.com/api/docs`
- **Health Check**: `https://your-app-name.onrender.com/api/health`

## 🔧 Local Testing

To test locally before deploying:

```bash
# Build the application
./build_single_deployment.sh

# Run the backend (which now serves frontend too)
cd backend
python server.py
```

Visit `http://localhost:8001` to see your full application.

## 📁 Project Structure After Build

```
backend/
├── static/           # Frontend build files (copied from frontend/build/)
│   ├── index.html
│   ├── static/
│   └── ...
├── server.py         # Modified to serve static files
├── requirements.txt
└── ...
```

## 🚨 Important Notes

1. **Build Process**: Always run `./build_single_deployment.sh` before deploying
2. **Static Files**: The frontend build is copied to `backend/static/`
3. **Routing**: All non-API routes serve the React app
4. **API Routes**: All `/api/*` routes go to the FastAPI backend
5. **Environment**: Make sure all environment variables are set in Render

## 🔄 Updating Your Deployment

1. Make changes to your code
2. Run `./build_single_deployment.sh`
3. Commit and push to GitHub
4. Render will automatically redeploy

## 🆘 Troubleshooting

### Frontend not loading
- Check if `backend/static/index.html` exists
- Verify the build script ran successfully
- Check Render build logs

### API not working
- Verify environment variables are set
- Check MongoDB connection
- Look at Render service logs

### Build fails
- Ensure all dependencies are in `requirements.txt`
- Check if frontend build completed successfully
- Verify file permissions

## 🎯 Benefits of Single Deployment

✅ **One URL** - No need to manage separate domains  
✅ **No CORS** - Same-origin requests  
✅ **Simpler** - One deployment to manage  
✅ **Cost-effective** - Only one service to pay for  
✅ **Better Performance** - No cross-domain requests  

Your Activus Invoice System is now ready for single deployment! 🚀
