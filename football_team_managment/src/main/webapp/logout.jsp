<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Logging Out - Football Team Management</title>
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

.logout-container {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 20px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
  padding: 50px 40px;
  max-width: 450px;
  width: 100%;
  text-align: center;
  animation: fadeIn 0.5s ease-out;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.logout-icon {
  font-size: 80px;
  margin-bottom: 20px;
  animation: wave 1s ease-in-out infinite;
}

@keyframes wave {
  0%, 100% {
    transform: rotate(0deg);
  }
  25% {
    transform: rotate(-10deg);
  }
  75% {
    transform: rotate(10deg);
  }
}

h2 {
  color: #1e3c72;
  font-size: 28px;
  margin-bottom: 15px;
}

p {
  color: #666;
  font-size: 16px;
  margin-bottom: 30px;
  line-height: 1.6;
}

.spinner {
  width: 50px;
  height: 50px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #2a5298;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin: 20px auto;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.message {
  color: #2a5298;
  font-size: 14px;
  font-weight: 600;
  margin-top: 20px;
}

.footer-note {
  margin-top: 30px;
  padding-top: 20px;
  border-top: 1px solid #e0e0e0;
  color: #999;
  font-size: 13px;
}
</style>
</head>
<body>

<div class="logout-container">
  <div class="logout-icon">👋</div>
  <h2>Logging Out...</h2>
  <p>Thank you for using Football Team Management System. Your session is being safely terminated.</p>

  <div class="spinner"></div>

  <p class="message">Redirecting to login page...</p>

  <div class="footer-note">
    See you at the next match! ⚽
  </div>
</div>

<%
  // Invalidate the current session
  session.invalidate();

  // Redirect to login page after 2 seconds
  response.setHeader("Refresh", "2; URL=login.jsp");
%>

</body>
</html>