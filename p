<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Portal Peserta - Masuk</title>
  
  <!-- Font Google Inter -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    /* RESET & VARIABLES */
    :root {
      --font-main: 'Inter', system-ui, -apple-system, sans-serif;
      --bg-dark: #0d0d0d;
      --panel-dark: #121212;
      --input-bg: #1e1e1e;
      --border-color: #2e2e2e;
      --text-primary: #ffffff;
      --text-muted: #8e8e8e;
    }

    *, *::before, *::after {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: var(--font-main);
      background-color: var(--bg-dark);
      color: var(--text-primary);
      height: 100vh;
      overflow: hidden;
    }

    /* SPLIT SCREEN LAYOUT */
    .split-container {
      display: flex;
      width: 100vw;
      height: 100vh;
    }

    /* --- PANEL KIRI (FORM) --- */
    .left-panel {
      flex: 1;
      background-color: var(--bg-dark);
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 40px;
      z-index: 2;
    }

    .auth-box {
      width: 100%;
      max-width: 380px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .logo-wrapper {
      margin-bottom: 32px;
    }

    .auth-title {
      font-size: 2rem;
      font-weight: 700;
      margin-bottom: 32px;
      letter-spacing: -0.5px;
    }

    .btn-google {
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 12px;
      background-color: transparent;
      border: 1px solid var(--border-color);
      color: var(--text-primary);
      padding: 12px;
      border-radius: 999px;
      font-size: 0.9rem;
      font-weight: 500;
      cursor: pointer;
      transition: background-color 0.2s ease;
    }

    .btn-google:hover {
      background-color: rgba(255, 255, 255, 0.05);
    }

    .divider {
      width: 100%;
      text-align: center;
      border-bottom: 1px solid var(--border-color);
      line-height: 0.1em;
      margin: 28px 0;
    }

    .divider span {
      background: var(--bg-dark);
      padding: 0 16px;
      color: var(--text-muted);
      font-size: 0.8rem;
    }

    form {
      width: 100%;
    }

    .form-group {
      margin-bottom: 16px;
    }

    .input-field {
      width: 100%;
      padding: 14px 20px;
      background-color: var(--bg-dark);
      border: 1px solid var(--border-color);
      border-radius: 999px;
      color: var(--text-primary);
      font-size: 0.95rem;
      outline: none;
      transition: border-color 0.2s ease;
    }

    .input-field:focus {
      border-color: #ffffff;
    }

    .input-field::placeholder {
      color: #555;
    }

    .btn-submit {
      width: 100%;
      padding: 14px;
      background-color: #ffffff;
      color: #000000;
      border: none;
      border-radius: 999px;
      font-size: 0.95rem;
      font-weight: 600;
      cursor: pointer;
      transition: opacity 0.2s ease;
    }

    .btn-submit:hover {
      opacity: 0.9;
    }

    .terms-text {
      margin-top: 28px;
      font-size: 0.75rem;
      color: var(--text-muted);
      text-align: center;
      line-height: 1.5;
    }

    .terms-text a {
      color: var(--text-muted);
      text-decoration: underline;
    }

    /* --- PANEL KANAN (KARTU & ANIMASI EKSKAVATOR) --- */
    .right-panel {
      flex: 1.2;
      background-color: #050505;
      position: relative;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      perspective: 1000px;
    }

    .grid-wrapper {
      display: flex;
      gap: 20px;
      transform: rotate(-12deg) rotateY(8deg) scale(1.1);
      transform-origin: center;
    }

    .grid-column {
      display: flex;
      flex-direction: column;
      gap: 20px;
      width: 240px;
    }

    /* Style Kartu */
    .uni-card {
      background-color: var(--panel-dark);
      border: 1px solid var(--border-color);
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 20px 40px rgba(0,0,0,0.6);
      flex-shrink: 0;
    }

    .uni-card img {
      width: 100%;
      height: 280px;
      object-fit: cover;
      display: block;
    }

    .card-info {
      padding: 16px;
      background: linear-gradient(180deg, #181818 0%, #101010 100%);
    }

    .card-info h3 {
      font-size: 1rem;
      font-weight: 600;
      margin-bottom: 4px;
    }

    .card-info p {
      font-size: 0.8rem;
      color: var(--text-muted);
    }

    /* Animasi Gerakan Ekskavator / Piston Hidrolik */
    .col-up {
      animation: excavatorUp 6s cubic-bezier(0.45, 0.05, 0.55, 0.95) infinite alternate;
    }

    .col-down {
      animation: excavatorDown 6.5s cubic-bezier(0.45, 0.05, 0.55, 0.95) infinite alternate;
    }

    .col-up-alt {
      animation: excavatorUp 5.5s cubic-bezier(0.45, 0.05, 0.55, 0.95) infinite alternate 1s;
    }

    @keyframes excavatorUp {
      0% {
        transform: translateY(0px);
      }
      50% {
        transform: translateY(-120px);
      }
      100% {
        transform: translateY(40px);
      }
    }

    @keyframes excavatorDown {
      0% {
        transform: translateY(-80px);
      }
      50% {
        transform: translateY(80px);
      }
      100% {
        transform: translateY(-40px);
      }
    }

    /* Responsive */
    @media (max-width: 900px) {
      .right-panel {
        display: none;
      }
    }
  </style>
</head>
<body>

  <div class="split-container">
    
    <!-- SISI KIRI: Form Login Dark Theme -->
    <div class="left-panel">
      <div class="auth-box">
        <!-- Logo -->
        <div class="logo-wrapper">
          <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M8 10L20 4L32 10V30L20 36L8 30V10Z" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M20 4V36" stroke="white" stroke-width="3"/>
          </svg>
        </div>

        <h1 class="auth-title">Welcome back</h1>

        <!-- Google OAuth Button -->
        <button type="button" class="btn-google">
          <svg width="18" height="18" viewBox="0 0 24 24">
            <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
            <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
            <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.06H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.94l2.85-2.22.81-.63z"/>
            <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.06l3.66 2.84c.87-2.6 3.3-4.52 6.16-4.52z"/>
          </svg>
          Continue with Google
        </button>

        <div class="divider">
          <span>or</span>
        </div>

        <!-- Form Email -->
        <form onsubmit="handleLogin(event)">
          <div class="form-group">
            <input type="email" id="email" class="input-field" placeholder="Enter email address" required>
          </div>

          <button type="submit" class="btn-submit">Continue</button>
        </form>

        <p class="terms-text">
          By continuing, you agree to Portal's <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>.
        </p>
      </div>
    </div>

    <!-- SISI KANAN: Grid Universitas Top Dunia (Animasi Ekskavator) -->
    <div class="right-panel">
      <div class="grid-wrapper">
        
        <!-- Kolom 1 -->
        <div class="grid-column col-up">
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1541829070764-84a7d30dd3f3?q=80&w=600&auto=format&fit=crop" alt="Harvard University">
            <div class="card-info">
              <h3>Harvard University</h3>
              <p>Cambridge, USA</p>
            </div>
          </div>
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1592280771190-3e2e4d571952?q=80&w=600&auto=format&fit=crop" alt="Oxford University">
            <div class="card-info">
              <h3>Oxford University</h3>
              <p>Oxford, UK</p>
            </div>
          </div>
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1562774053-701939374585?q=80&w=600&auto=format&fit=crop" alt="MIT">
            <div class="card-info">
              <h3>MIT</h3>
              <p>Cambridge, USA</p>
            </div>
          </div>
        </div>

        <!-- Kolom 2 -->
        <div class="grid-column col-down">
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1527891751199-7225231a68d7?q=80&w=600&auto=format&fit=crop" alt="Stanford University">
            <div class="card-info">
              <h3>Stanford University</h3>
              <p>Stanford, USA</p>
            </div>
          </div>
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1580582932707-520aed937b7b?q=80&w=600&auto=format&fit=crop" alt="Cambridge University">
            <div class="card-info">
              <h3>Cambridge University</h3>
              <p>Cambridge, UK</p>
            </div>
          </div>
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1523050854058-8df90110c9f1?q=80&w=600&auto=format&fit=crop" alt="ETH Zurich">
            <div class="card-info">
              <h3>ETH Zurich</h3>
              <p>Zurich, Switzerland</p>
            </div>
          </div>
        </div>

        <!-- Kolom 3 -->
        <div class="grid-column col-up-alt">
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1595152772835-219674b2a8a6?q=80&w=600&auto=format&fit=crop" alt="NUS">
            <div class="card-info">
              <h3>NUS</h3>
              <p>Singapore</p>
            </div>
          </div>
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1509062522246-3755977927d7?q=80&w=600&auto=format&fit=crop" alt="University of Tokyo">
            <div class="card-info">
              <h3>University of Tokyo</h3>
              <p>Tokyo, Japan</p>
            </div>
          </div>
          <div class="uni-card">
            <img src="https://images.unsplash.com/photo-1541829070764-84a7d30dd3f3?q=80&w=600&auto=format&fit=crop" alt="UC Berkeley">
            <div class="card-info">
              <h3>UC Berkeley</h3>
              <p>California, USA</p>
            </div>
          </div>
        </div>

      </div>
    </div>

  </div>

  <script>
    function handleLogin(event) {
      event.preventDefault();
      const email = document.getElementById('email').value;
      alert(`Melakukan autentikasi untuk email: ${email}`);
    }
  </script>

</body>
</html>
