<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Player Profile - Football Team</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background: linear-gradient(135deg, #0f2027 0%, #203a43 50%, #2c5364 100%);
  min-height: 100vh;
}

.container {
  display: flex;
  min-height: 100vh;
}

/* Sidebar */
.sidebar {
  width: 260px;
  background: rgba(255, 255, 255, 0.95);
  padding: 30px 0;
  box-shadow: 2px 0 20px rgba(0, 0, 0, 0.1);
  position: fixed;
  height: 100vh;
  overflow-y: auto;
}

.sidebar h2 {
  color: #1e3c72;
  text-align: center;
  margin-bottom: 10px;
  font-size: 24px;
}

.sidebar .subtitle {
  text-align: center;
  color: #666;
  font-size: 13px;
  margin-bottom: 30px;
}

.nav {
  list-style: none;
}

.nav li {
  margin: 5px 0;
}

.nav a {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 14px 30px;
  color: #555;
  text-decoration: none;
  transition: all 0.3s ease;
  font-size: 15px;
  border-left: 4px solid transparent;
}

.nav a:hover,
.nav a.active {
  background: linear-gradient(90deg, rgba(42, 82, 152, 0.1) 0%, transparent 100%);
  color: #2a5298;
  border-left-color: #2a5298;
}

/* Main Content */
.main-content {
  flex: 1;
  margin-left: 260px;
  padding: 30px;
}

.profile-header {
  background: rgba(255, 255, 255, 0.95);
  padding: 30px;
  border-radius: 15px;
  margin-bottom: 30px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  display: flex;
  gap: 30px;
  align-items: center;
}

.profile-avatar {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  background: linear-gradient(135deg, #2a5298, #7e22ce);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 48px;
  color: white;
  font-weight: bold;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.profile-info h1 {
  color: #1e3c72;
  font-size: 32px;
  margin-bottom: 10px;
}

.profile-badges {
  display: flex;
  gap: 10px;
  margin-top: 15px;
}

.badge {
  background: #f0f0f0;
  padding: 5px 12px;
  border-radius: 20px;
  font-size: 13px;
  color: #555;
}

.profile-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

.info-card {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.info-card h3 {
  color: #1e3c72;
  margin-bottom: 20px;
  font-size: 20px;
}

.info-item {
  display: flex;
  justify-content: space-between;
  padding: 12px 0;
  border-bottom: 1px solid #e0e0e0;
}

.info-item:last-child {
  border-bottom: none;
}

.info-label {
  color: #666;
  font-size: 14px;
}

.info-value {
  color: #333;
  font-weight: 600;
  font-size: 14px;
}

.edit-btn {
  background: linear-gradient(135deg, #2a5298, #1e3c72);
  color: white;
  border: none;
  padding: 10px 25px;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  margin-top: 15px;
  transition: all 0.3s ease;
}

.edit-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(42, 82, 152, 0.4);
}
</style>
</head>
<body>

<div class="container">
  <aside class="sidebar">
    <h2>Football Team</h2>
    <p class="subtitle">Management System</p>
    <ul class="nav">
      <li><a href="dashboard.jsp">Dashboard</a></li>
      <li><a href="profile.jsp" class="active">Profile</a></li>
      <li><a href="performance.jsp">Performance</a></li>
      <li><a href="schedule.jsp">Schedule</a></li>
      <li><a href="matches.jsp">Matches</a></li>
      <li><a href="messages.jsp">Messages</a></li>
      <li><a href="logout.jsp">Logout</a></li>
    </ul>
  </aside>

  <main class="main-content">
    <%
      String mob = (String) session.getAttribute("smob");
      String playerName = "", address = "", email = "", position = "";

      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/aimlb", "root", "admin");
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM student WHERE mobile='" + mob + "'");

        if(rs.next()) {
          playerName = rs.getString("name");
          address = rs.getString("address");
          email = rs.getString("email");
          position = "Forward";
        }
        conn.close();
      } catch(Exception e) {
        out.println(e.getMessage());
      }
    %>

    <div class="profile-header">
      <div class="profile-avatar">
        <%= playerName.charAt(0) %>
      </div>
      <div class="profile-info">
        <h1><%= playerName %></h1>
        <p style="color: #666; font-size: 16px;"><%= position %> | Jersey #10</p>
        <div class="profile-badges">
          <span class="badge">Active Player</span>
          <span class="badge">2 Trophies</span>
          <span class="badge">12 Goals</span>
        </div>
      </div>
    </div>

    <div class="profile-content">
      <div class="info-card">
        <h3>Personal Information</h3>
        <div class="info-item">
          <span class="info-label">Full Name</span>
          <span class="info-value"><%= playerName %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Mobile Number</span>
          <span class="info-value"><%= mob %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Email</span>
          <span class="info-value"><%= email %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Address</span>
          <span class="info-value"><%= address %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Date of Birth</span>
          <span class="info-value">15 Jan 2000</span>
        </div>
        <div class="info-item">
          <span class="info-label">Blood Group</span>
          <span class="info-value">O+</span>
        </div>
        <button class="edit-btn">Edit Profile</button>
      </div>

      <div class="info-card">
        <h3>Player Details</h3>
        <div class="info-item">
          <span class="info-label">Position</span>
          <span class="info-value"><%= position %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Jersey Number</span>
          <span class="info-value">#10</span>
        </div>
        <div class="info-item">
          <span class="info-label">Preferred Foot</span>
          <span class="info-value">Right</span>
        </div>
        <div class="info-item">
          <span class="info-label">Height</span>
          <span class="info-value">175 cm</span>
        </div>
        <div class="info-item">
          <span class="info-label">Weight</span>
          <span class="info-value">70 kg</span>
        </div>
        <div class="info-item">
          <span class="info-label">Join Date</span>
          <span class="info-value">01 Jan 2024</span>
        </div>
      </div>

      <div class="info-card">
        <h3>Career Statistics</h3>
        <div class="info-item">
          <span class="info-label">Total Matches</span>
          <span class="info-value">18</span>
        </div>
        <div class="info-item">
          <span class="info-label">Goals Scored</span>
          <span class="info-value">12</span>
        </div>
        <div class="info-item">
          <span class="info-label">Assists</span>
          <span class="info-value">7</span>
        </div>
        <div class="info-item">
          <span class="info-label">Yellow Cards</span>
          <span class="info-value">2</span>
        </div>
        <div class="info-item">
          <span class="info-label">Red Cards</span>
          <span class="info-value">0</span>
        </div>
        <div class="info-item">
          <span class="info-label">Player Rating</span>
          <span class="info-value">8.5/10</span>
        </div>
      </div>

      <div class="info-card">
        <h3>Achievements</h3>
        <div class="info-item">
          <span class="info-label">City Championship</span>
          <span class="info-value">2024</span>
        </div>
        <div class="info-item">
          <span class="info-label">Top Scorer Award</span>
          <span class="info-value">2024</span>
        </div>
        <div class="info-item">
          <span class="info-label">Player of Month</span>
          <span class="info-value">Oct 2024</span>
        </div>
        <div class="info-item">
          <span class="info-label">Hat-trick Record</span>
          <span class="info-value">2 Times</span>
        </div>
      </div>
    </div>
  </main>
</div>

</body>
</html>