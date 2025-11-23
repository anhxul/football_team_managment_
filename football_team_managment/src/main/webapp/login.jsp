<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Football Team Management - Login</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #7e22ce 100%);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .container {
      background: rgba(255, 255, 255, 0.95);
      border-radius: 20px;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
      padding: 40px;
      max-width: 450px;
      width: 100%;
      animation: slideIn 0.5s ease-out;
    }

    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateY(-30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .header {
      text-align: center;
      margin-bottom: 35px;
    }

    .header h2 {
      color: #1e3c72;
      font-size: 28px;
      margin-bottom: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
    }

    .header p {
      color: #666;
      font-size: 14px;
    }

    .football-icon {
      font-size: 32px;
    }

    .welcome-text {
      text-align: center;
      color: #555;
      margin-bottom: 30px;
      font-size: 15px;
    }

    .form-group {
      margin-bottom: 20px;
      position: relative;
    }

    label {
      display: block;
      color: #333;
      font-weight: 600;
      margin-bottom: 8px;
      font-size: 14px;
    }

    .input-wrapper {
      position: relative;
    }

    .input-icon {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 18px;
      color: #666;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 12px 15px 12px 45px;
      border: 2px solid #e0e0e0;
      border-radius: 8px;
      font-size: 14px;
      transition: all 0.3s ease;
      background: white;
    }

    input:focus {
      outline: none;
      border-color: #2a5298;
      box-shadow: 0 0 0 3px rgba(42, 82, 152, 0.1);
    }

    .forgot-password {
      text-align: right;
      margin-top: 8px;
    }

    .forgot-password a {
      color: #2a5298;
      text-decoration: none;
      font-size: 13px;
      transition: color 0.3s ease;
    }

    .forgot-password a:hover {
      color: #1e3c72;
      text-decoration: underline;
    }

    .buttons {
      display: flex;
      gap: 15px;
      margin-top: 30px;
    }

    input[type="submit"],
    input[type="reset"] {
      flex: 1;
      padding: 12px 20px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    input[type="submit"] {
      background: linear-gradient(135deg, #2a5298 0%, #1e3c72 100%);
      color: white;
    }

    input[type="submit"]:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(42, 82, 152, 0.4);
    }

    input[type="reset"] {
      background: #f5f5f5;
      color: #333;
    }

    input[type="reset"]:hover {
      background: #e0e0e0;
    }

    .divider {
      display: flex;
      align-items: center;
      margin: 25px 0;
      color: #999;
      font-size: 13px;
    }

    .divider::before,
    .divider::after {
      content: '';
      flex: 1;
      height: 1px;
      background: #e0e0e0;
    }

    .divider::before {
      margin-right: 10px;
    }

    .divider::after {
      margin-left: 10px;
    }

    .signup-section {
      text-align: center;
      padding-top: 20px;
      border-top: 1px solid #e0e0e0;
    }

    .signup-section p {
      color: #666;
      font-size: 14px;
      margin-bottom: 10px;
    }

    .signup-section a {
      color: #2a5298;
      text-decoration: none;
      font-weight: 600;
      font-size: 15px;
      transition: color 0.3s ease;
    }

    .signup-section a:hover {
      color: #1e3c72;
      text-decoration: underline;
    }

    .remember-me {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-top: 15px;
      font-size: 14px;
      color: #555;
    }

    .remember-me input[type="checkbox"] {
      width: auto;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h2>
        <span class="football-icon">⚽</span>
        Player Login
      </h2>
      <p>Football Team Management System</p>
    </div>

    <div class="welcome-text">
      Welcome back! Please login to your account
    </div>

    <form name="f1" method="post" action="logins.jsp">
      <div class="form-group">
        <label for="mobile">Mobile Number</label>
        <div class="input-wrapper">
          <span class="input-icon">📱</span>
          <input type="text" id="mobile" name="t1" placeholder="Enter your mobile number" pattern="[0-9]{10}" required>
        </div>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <div class="input-wrapper">
          <span class="input-icon">🔒</span>
          <input type="password" id="password" name="t2" placeholder="Enter your password" required>
        </div>
        <div class="forgot-password">
          <a href="forgot-password.jsp">Forgot Password?</a>
        </div>
      </div>

      <div class="remember-me">
        <input type="checkbox" id="remember" name="remember">
        <label for="remember" style="margin: 0; font-weight: normal; cursor: pointer;">Remember me</label>
      </div>

      <div class="buttons">
        <input type="submit" value="Login">
        <input type="reset" value="Clear">
      </div>
    </form>

    <div class="divider">OR</div>

    <div class="signup-section">
      <p>Don't have an account?</p>
      <a href="index.jsp">Register as New Player</a>
    </div>
  </div>
</body>
</html>