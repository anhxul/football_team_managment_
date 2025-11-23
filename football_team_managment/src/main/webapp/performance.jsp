<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Performance Analysis - Football Team</title>
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

.nav a {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 14px 30px;
  color: #555;
  text-decoration: none;
  transition: all 0.3s ease;
  border-left: 4px solid transparent;
}

.nav a:hover,
.nav a.active {
  background: linear-gradient(90deg, rgba(42, 82, 152, 0.1) 0%, transparent 100%);
  color: #2a5298;
  border-left-color: #2a5298;
}

.main-content {
  flex: 1;
  margin-left: 260px;
  padding: 30px;
}

.page-title {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px 30px;
  border-radius: 15px;
  margin-bottom: 30px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.page-title h1 {
  color: #1e3c72;
  font-size: 28px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.stats-overview {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.stat-box {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: transform 0.3s ease;
}

.stat-box:hover {
  transform: translateY(-5px);
}

.stat-icon {
  font-size: 40px;
  margin-bottom: 10px;
}

.stat-value {
  font-size: 32px;
  font-weight: 700;
  color: #2a5298;
  margin: 10px 0;
}

.stat-label {
  color: #666;
  font-size: 14px;
}

.performance-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  margin-bottom: 30px;
}

.performance-card {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.performance-card h3 {
  color: #1e3c72;
  margin-bottom: 20px;
  font-size: 20px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.progress-item {
  margin-bottom: 20px;
}

.progress-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
  font-size: 14px;
}

.progress-label {
  color: #555;
  font-weight: 600;
}

.progress-value {
  color: #2a5298;
  font-weight: 700;
}

.progress-bar {
  height: 10px;
  background: #e0e0e0;
  border-radius: 10px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #2a5298, #7e22ce);
  border-radius: 10px;
  transition: width 0.5s ease;
}

.match-history {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.match-history h3 {
  color: #1e3c72;
  margin-bottom: 20px;
  font-size: 20px;
}

.match-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px;
  background: #f8f9fa;
  border-radius: 8px;
  margin-bottom: 10px;
  border-left: 4px solid #2a5298;
}

.match-date {
  color: #999;
  font-size: 13px;
}

.match-opponent {
  font-weight: 600;
  color: #333;
  font-size: 15px;
}

.match-stats {
  display: flex;
  gap: 15px;
  font-size: 14px;
}

.match-result {
  padding: 5px 12px;
  border-radius: 5px;
  font-weight: 600;
  font-size: 13px;
}

.win {
  background: #d4edda;
  color: #155724;
}

.loss {
  background: #f8d7da;
  color: #721c24;
}

.draw {
  background: #fff3cd;
  color: #856404;
}
</style>
</head>
<body>

<div class="container">
  <aside class="sidebar">
    <h2> Football Team</h2>
    <p class="subtitle">Management System</p>
    <ul class="nav">
      <li><a href="dashboard.jsp"><span>📊</span> Dashboard</a></li>
      <li><a href="profile.jsp"><span>👤</span> Profile</a></li>
      <li><a href="performance.jsp" class="active"><span>📈</span> Performance</a></li>
      <li><a href="schedule.jsp"><span>📅</span> Schedule</a></li>
      <li><a href="matches.jsp"><span>🏆</span> Matches</a></li>
      <li><a href="messages.jsp"><span>💬</span> Messages</a></li>
      <li><a href="logout.jsp"><span>🚪</span> Logout</a></li>
    </ul>
  </aside>

  <main class="main-content">
    <div class="page-title">
      <h1>📈 Performance Analysis</h1>
      <p style="color: #666; margin-top: 10px;">Track your progress and statistics</p>
    </div>

    <div class="stats-overview">
      <div class="stat-box">
        <div class="stat-icon">⚽</div>
        <div class="stat-value">12</div>
        <div class="stat-label">Goals This Season</div>
      </div>
      <div class="stat-box">
        <div class="stat-icon">🎯</div>
        <div class="stat-value">7</div>
        <div class="stat-label">Assists</div>
      </div>
      <div class="stat-box">
        <div class="stat-icon">⭐</div>
        <div class="stat-value">8.5</div>
        <div class="stat-label">Average Rating</div>
      </div>
      <div class="stat-box">
        <div class="stat-icon">🏃</div>
        <div class="stat-value">18</div>
        <div class="stat-label">Matches Played</div>
      </div>
    </div>

    <div class="performance-grid">
      <div class="performance-card">
        <h3>⚡ Performance Metrics</h3>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Goal Accuracy</span>
            <span class="progress-value">78%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 78%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Pass Success</span>
            <span class="progress-value">85%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 85%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Dribbling</span>
            <span class="progress-value">72%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 72%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Defense</span>
            <span class="progress-value">65%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 65%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Stamina</span>
            <span class="progress-value">90%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 90%"></div>
          </div>
        </div>
      </div>

      <div class="performance-card">
        <h3>📊 Monthly Progress</h3>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">November</span>
            <span class="progress-value">4 Goals</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 80%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">October</span>
            <span class="progress-value">5 Goals</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 100%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">September</span>
            <span class="progress-value">3 Goals</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 60%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Total Minutes</span>
            <span class="progress-value">1440 min</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 75%"></div>
          </div>
        </div>
        <div class="progress-item">
          <div class="progress-header">
            <span class="progress-label">Training Attendance</span>
            <span class="progress-value">95%</span>
          </div>
          <div class="progress-bar">
            <div class="progress-fill" style="width: 95%"></div>
          </div>
        </div>
      </div>
    </div>

    <div class="match-history">
      <h3>🏆 Recent Match Performance</h3>
      <div class="match-item">
        <div>
          <div class="match-date">20 Nov 2024</div>
          <div class="match-opponent">vs Warriors FC</div>
        </div>
        <div class="match-stats">
          <span>⚽ 2 Goals</span>
          <span>🎯 1 Assist</span>
          <span class="match-result win">Won 3-1</span>
        </div>
      </div>
      <div class="match-item">
        <div>
          <div class="match-date">15 Nov 2024</div>
          <div class="match-opponent">vs Thunder United</div>
        </div>
        <div class="match-stats">
          <span>⚽ 1 Goal</span>
          <span>🎯 2 Assists</span>
          <span class="match-result win">Won 4-2</span>
        </div>
      </div>
      <div class="match-item">
        <div>
          <div class="match-date">10 Nov 2024</div>
          <div class="match-opponent">vs Phoenix FC</div>
        </div>
        <div class="match-stats">
          <span>⚽ 0 Goals</span>
          <span>🎯 1 Assist</span>
          <span class="match-result draw">Draw 2-2</span>
        </div>
      </div>
      <div class="match-item">
        <div>
          <div class="match-date">05 Nov 2024</div>
          <div class="match-opponent">vs Lions SC</div>
        </div>
        <div class="match-stats">
          <span>⚽ 2 Goals</span>
          <span>🎯 0 Assists</span>
          <span class="match-result win">Won 3-0</span>
        </div>
      </div>
      <div class="match-item">
        <div>
          <div class="match-date">01 Nov 2024</div>
          <div class="match-opponent">vs Eagles FC</div>
        </div>
        <div class="match-stats">
          <span>⚽ 1 Goal</span>
          <span>🎯 1 Assist</span>
          <span class="match-result loss">Lost 2-3</span>
        </div>
      </div>
    </div>
  </main>
</div>

</body>
</html>