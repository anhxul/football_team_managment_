<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Football Team Dashboard</title>
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

/* Sidebar Styles */
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
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
}

.sidebar .subtitle {
  text-align: center;
  color: #666;
  font-size: 13px;
  margin-bottom: 30px;
  font-weight: normal;
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

.nav-icon {
  font-size: 20px;
  display: none;
}

/* Main Content */
.main-content {
  flex: 1;
  margin-left: 260px;
  padding: 30px;
}

/* Topbar */
.topbar {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px 30px;
  border-radius: 15px;
  margin-bottom: 30px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.topbar h1 {
  color: #1e3c72;
  font-size: 26px;
  margin-bottom: 15px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.player-info {
  display: flex;
  gap: 30px;
  flex-wrap: wrap;
  font-size: 14px;
}

.info-item {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #555;
  background: #f5f5f5;
  padding: 8px 15px;
  border-radius: 8px;
}

.info-label {
  font-weight: 600;
  color: #333;
}

/* Dashboard Cards */
.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.card {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, #2a5298, #7e22ce);
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}

.card-header {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 15px;
}

.card h3 {
  color: #333;
  font-size: 16px;
  font-weight: 600;
}

.card p {
  color: #2a5298;
  font-size: 32px;
  font-weight: 700;
  margin-top: 10px;
}

.card-subtitle {
  color: #999;
  font-size: 13px;
  margin-top: 8px;
}

/* Activity Section */
.activity {
  background: rgba(255, 255, 255, 0.95);
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  margin-bottom: 30px;
}

.activity h2 {
  color: #1e3c72;
  margin-bottom: 20px;
  font-size: 20px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.activity ul {
  list-style: none;
}

.activity li {
  padding: 15px;
  margin: 10px 0;
  background: #f8f9fa;
  border-radius: 8px;
  color: #555;
  font-size: 14px;
  border-left: 4px solid #2a5298;
  transition: all 0.3s ease;
}

.activity li:hover {
  background: #e9ecef;
  transform: translateX(5px);
}

/* Stats Section */
.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.stat-card {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.stat-card h3 {
  color: #1e3c72;
  margin-bottom: 15px;
  font-size: 18px;
}

.stat-item {
  display: flex;
  justify-content: space-between;
  padding: 10px 0;
  border-bottom: 1px solid #e0e0e0;
  font-size: 14px;
}

.stat-item:last-child {
  border-bottom: none;
}

.stat-label {
  color: #666;
}

.stat-value {
  font-weight: 600;
  color: #2a5298;
}

/* Responsive */
@media (max-width: 768px) {
  .sidebar {
    width: 70px;
    padding: 20px 0;
  }

  .sidebar h2,
  .sidebar .subtitle,
  .nav span {
    display: none;
  }

  .nav a {
    justify-content: center;
    padding: 14px;
  }

  .main-content {
    margin-left: 70px;
    padding: 20px;
  }

  .cards {
    grid-template-columns: 1fr;
  }
}
</style>
</head>
<body>

<div class="container">

  <!-- Sidebar -->
  <aside class="sidebar">
    <h2>Football Team</h2>
    <p class="subtitle">Management System</p>
    <ul class="nav">
      <li>
        <a href="dashboard.jsp" class="active">
          <span>Dashboard</span>
        </a>
      </li>
      <li>
        <a href="profile.jsp">
          <span>Profile</span>
        </a>
      </li>
      <li>
        <a href="performance.jsp">
          <span>Performance</span>
        </a>
      </li>
      <li>
        <a href="schedule.jsp">
          <span>Schedule</span>
        </a>
      </li>
      <li>
        <a href="matches.jsp">
          <span>Matches</span>
        </a>
      </li>
      <li>
        <a href="messages.jsp">
          <span>Messages</span>
        </a>
      </li>
      <li>
        <a href="logout.jsp">
          <span>Logout</span>
        </a>
      </li>
    </ul>
  </aside>

  <!-- Main Content -->
  <main class="main-content">

    <!-- Topbar -->
    <header class="topbar">
      <%
        String mob, pass, playerName = "", playerEmail = "", playerPosition = "";
        int goals = 0, matches = 0, assists = 0;
        double rating = 0.0;

        mob = (String) session.getAttribute("smob");
        pass = (String) session.getAttribute("spass");

        String url = "jdbc:mysql://localhost:3306/aimlb";
        String user = "root";
        String password = "admin";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM student WHERE mobile='" + mob + "'");

            if(rs.next()) {
                playerName = rs.getString("name");
                playerEmail = rs.getString("email");
                // You can add these columns to your database
                // playerPosition = rs.getString("position");
                // goals = rs.getInt("goals");
                // matches = rs.getInt("matches");
                // assists = rs.getInt("assists");
                // rating = rs.getDouble("rating");

                // For now, using default values
                playerPosition = "Forward";
                goals = 12;
                matches = 18;
                assists = 7;
                rating = 8.5;
            }
            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
      %>

      <h1>Welcome, <%= playerName %></h1>

      <div class="player-info">
        <div class="info-item">
          <span class="info-label">Mobile:</span>
          <span><%= mob %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Position:</span>
          <span><%= playerPosition %></span>
        </div>
        <div class="info-item">
          <span class="info-label">Jersey:</span>
          <span>#10</span>
        </div>
        <div class="info-item">
          <span class="info-label">Rating:</span>
          <span><%= rating %></span>
        </div>
      </div>
    </header>

    <!-- Dashboard Cards -->
    <section class="cards">
      <div class="card">
        <div class="card-header">
          <h3>Goals Scored</h3>
        </div>
        <p><%= goals %></p>
        <p class="card-subtitle">This Season</p>
      </div>

      <div class="card">
        <div class="card-header">
          <h3>Matches Played</h3>
        </div>
        <p><%= matches %></p>
        <p class="card-subtitle">Out of 20</p>
      </div>

      <div class="card">
        <div class="card-header">
          <h3>Assists</h3>
        </div>
        <p><%= assists %></p>
        <p class="card-subtitle">This Season</p>
      </div>

      <div class="card">
        <div class="card-header">
          <h3>Next Match</h3>
        </div>
        <p style="font-size: 18px;">vs Warriors</p>
        <p class="card-subtitle">25th Nov, 4:00 PM</p>
      </div>
    </section>

    <!-- Stats Grid -->
    <section class="stats-grid">
      <div class="stat-card">
        <h3>Season Statistics</h3>
        <div class="stat-item">
          <span class="stat-label">Goals</span>
          <span class="stat-value"><%= goals %></span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Assists</span>
          <span class="stat-value"><%= assists %></span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Yellow Cards</span>
          <span class="stat-value">2</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Red Cards</span>
          <span class="stat-value">0</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Minutes Played</span>
          <span class="stat-value">1440</span>
        </div>
      </div>

      <div class="stat-card">
        <h3>Team Rankings</h3>
        <div class="stat-item">
          <span class="stat-label">League Position</span>
          <span class="stat-value">2nd</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Total Points</span>
          <span class="stat-value">45</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Wins</span>
          <span class="stat-value">14</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Draws</span>
          <span class="stat-value">3</span>
        </div>
        <div class="stat-item">
          <span class="stat-label">Losses</span>
          <span class="stat-value">3</span>
        </div>
      </div>
    </section>

    <!-- Recent Activity -->
    <section class="activity">
      <h2>Recent Updates</h2>
      <ul>
        <li>Great performance in last match! Scored <%= goals > 0 ? "2" : "0" %> goals against Titans</li>
        <li>Training session scheduled for tomorrow at 6:00 AM</li>
        <li>Team advanced to semi-finals of City Championship</li>
        <li>New fitness program starting next week</li>
        <li>Match report uploaded for Warriors vs Titans game</li>
      </ul>
    </section>

  </main>
</div>

</body>
</html>