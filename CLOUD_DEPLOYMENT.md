# 🌐 Cloud Deployment Guide for Activus Invoice Management System

## 🚀 Quick Cloud Deployment Options

### **Option A: Railway (Easiest)**

1. **Sign up at Railway**: https://railway.app
2. **Connect GitHub**: Link your GitHub account
3. **Deploy from GitHub**:
   ```bash
   # Push your code to GitHub first
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/yourusername/invoicing-tool.git
   git push -u origin main
   ```
4. **Railway Setup**:
   - Create new project
   - Add MongoDB service
   - Deploy your app
   - Set environment variables

### **Option B: Render (Free tier available)**

1. **Sign up at Render**: https://render.com
2. **Create Web Service**:
   - Connect GitHub repo
   - Build command: `docker-compose up -d`
   - Start command: `python server.py`
3. **Add MongoDB**: Use Render's MongoDB service
4. **Environment Variables**:
   ```
   MONGO_URL=mongodb://render-mongodb-url
   DB_NAME=activus_invoice_db
   SECRET_KEY=your-secret-key
   ```

### **Option C: DigitalOcean App Platform**

1. **Create app.yaml**:
   ```yaml
   name: activus-invoice-system
   services:
   - name: backend
     source_dir: backend
     github:
       repo: yourusername/invoicing-tool
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
       repo: yourusername/invoicing-tool
       branch: main
     build_command: yarn build
     run_command: yarn start
     environment_slug: node-js
     instance_count: 1
     instance_size_slug: basic-xxs
   ```

### **Option D: AWS EC2 (More control)**

1. **Launch EC2 instance** (Ubuntu 22.04)
2. **Install Docker**:
   ```bash
   sudo apt update
   sudo apt install docker.io docker-compose
   sudo systemctl start docker
   sudo usermod -a -G docker ubuntu
   ```
3. **Upload your project**:
   ```bash
   scp -r ./Invoicing-tool-V6-main ubuntu@your-ec2-ip:~/
   ```
4. **Deploy**:
   ```bash
   ssh ubuntu@your-ec2-ip
   cd Invoicing-tool-V6-main
   ./deploy.sh
   ```

## 🔧 **Environment Variables for Cloud**

Create a `.env` file with these variables:

```bash
# MongoDB Configuration
MONGO_URL=mongodb+srv://username:password@cluster.mongodb.net/activus_invoice_db
DB_NAME=activus_invoice_db

# Security
SECRET_KEY=your-super-secret-key-change-this

# Optional: Email Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=your-app-password
```

## 🌍 **Domain Setup**

1. **Buy a domain** (Namecheap, GoDaddy, etc.)
2. **Point DNS** to your cloud service
3. **Update nginx.conf** with your domain:
   ```nginx
   server_name yourdomain.com www.yourdomain.com;
   ```

## 🔒 **Security Checklist**

- [ ] Change default MongoDB password
- [ ] Update SECRET_KEY to strong random value
- [ ] Enable HTTPS/SSL
- [ ] Set up firewall rules
- [ ] Configure CORS properly
- [ ] Set up database backups
- [ ] Enable MongoDB authentication

## 📊 **Monitoring & Maintenance**

- Set up health checks
- Configure log monitoring
- Set up automated backups
- Monitor resource usage
- Set up alerts for downtime

## 💰 **Cost Estimates**

- **Railway**: $5-20/month
- **Render**: $7-25/month (free tier available)
- **DigitalOcean**: $12-25/month
- **AWS EC2**: $10-50/month (depending on instance size)

## 🎯 **Recommended for Different Use Cases**

- **Personal/Small Team**: Railway or Render
- **Business/Production**: DigitalOcean or AWS
- **Learning/Testing**: Render free tier
- **High Traffic**: AWS with load balancer
