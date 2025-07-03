# Surgy Innovations Lab - MERN Auth System with WhatsApp Alerts

A full-stack MERN (MongoDB, Express, React, Node.js) authentication project for Surgy Innovations Lab, featuring WhatsApp integration using Twilio.

## 🔧 Tech Stack

- Frontend: React.js
- Backend: Express.js + MongoDB (via Mongoose)
- Messaging: Twilio Sandbox for WhatsApp

## 📦 Folder Structure

```
SIL/
├── backend/    # Express server with APIs and Twilio
└── frontend/   # React app with .env-based API URL
```

## 🔐 Features

- Signup: name, email, phone  
- Login: phone only  
- WhatsApp notifications:
  - After signup
  - After login
  - On login failure (if unregistered)

## 🧠 APIs

### POST `/api/auth/signup`
```json
{
  "name": "Your Name",
  "email": "you@example.com",
  "phone": "+91XXXXXXXXXX"
}
```

### POST `/api/auth/login`
```json
{
  "phone": "+91XXXXXXXXXX"
}
```

## ✅ Before Signup/Login

To receive WhatsApp messages from the app:

1. Save **+1 415 523 8886** on WhatsApp.
2. Send this message:  
   ```
   join eager-forest
   ```
3. Then use the app as usual.

_(Required only once per phone number)_

## 🛠 How to Run Locally

### Backend
```bash
cd backend
npm install
```

#### Create `.env` in `/backend`:
```
MONGO_URL=your_mongodb_url
TWILIO_SID=your_sid
TWILIO_AUTH_TOKEN=your_token
TWILIO_PHONE=whatsapp:+14155238886
```

```bash
npm start
```

### Frontend
```bash
cd frontend
npm install
```

#### Create `.env` in `/frontend`:
```
REACT_APP_API_URL=http://localhost:5000
```

```bash
npm start
```

## 🧑‍💻 Developer

**Maddili Gnana Pramod**  
B.Tech CSE, NIT Andhra Pradesh  
[GitHub](https://github.com/GnanaPramod)

## ⚠️ Note

- API keys are not included for security.
- To enable WhatsApp messages, set up Twilio and use `.env` files as shown above.
