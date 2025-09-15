# 🚀 Activus Invoice Management System - Deployment Guide

This guide covers multiple deployment options for the Activus Invoice Management System, a FastAPI backend + React frontend application with MongoDB database.

## 📋 Prerequisites

- **Docker & Docker Compose** (recommended)
- **Python 3.8+** (for manual deployment)
- **Node.js 16+ & Yarn** (for manual deployment)
- **MongoDB** (for manual deployment)

## 🐳 Option 1: Docker Deployment (Recommended)

### Quick Start

1. **Clone and navigate to the project**:
   ```bash
   cd /path/to/Invoicing-tool-V6-main
   ```

2. **Configure environment**:
   ```bash
   cp env.template .env
   # Edit .env with your actual configuration
   ```

3. **Deploy with one command**:
   ```bash
   ./deploy.sh
   ```

### Manual Docker Deployment

1. **Create environment file**:
   ```bash
   cp env.template .env
   # Edit .env with your MongoDB credentials and secret key
   ```

2. **Start services**:
   ```bash
   docker-compose up -d
   ```

3. **Check status**:
   ```bash
   docker-compose ps
   docker-compose logs -f
   ```

### Access Points
- **Frontend**: http://localhost
- **Backend API**: http://localhost:8001
- **MongoDB**: localhost:27017

---

## 🖥️ Option 2: Manual Server Deployment

### Backend Setup

1. **Install Python dependencies**:
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate  # Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

2. **Configure environment**:
   ```bash
   # Create backend/.env
   echo "MONGO_URL=mongodb://localhost:27017" > .env
   echo "DB_NAME=activus_invoice_db" >> .env
   ```

3. **Start backend**:
   ```bash
   python server.py
   # Or: uvicorn server:app --host 0.0.0.0 --port 8001
   ```

### Frontend Setup

1. **Install dependencies**:
   ```bash
   cd frontend
   yarn install
   ```

2. **Build for production**:
   ```bash
   yarn build
   ```

3. **Serve with web server** (Nginx example):
   ```nginx
   server {
       listen 80;
       server_name your-domain.com;
       
       location / {
           root /path/to/frontend/build;
           try_files $uri $uri/ /index.html;
       }
       
       location /api/ {
           proxy_pass http://localhost:8001;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
       }
   }
   ```

---

## ☁️ Option 3: Cloud Deployment

### AWS Deployment

1. **EC2 Instance Setup**:
   ```bash
   # Install Docker on EC2
   sudo yum update -y
   sudo yum install -y docker
   sudo systemctl start docker
   sudo usermod -a -G docker ec2-user
   ```

2. **Deploy with Docker**:
   ```bash
   # Upload your project files
   scp -r ./Invoicing-tool-V6-main ec2-user@your-ec2-ip:~/
   
   # SSH into EC2 and deploy
   ssh ec2-user@your-ec2-ip
   cd Invoicing-tool-V6-main
   ./deploy.sh
   ```

3. **Configure Security Groups**:
   - Allow HTTP (80) and HTTPS (443)
   - Allow SSH (22) for management
   - Allow MongoDB port (27017) if accessing externally

### DigitalOcean App Platform

1. **Create app specification** (`app.yaml`):
   ```yaml
   name: activus-invoice-system
   services:
   - name: backend
     source_dir: backend
     github:
       repo: your-username/your-repo
       branch: main
     run_command: python server.py
     environment_slug: python
     instance_count: 1
     instance_size_slug: basic-xxs
     envs:
     - key: MONGO_URL
       value: your-mongodb-connection-string
     - key: DB_NAME
       value: activus_invoice_db
   
   - name: frontend
     source_dir: frontend
     github:
       repo: your-username/your-repo
       branch: main
     build_command: yarn build
     run_command: yarn start
     environment_slug: node-js
     instance_count: 1
     instance_size_slug: basic-xxs
   ```

### Heroku Deployment

1. **Backend (Heroku)**:
   ```bash
   # Install Heroku CLI
   # Create Procfile in backend/
   echo "web: uvicorn server:app --host 0.0.0.0 --port \$PORT" > backend/Procfile
   
   # Deploy
   cd backend
   heroku create your-app-name-backend
   heroku addons:create mongolab:sandbox
   heroku config:set MONGO_URL=\$MONGODB_URI
   heroku config:set DB_NAME=activus_invoice_db
   git push heroku main
   ```

2. **Frontend (Vercel/Netlify)**:
   ```bash
   # Build command: yarn build
   # Publish directory: build
   # Environment variables: REACT_APP_API_URL=https://your-backend.herokuapp.com
   ```

---

## 🔧 Configuration

### Environment Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `MONGO_URL` | MongoDB connection string | `mongodb://localhost:27017` |
| `DB_NAME` | Database name | `activus_invoice_db` |
| `SECRET_KEY` | JWT secret key | `your-secret-key-here` |

### MongoDB Setup

1. **Local MongoDB**:
   ```bash
   # Install MongoDB
   # macOS: brew install mongodb-community
   # Ubuntu: sudo apt install mongodb
   
   # Start MongoDB
   sudo systemctl start mongod
   ```

2. **MongoDB Atlas (Cloud)**:
   - Create account at https://cloud.mongodb.com
   - Create cluster
   - Get connection string
   - Update `MONGO_URL` in your `.env`

---

## 🔒 Security Considerations

### Production Security Checklist

- [ ] Change default MongoDB passwords
- [ ] Update `SECRET_KEY` to a strong, random value
- [ ] Enable HTTPS with SSL certificates
- [ ] Configure firewall rules
- [ ] Set up database backups
- [ ] Enable MongoDB authentication
- [ ] Use environment variables for secrets
- [ ] Regular security updates

### SSL Configuration

1. **Get SSL certificates** (Let's Encrypt):
   ```bash
   sudo apt install certbot
   sudo certbot certonly --standalone -d your-domain.com
   ```

2. **Update Nginx configuration**:
   ```nginx
   server {
       listen 443 ssl;
       ssl_certificate /etc/letsencrypt/live/your-domain.com/fullchain.pem;
       ssl_certificate_key /etc/letsencrypt/live/your-domain.com/privkey.pem;
       # ... rest of configuration
   }
   ```

---

## 📊 Monitoring & Maintenance

### Health Checks

- **Backend**: `GET /api/health`
- **Database**: Check MongoDB connection
- **Frontend**: Check if static files are served

### Logs

```bash
# Docker logs
docker-compose logs -f backend
docker-compose logs -f mongodb

# System logs
journalctl -u docker
```

### Backup

```bash
# MongoDB backup
mongodump --uri="mongodb://localhost:27017/activus_invoice_db" --out=backup/

# Restore
mongorestore --uri="mongodb://localhost:27017/activus_invoice_db" backup/activus_invoice_db/
```

---

## 🆘 Troubleshooting

### Common Issues

1. **Port already in use**:
   ```bash
   # Find process using port
   lsof -i :8001
   # Kill process
   kill -9 <PID>
   ```

2. **MongoDB connection failed**:
   - Check MongoDB is running
   - Verify connection string
   - Check firewall settings

3. **Frontend build fails**:
   ```bash
   # Clear cache and reinstall
   rm -rf node_modules yarn.lock
   yarn install
   yarn build
   ```

4. **Docker issues**:
   ```bash
   # Clean up Docker
   docker system prune -a
   docker-compose down --volumes
   ```

### Getting Help

- Check application logs: `docker-compose logs -f`
- Verify environment variables: `docker-compose config`
- Test database connection: `docker-compose exec backend python -c "from motor.motor_asyncio import AsyncIOMotorClient; print('MongoDB OK')"`

---

## 📈 Scaling

### Horizontal Scaling

1. **Load Balancer** (Nginx):
   ```nginx
   upstream backend {
       server backend1:8001;
       server backend2:8001;
       server backend3:8001;
   }
   ```

2. **Database Scaling**:
   - MongoDB replica sets
   - Database sharding
   - Connection pooling

### Performance Optimization

- Enable MongoDB indexes
- Use CDN for static files
- Implement caching (Redis)
- Database query optimization
- Frontend code splitting

---

**🎉 Your Activus Invoice Management System is now ready for deployment!**

Choose the deployment method that best fits your needs and infrastructure requirements.
