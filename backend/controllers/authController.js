const twilio = require('twilio');
const User = require('../models/User');

// ✅ Initialize Twilio client
const client = twilio(process.env.TWILIO_ACCOUNT_SID, process.env.TWILIO_AUTH_TOKEN);

// ✅ Twilio WhatsApp Sender (from .env)
const FROM = process.env.TWILIO_PHONE;

// ✅ Helper function to send WhatsApp messages
const sendWhatsApp = async (to, message) => {
  try {
    await client.messages.create({
      from: FROM, // e.g., 'whatsapp:+14155238886'
      to: `whatsapp:${to.trim()}`,
      body: message
    });
    console.log(`✅ WhatsApp message sent to ${to}`);
  } catch (err) {
    console.error("❌ Error sending WhatsApp:", err.message);
  }
};

// ✅ Signup controller
exports.signup = async (req, res) => {
  const { name, email, phone } = req.body;
  const trimmedPhone = phone.trim();

  console.log("📩 Signup Attempt:", { name, email, phone: trimmedPhone });

  try {
    const existing = await User.findOne({ phone: trimmedPhone });
    if (existing) {
      return res.status(400).json({ msg: 'User already exists' });
    }

    const user = new User({ name, email, phone: trimmedPhone });
    await user.save();

    await sendWhatsApp(trimmedPhone, `You have successfully registered at Surgy Innovation Labs.`);
    res.status(201).json({ msg: 'Registered successfully' });

  } catch (err) {
    console.error("🔥 Signup Error:", err.message);
    res.status(500).json({ msg: 'Error registering user' });
  }
};

// ✅ Login controller
exports.login = async (req, res) => {
  const { phone } = req.body;
  const trimmedPhone = phone.trim();

  console.log("📩 Login Attempt:", trimmedPhone);

  try {
    const user = await User.findOne({ phone: trimmedPhone });
    console.log("🧠 DB Lookup Result:", user);

    if (!user) {
      await sendWhatsApp(trimmedPhone, `User not found. Please register at Surgy Innovation Labs.`);
      return res.status(404).json({ msg: 'User not found' });
    }

    await sendWhatsApp(trimmedPhone, `Hi ${user.name}, welcome back to Surgy Innovation Labs!`);
    res.json({ msg: 'Logged in successfully' });

  } catch (err) {
    console.error("🔥 Login Error:", err.message);
    res.status(500).json({ msg: 'Login failed' });
  }
};
