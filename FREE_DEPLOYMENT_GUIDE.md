# 🚀 Free Deployment Guide for Activus Invoice System

## 🎯 **Recommended: Render (Easiest)**

### Step 1: Setup MongoDB Atlas (Free)
1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Sign up for free account
3. Create a new cluster (M0 Sandbox - Free)
4. Create database user
5. Get connection string: `mongodb+srv://username:password@cluster.mongodb.net/`

### Step 2: Deploy on Render
1. **Sign up** at [render.com](https://render.com)
2. **Connect GitHub** account
3. **New Web Service**:
   - Connect your repository
   - Name: `activus-invoice-system`
   - Environment: `Python 3`
   - Build Command: `pip install -r backend/requirements.txt && cd frontend && npm install && npm run build`
   - Start Command: `cd backend && python server.py`
   - Plan: `Free`

4. **Environment Variables**:
   ```
   MONGO_URL=mongodb+srv://username:password@cluster.mongodb.net/
   DB_NAME=activus_invoice_db
   SECRET_KEY=your_super_secret_key_change_this
   PORT=10000
   ```

5. **Deploy** - Click "Create Web Service"

### Step 3: Access Your App
- Your app will be available at: `https://activus-invoice-system.onrender.com`
- First load may take 30-60 seconds (cold start)

---

## 🚀 **Alternative: Railway**

### Step 1: Deploy on Railway
1. Go to [railway.app](https://railway.app)
2. Sign up with GitHub
3. Click "New Project" → "Deploy from GitHub repo"
4. Select your repository
5. Add MongoDB service:
   - Click "+" → "Database" → "MongoDB"
   - Railway will provide connection string

### Step 2: Configure Environment
```
MONGO_URL=<railway-provided-connection-string>
DB_NAME=activus_invoice_db
SECRET_KEY=your_super_secret_key_change_this
PORT=10000
```

---

## 🌐 **Frontend Only: Vercel**

### Step 1: Deploy Frontend
1. Go to [vercel.com](https://vercel.com)
2. Import your GitHub repository
3. Configure:
   - Framework: Other
   - Build Command: `cd frontend && yarn build`
   - Output Directory: `frontend/build`
   - Install Command: `cd frontend && yarn install`

### Step 2: Deploy Backend Separately
- Use Render or Railway for backend
- Update frontend API calls to point to backend URL

---

## 🐳 **Docker: Fly.io**

### Step 1: Install Fly CLI
```bash
curl -L https://fly.io/install.sh | sh
```

### Step 2: Deploy
```bash
fly auth login
fly launch
fly deploy
```

---

## 📊 **Platform Comparison**

| Platform | Free Tier | Database | Ease | Best For |
|----------|-----------|----------|------|----------|
| **Render** | ✅ 750 hrs/month | ✅ MongoDB Atlas | ⭐⭐⭐⭐⭐ | Full-stack apps |
| **Railway** | ✅ $5 credit | ✅ Built-in MongoDB | ⭐⭐⭐⭐ | Simple deployment |
| **Vercel** | ✅ Unlimited | ❌ External only | ⭐⭐⭐ | Frontend + API |
| **Fly.io** | ✅ 3 apps | ✅ External only | ⭐⭐ | Docker apps |
| **Firebase** | ✅ 10GB | ❌ External only | ⭐⭐⭐ | Static sites |

---

## 🔧 **Troubleshooting**

### Common Issues:

1. **Build Fails**:
   - Check Node.js version (needs 20+)
   - Verify all dependencies in requirements.txt

2. **Database Connection Error**:
   - Verify MongoDB Atlas connection string
   - Check network access settings
   - Ensure database user has correct permissions

3. **App Sleeps**:
   - Render free tier sleeps after 15 minutes of inactivity
   - First request after sleep takes 30-60 seconds
   - Consider upgrading to paid plan for always-on

4. **Port Issues**:
   - Always use `PORT` environment variable
   - Render uses port 10000
   - Railway uses dynamic ports

---

## 🎉 **Success Checklist**

- [ ] MongoDB Atlas cluster created
- [ ] Database user created with read/write permissions
- [ ] Connection string obtained
- [ ] Platform account created (Render/Railway)
- [ ] GitHub repository connected
- [ ] Environment variables set
- [ ] Deployment successful
- [ ] App accessible via URL
- [ ] Database connection working
- [ ] Frontend loads correctly

---

## 💡 **Pro Tips**

1. **Use MongoDB Atlas** - Free tier includes 512MB storage
2. **Set strong SECRET_KEY** - Generate random string
3. **Monitor usage** - Free tiers have limits
4. **Use custom domain** - Most platforms allow free custom domains
5. **Enable auto-deploy** - Deploy on every GitHub push

---

## 🆘 **Need Help?**

- **Render**: [docs.render.com](https://docs.render.com)
- **Railway**: [docs.railway.app](https://docs.railway.app)
- **Vercel**: [vercel.com/docs](https://vercel.com/docs)
- **Fly.io**: [fly.io/docs](https://fly.io/docs)

Your invoicing tool will be live on the internet in minutes! 🚀
