# 🚀 Activus Invoice Management System

A modern, full-stack invoicing application built with FastAPI and React.

## ✨ Features

- 📄 Invoice creation and management
- 🏢 Company profile management
- 📊 Project tracking
- 📈 Reports and analytics
- 🔐 User authentication
- 📱 Responsive design

## 🛠️ Tech Stack

- **Backend**: FastAPI, Python
- **Frontend**: React, Tailwind CSS
- **Database**: MongoDB
- **Deployment**: Docker, Render

## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Node.js 16+
- MongoDB

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/siv3sh/activus-invoice-system.git
   cd activus-invoice-system
   ```

2. **Backend Setup**
   ```bash
   cd backend
   pip install -r requirements.txt
   python server.py
   ```

3. **Frontend Setup**
   ```bash
   cd frontend
   yarn install
   yarn start
   ```

## 🌐 Free Deployment Options

### 1. 🎯 **Render (Recommended)**
**Best for**: Full-stack applications with database

**Steps**:
1. **Sign up** at [render.com](https://render.com)
2. **Connect GitHub** repository
3. **Create Web Service**:
   - Build Command: `pip install -r backend/requirements.txt && cd frontend && yarn install && yarn build`
   - Start Command: `cd backend && python server.py`
   - Environment: `Python 3`
4. **Set Environment Variables**:
   ```
   MONGO_URL=mongodb+srv://username:password@cluster.mongodb.net/
   DB_NAME=activus_invoice_db
   SECRET_KEY=your_secret_key_here
   PORT=10000
   ```
5. **Deploy** - Automatic deployment from GitHub

**Pros**: Free tier, automatic deployments, MongoDB Atlas integration
**Cons**: 750 hours/month limit, sleeps after inactivity

---

### 2. 🚀 **Railway**
**Best for**: Simple deployment with database

**Steps**:
1. **Sign up** at [railway.app](https://railway.app)
2. **Connect GitHub** repository
3. **Add MongoDB** service
4. **Deploy** - Automatic deployment

**Pros**: Free tier, simple setup, good performance
**Cons**: Limited free usage

---

### 3. 🌐 **Vercel**
**Best for**: Frontend-focused applications

**Steps**:
1. **Sign up** at [vercel.com](https://vercel.com)
2. **Import project** from GitHub
3. **Configure build settings**:
   - Framework: Other
   - Build Command: `cd frontend && yarn build`
   - Output Directory: `frontend/build`
4. **Deploy**

**Pros**: Excellent performance, automatic deployments
**Cons**: Serverless functions only, no persistent database

---

### 4. 🐳 **Fly.io**
**Best for**: Docker-based deployments

**Steps**:
1. **Install Fly CLI**: `curl -L https://fly.io/install.sh | sh`
2. **Login**: `fly auth login`
3. **Launch**: `fly launch`
4. **Deploy**: `fly deploy`

**Pros**: Free tier, Docker support, global edge
**Cons**: CLI required, learning curve

---

### 5. 🔥 **Firebase Hosting**
**Best for**: Static frontend hosting

**Steps**:
1. **Install Firebase CLI**: `npm install -g firebase-tools`
2. **Login**: `firebase login`
3. **Init**: `firebase init hosting`
4. **Build**: `cd frontend && yarn build`
5. **Deploy**: `firebase deploy`

**Pros**: Free tier, CDN, easy setup
**Cons**: Static hosting only, no backend

---

## 📝 Environment Variables

Create a `.env` file in the backend directory:

```bash
MONGO_URL=mongodb://localhost:27017
DB_NAME=activus_invoice_db
SECRET_KEY=your_secret_key_here
```

## 📚 API Documentation

Once running, visit: http://localhost:8001/docs

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License.