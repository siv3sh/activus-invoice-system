# 🚀 Backend-Only Deployment Guide

## 🎯 **Deploy Backend to Render (API Service)**

### Step 1: Create Backend Service on Render

1. **Go to [render.com](https://render.com)**
2. **Sign up/Login** with GitHub
3. **New Web Service**:
   - Connect your GitHub repository
   - Name: `activus-invoice-backend`
   - Environment: `Python 3`
   - **Build Command**: `pip install -r backend/requirements.txt`
   - **Start Command**: `cd backend && python server.py`
   - **Plan**: `Free`

### Step 2: Environment Variables

Set these in your Render dashboard:

```
MONGO_URL=mongodb+srv://username:password@cluster.mongodb.net/
DB_NAME=activus_invoice_db
SECRET_KEY=your_super_secret_key_change_this
PORT=10000
```

### Step 3: Deploy

- Click **"Create Web Service"**
- Wait for deployment (2-3 minutes)
- Your API will be available at: `https://activus-invoice-backend.onrender.com`

---

## 🌐 **Frontend on Vercel**

### Step 1: Deploy Frontend to Vercel

1. **Go to [vercel.com](https://vercel.com)**
2. **Import project** from GitHub
3. **Configure**:
   - Framework: `Other`
   - Build Command: `cd frontend && npm run build`
   - Output Directory: `frontend/build`
   - Install Command: `cd frontend && npm install`

### Step 2: Update API Endpoints

In your frontend code, update API calls to point to your Render backend:

```javascript
// Change from:
const API_BASE = 'http://localhost:8001/api'

// To:
const API_BASE = 'https://activus-invoice-backend.onrender.com/api'
```

---

## 🔧 **Backend Configuration**

The backend is now configured as:
- ✅ **API-only service** (no static files)
- ✅ **CORS enabled** for all origins
- ✅ **MongoDB Atlas ready**
- ✅ **Health check endpoint**: `/api/health`

---

## 📋 **API Endpoints**

Your backend will provide these endpoints:
- `GET /api/health` - Health check
- `GET /docs` - API documentation
- `POST /api/auth/login` - User authentication
- `GET /api/invoices` - Get invoices
- `POST /api/invoices` - Create invoice
- And all other API endpoints...

---

## 🎉 **Result**

- **Frontend**: `https://your-app.vercel.app` (Vercel)
- **Backend**: `https://activus-invoice-backend.onrender.com` (Render)
- **API Docs**: `https://activus-invoice-backend.onrender.com/docs`

---

## 🔗 **Next Steps**

1. Deploy backend to Render
2. Update frontend API endpoints
3. Test the connection
4. Your full-stack app is live! 🚀
