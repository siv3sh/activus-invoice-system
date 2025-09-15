# 🚀 Render Deployment Checklist

## ✅ Completed Steps:
- [x] GitHub repository created: https://github.com/siv3sh/activus-invoice-system.git
- [x] Code pushed to GitHub
- [x] Docker configuration ready

## 🔄 Next Steps:

### 1. Create MongoDB Database on Render:
- Go to Render Dashboard
- Click "New +" → "PostgreSQL" (or use MongoDB Atlas)
- Name: `activus-mongodb`
- Plan: Free
- Copy the connection string

### 2. Create Web Service:
- Click "New +" → "Web Service"
- Connect GitHub repo: `siv3sh/activus-invoice-system`
- Configure:
  - Name: `activus-invoice-system`
  - Environment: `Docker`
  - Branch: `main`
  - Dockerfile Path: `Dockerfile`
  - Plan: `Free`

### 3. Environment Variables:
```
MONGO_URL=mongodb://your-mongodb-connection-string
DB_NAME=activus_invoice_db
SECRET_KEY=activus_super_secret_key_2024_render_deployment_xyz789
```

### 4. Deploy:
- Click "Create Web Service"
- Wait for deployment (5-10 minutes)
- Your app will be available at: `https://activus-invoice-system.onrender.com`

## 🎯 Expected Result:
- Frontend: https://activus-invoice-system.onrender.com
- API Docs: https://activus-invoice-system.onrender.com/docs
- Backend API: https://activus-invoice-system.onrender.com/api

## 🔧 Troubleshooting:
- If deployment fails, check the logs in Render dashboard
- Make sure MongoDB connection string is correct
- Verify all environment variables are set
