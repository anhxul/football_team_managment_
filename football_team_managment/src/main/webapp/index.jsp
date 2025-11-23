<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Football Team Management - Player Registration</title>
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
      max-width: 500px;
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
      margin-bottom: 30px;
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

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      color: #333;
      font-weight: 600;
      margin-bottom: 8px;
      font-size: 14px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    select {
      width: 100%;
      padding: 12px 15px;
      border: 2px solid #e0e0e0;
      border-radius: 8px;
      font-size: 14px;
      transition: all 0.3s ease;
      background: white;
    }

    input:focus,
    select:focus {
      outline: none;
      border-color: #2a5298;
      box-shadow: 0 0 0 3px rgba(42, 82, 152, 0.1);
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

    .footer-links {
      text-align: center;
      margin-top: 20px;
      padding-top: 20px;
      border-top: 1px solid #e0e0e0;
    }

    .footer-links a {
      color: #2a5298;
      text-decoration: none;
      font-size: 14px;
      transition: color 0.3s ease;
    }

    .footer-links a:hover {
      color: #1e3c72;
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h2>
        <span class="football-icon">⚽</span>
        Player Registration
      </h2>
      <p>Join our Football Team Management System</p>
    </div>

    <form name="f1" method="post" action="reg.jsp">
      <div class="form-group">
        <label for="playerName">Player Name *</label>
        <input type="text" id="playerName" name="t1" placeholder="Enter full name" required>
      </div>

      <div class="form-group">
        <label for="mobile">Mobile Number *</label>
        <input type="text" id="mobile" name="t2" placeholder="Enter 10-digit number" pattern="[0-9]{10}" required>
      </div>

      <div class="form-group">
        <label for="email">Email Address *</label>
        <input type="email" id="email" name="t5" placeholder="Enter email address" required>
      </div>

      <div class="form-group">
        <label for="position">Player Position *</label>
        <select id="position" name="t6" required>
          <option value="">Select Position</option>
          <option value="Goalkeeper">Goalkeeper</option>
          <option value="Defender">Defender</option>
          <option value="Midfielder">Midfielder</option>
          <option value="Forward">Forward</option>
        </select>
      </div>

      <div class="form-group">
        <label for="address">Address *</label>
        <input type="text" id="address" name="t3" placeholder="Enter complete address" required>
      </div>

      <div class="form-group">
        <label for="password">Password *</label>
        <input type="password" id="password" name="t4" placeholder="Create a strong password" minlength="6" required>
      </div>

      <div class="buttons">
        <input type="submit" value="Register Player">
        <input type="reset" value="Clear Form">
      </div>
    </form>

    <div class="footer-links">
      <a href="login.jsp">Already registered? Login here</a>
    </div>
  </div>
</body>
</html>