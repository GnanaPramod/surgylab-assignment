// // import React, { useState } from 'react';
// // import axios from 'axios';

// // const AuthForm = () => {
// //   const [isLogin, setIsLogin] = useState(true);
// //   const [form, setForm] = useState({ name: '', email: '', phone: '' });

// //   const handleChange = (e) => {
// //     setForm({ ...form, [e.target.name]: e.target.value });
// //   };

// //  const handleSubmit = async (e) => {
// //   e.preventDefault();

// //   const baseUrl = process.env.REACT_APP_API_URL;
// //   const url = `${baseUrl}/api/auth/${isLogin ? 'login' : 'signup'}`;

// //   // ✅ Normalize the phone format before sending
// //   let phone = form.phone.trim();

// //   // Add country code if missing
// //   if (!phone.startsWith('+')) {
// //     phone = '+91' + phone;
// //   }

// //   const payload = isLogin
// //     ? { phone }
// //     : { name: form.name, email: form.email, phone };

// //   try {
// //     const res = await axios.post(url, payload);
// //     alert(res.data.msg);
// //   } catch (err) {
// //     alert(err.response?.data?.msg || 'Error');
// //   }
// // };


// //   return (
// //     <div style={styles.container}>
    
// //       <h2>{isLogin ? 'Login' : 'Signup'} - Surgy Innovations Lab</h2>
      
// //       <form onSubmit={handleSubmit} style={styles.form}>
// //         {!isLogin && (
// //           <>
// //             <input
// //               type="text"
// //               name="name"
// //               placeholder="Name"
// //               value={form.name}
// //               onChange={handleChange}
// //               required
// //               style={styles.input}
// //             />
// //             <input
// //               type="email"
// //               name="email"
// //               placeholder="Email"
// //               value={form.email}
// //               onChange={handleChange}
// //               required
// //               style={styles.input}
// //             />
// //           </>
// //         )}
// //         <input
// //           type="tel"
// //           name="phone"
// //           placeholder="Phone (e.g., +91XXXXXXXXXX)"
// //           value={form.phone}
// //           onChange={handleChange}
// //           required
// //           style={styles.input}
// //         />
// //         <button type="submit" style={styles.button}>
// //           {isLogin ? 'Login' : 'Signup'}
// //         </button>
// //       </form>
// //       <button onClick={() => setIsLogin(!isLogin)} style={styles.toggleButton}>
// //         Switch to {isLogin ? 'Signup' : 'Login'}
// //       </button>
// //     </div>
// //   );
// // };

// // const styles = {
// //   container: {
// //     width: '100%',
// //     maxWidth: '400px',
// //     margin: 'auto',
// //     padding: '20px',
// //     textAlign: 'center',
// //     backgroundColor: '#f0f4f8',
// //     borderRadius: '10px',
// //     boxShadow: '0 0 15px rgba(0,0,0,0.1)',
// //     fontFamily: 'Arial, sans-serif',
// //   },
// //   form: {
// //     display: 'flex',
// //     flexDirection: 'column',
// //     gap: '15px',
// //   },
// //   input: {
// //     padding: '10px',
// //     fontSize: '16px',
// //     borderRadius: '5px',
// //     border: '1px solid #ccc',
// //   },
// //   button: {
// //     backgroundColor: '#4CAF50',
// //     color: '#fff',
// //     padding: '10px',
// //     border: 'none',
// //     borderRadius: '5px',
// //     fontSize: '16px',
// //     cursor: 'pointer',
// //   },
// //   toggleButton: {
// //     marginTop: '10px',
// //     backgroundColor: 'transparent',
// //     color: '#007BFF',
// //     border: 'none',
// //     cursor: 'pointer',
// //     fontSize: '14px',
// //   },
// // };

// // export default AuthForm;
// import React, { useState } from 'react';
// import axios from 'axios';

// const AuthForm = () => {
//   const [isLogin, setIsLogin] = useState(true);
//   const [form, setForm] = useState({ name: '', email: '', phone: '' });

//   const handleChange = (e) => {
//     setForm({ ...form, [e.target.name]: e.target.value });
//   };

//   const handleSubmit = async (e) => {
//     e.preventDefault();

//     const baseUrl = process.env.REACT_APP_API_URL;
//     const url = `${baseUrl}/api/auth/${isLogin ? 'login' : 'signup'}`;

//     let phone = form.phone.trim();
//     if (!phone.startsWith('+')) {
//       phone = '+91' + phone;
//     }

//     const payload = isLogin
//       ? { phone }
//       : { name: form.name, email: form.email, phone };

//     try {
//       const res = await axios.post(url, payload);
//       alert(res.data.msg);
//     } catch (err) {
//       alert(err.response?.data?.msg || 'Error');
//     }
//   };
  

//   return (
//     <div style={styles.container}>
//       <h2>{isLogin ? 'Login' : 'Signup'} - Surgy Innovations Lab</h2>

      
//         <div style={styles.whatsappBox}>
//           <p style={styles.whatsappText}>
//             📢 <strong>Before signing up:</strong> To receive WhatsApp alerts from Surgy Innovations Labs, you must register your number.
//           </p>
//           <a
//             href="https://wa.me/14155238886?text=join%20eager-forest" // replace with your join code
//             target="_blank"
//             rel="noopener noreferrer"
//             style={styles.whatsappButton}
//           >
//             ✅ Click here to register on WhatsApp
//           </a>
//         </div>
      

//       <form onSubmit={handleSubmit} style={styles.form}>
//         {!isLogin && (
//           <>
//             <input
//               type="text"
//               name="name"
//               placeholder="Name"
//               value={form.name}
//               onChange={handleChange}
//               required
//               style={styles.input}
//             />
//             <input
//               type="email"
//               name="email"
//               placeholder="Email"
//               value={form.email}
//               onChange={handleChange}
//               required
//               style={styles.input}
//             />
//           </>
//         )}
//         <input
//           type="tel"
//           name="phone"
//           placeholder="Phone (e.g., +91XXXXXXXXXX)"
//           value={form.phone}
//           onChange={handleChange}
//           required
//           style={styles.input}
//         />
//         <button type="submit" style={styles.button}>
//           {isLogin ? 'Login' : 'Signup'}
//         </button>
//       </form>
//       <button onClick={() => setIsLogin(!isLogin)} style={styles.toggleButton}>
//         Switch to {isLogin ? 'Signup' : 'Login'}
//       </button>
//     </div>
//   );
// };

// const styles = {
//   container: {
//     width: '100%',
//     maxWidth: '400px',
//     margin: 'auto',
//     padding: '20px',
//     textAlign: 'center',
//     backgroundColor: '#f0f4f8',
//     borderRadius: '10px',
//     boxShadow: '0 0 15px rgba(0,0,0,0.1)',
//     fontFamily: 'Arial, sans-serif',
//   },
//   form: {
//     display: 'flex',
//     flexDirection: 'column',
//     gap: '15px',
//   },
//   input: {
//     padding: '10px',
//     fontSize: '16px',
//     borderRadius: '5px',
//     border: '1px solid #ccc',
//   },
//   button: {
//     backgroundColor: '#4CAF50',
//     color: '#fff',
//     padding: '10px',
//     border: 'none',
//     borderRadius: '5px',
//     fontSize: '16px',
//     cursor: 'pointer',
//   },
//   toggleButton: {
//     marginTop: '10px',
//     backgroundColor: 'transparent',
//     color: '#007BFF',
//     border: 'none',
//     cursor: 'pointer',
//     fontSize: '14px',
//   },
//   whatsappBox: {
//     marginBottom: '20px',
//     backgroundColor: '#e6f7f1',
//     border: '1px solid #25d366',
//     borderRadius: '8px',
//     padding: '12px',
//   },
//   whatsappText: {
//     marginBottom: '10px',
//     color: '#333',
//     fontSize: '14px',
//   },
//   whatsappButton: {
//     backgroundColor: '#25d366',
//     color: 'white',
//     padding: '10px 15px',
//     textDecoration: 'none',
//     borderRadius: '6px',
//     fontWeight: 'bold',
//     display: 'inline-block',
//   },
// };

// export default AuthForm;
import React, { useState } from 'react';
import axios from 'axios';

const AuthForm = () => {
  const [isLogin, setIsLogin] = useState(true);
  const [isLoggedIn, setIsLoggedIn] = useState(false); // ✅ new state
  const [form, setForm] = useState({ name: '', email: '', phone: '' });

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const baseUrl = process.env.REACT_APP_API_URL;
    const url = `${baseUrl}/api/auth/${isLogin ? 'login' : 'signup'}`;

    let phone = form.phone.trim();
    if (!phone.startsWith('+')) {
      phone = '+91' + phone;
    }

    const payload = isLogin
      ? { phone }
      : { name: form.name, email: form.email, phone };

    try {
      const res = await axios.post(url, payload);
      alert(res.data.msg);
      
      if (isLogin) {
        // ✅ switch screen after login success
        setIsLoggedIn(true);
      }
    } catch (err) {
      alert(err.response?.data?.msg || 'Error');
    }
  };

  if (isLoggedIn) {
    return (
      <div style={styles.container}>
        <h1>🎉 Welcome to Surgy Innovation Labs</h1>
        <p>We're excited to have you on board.</p>
      </div>
    );
  }

  return (
    <div style={styles.container}>
      <h2>{isLogin ? 'Login' : 'Signup'} - Surgy Innovations Lab</h2>

      {!isLogin && (
        <div style={styles.whatsappBox}>
          <p style={styles.whatsappText}>
            📢 <strong>Before signing up:</strong> To receive WhatsApp alerts from Surgy Innovations Labs, you must register your number.
          </p>
          <a
            href="https://wa.me/14155238886?text=join%20eager-forest"
            target="_blank"
            rel="noopener noreferrer"
            style={styles.whatsappButton}
          >
            ✅ Click here to register on WhatsApp
          </a>
        </div>
      )}

      <form onSubmit={handleSubmit} style={styles.form}>
        {!isLogin && (
          <>
            <input
              type="text"
              name="name"
              placeholder="Name"
              value={form.name}
              onChange={handleChange}
              required
              style={styles.input}
            />
            <input
              type="email"
              name="email"
              placeholder="Email"
              value={form.email}
              onChange={handleChange}
              required
              style={styles.input}
            />
          </>
        )}
        <input
          type="tel"
          name="phone"
          placeholder="Phone (e.g., +91XXXXXXXXXX)"
          value={form.phone}
          onChange={handleChange}
          required
          style={styles.input}
        />
        <button type="submit" style={styles.button}>
          {isLogin ? 'Login' : 'Signup'}
        </button>
      </form>
      <button onClick={() => setIsLogin(!isLogin)} style={styles.toggleButton}>
        Switch to {isLogin ? 'Signup' : 'Login'}
      </button>
    </div>
  );
};

const styles = {
  container: {
    width: '100%',
    maxWidth: '400px',
    margin: 'auto',
    padding: '20px',
    textAlign: 'center',
    backgroundColor: '#f0f4f8',
    borderRadius: '10px',
    boxShadow: '0 0 15px rgba(0,0,0,0.1)',
    fontFamily: 'Arial, sans-serif',
  },
  form: {
    display: 'flex',
    flexDirection: 'column',
    gap: '15px',
  },
  input: {
    padding: '10px',
    fontSize: '16px',
    borderRadius: '5px',
    border: '1px solid #ccc',
  },
  button: {
    backgroundColor: '#4CAF50',
    color: '#fff',
    padding: '10px',
    border: 'none',
    borderRadius: '5px',
    fontSize: '16px',
    cursor: 'pointer',
  },
  toggleButton: {
    marginTop: '10px',
    backgroundColor: 'transparent',
    color: '#007BFF',
    border: 'none',
    cursor: 'pointer',
    fontSize: '14px',
  },
  whatsappBox: {
    marginBottom: '20px',
    backgroundColor: '#e6f7f1',
    border: '1px solid #25d366',
    borderRadius: '8px',
    padding: '12px',
  },
  whatsappText: {
    marginBottom: '10px',
    color: '#333',
    fontSize: '14px',
  },
  whatsappButton: {
    backgroundColor: '#25d366',
    color: 'white',
    padding: '10px 15px',
    textDecoration: 'none',
    borderRadius: '6px',
    fontWeight: 'bold',
    display: 'inline-block',
  },
};

export default AuthForm;

