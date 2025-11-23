<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Matches - Football Team</title>
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

.team-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.stat-box {
  background: rgba(255, 255, 255, 0.95);
  padding: 20px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  text-align: center;
}

.stat-value {
  font-size: 32px;
  font-weight: 700;
  color: #2a5298;
  margin: 10px 0;
}

.stat-label {
  color: #666;
  font-size: 13px;
}

.matches-section {
  margin-bottom: 30px;
}

.section-header {
  background: rgba(255, 255, 255, 0.95);
  padding: 15px 25px;
  border-radius: 10px;
  margin-bottom: 15px;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

.section-header h2 {
  color: #1e3c72;
  font-size: 20px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.match-card {
  background: rgba(255, 255, 255, 0.95);
  padding: 30px;
  border-radius: 15px;
  margin-bottom: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.match-card:hover {
  transform: translateY(-5px);
}

.match-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding-bottom: 15px;
  border-bottom: 2px solid #e0e0e0;
}

.match-competition {
  display: inline-block;
  padding: 5px 15px;
  background: linear-gradient(135deg, #2a5298, #7e22ce);
  color: white;
  border-radius: 20px;
  font-size: 13px;
  font-weight: 600;
}

.match-date {
  color: #666;
  font-size: 14px;
}

.match-teams {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  gap: 30px;
  align-items: center;
  margin-bottom: 20px;
}

.team {
  text-align: center;
}

.team-logo {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  background: linear-gradient(135deg, #2a5298, #7e22ce);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 40px;
  margin: 0 auto 15px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.team-name {
  font-size: 18px;
  font-weight: 700;
  color: #333;
}

.match-score {
  text-align: center;
}

.score {
  font-size: 48px;
  font-weight: 700;
  color: #1e3c72;
  display: flex;
  gap: 15px;
  align-items: center;
}

.vs {
  font-size: 18px;
  color: #999;
  font-weight: 600;
}

.match-result {
  text-align: center;
  padding: 10px;
  border-radius: 8px;
  font-weight: 600;
  margin-top: 10px;
}

.result-won {
  background: #d4edda;
  color: #155724;
}

.result-lost {
  background: #f8d7da;
  color: #721c24;
}

.result-draw {
  background: #fff3cd;
  color: #856404;
}

.result-upcoming {
  background: #cce5ff;
  color: #004085;
}

.match-details {
  display: flex;
  justify-content: space-around;
  padding: 20px;
  background: #f8f9fa;
  border-radius: 10px;
  margin-top: 20px;
}

.detail-item {
  text-align: center;
}

.detail-label {
  color: #666;
  font-size: 13px;
  margin-bottom: 5px;
}

.detail-value {
  color: #2a5298;
  font-weight: 700;
  font-size: 16px;
}

.player-performance {
  margin-top: 20px;
  padding: 15px;
  background: #f0f0f0;
  border-radius: 8px;
  border-left: 4px solid #2a5298;
}

.player-performance h4 {
  color: #1e3c72;
  margin-bottom: 10px;
  font-size: 15px;
}

.player-stats {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
  font-size: 14px;
  color: #555;
}

.player-stats span {
  display: flex;
  align-items: center;
  gap: 5px;
}

.standings {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.standings h3 {
  color: #1e3c72;
  margin-bottom: 20px;
  font-size: 20px;
}

.standings-table {
  width: 100%;
  border-collapse: collapse;
}

.standings-table th {
  background: #f5f5f5;
  padding: 12px;
  text-align: left;
  font-size: 13px;
  color: #666;
  font-weight: 600;
}

.standings-table td {
  padding: 12px;
  border-bottom: 1px solid #e0e0e0;
  font-size: 14px;
}

.standings-table tr:hover {
  background: #f8f9fa;
}

.position {
  font-weight: 700;
  color: #2a5298;
  width: 40px;
}

.team-highlight {
  background: linear-gradient(90deg, rgba(42, 82, 152, 0.1) 0%, transparent 100%);
  font-weight: 600;
}
</style>
</head>
<body>

<div class="container">
  <aside class="sidebar">
    <h2>⚽ Football Team</h2>
    <p class="subtitle">Management System</p>
    <ul class="nav">
      <li><a href="dashboard.jsp"><span>📊</span> Dashboard</a></li>
      <li><a href="profile.jsp"><span>👤</span> Profile</a></li>
      <li><a href="performance.jsp"><span>📈</span> Performance</a></li>
      <li><a href="schedule.jsp"><span>📅</span> Schedule</a></li>
      <li><a href="matches.jsp" class="active"><span>🏆</span> Matches</a></li>
      <li><a href="messages.jsp"><span>💬</span> Messages</a></li>
      <li><a href="logout.jsp"><span>🚪</span> Logout</a></li>
    </ul>
  </aside>

  <main class="main-content">
    <div class="page-title">
      <h1>🏆 Match Center</h1>
      <p style="color: #666; margin-top: 10px;">View all matches, results and standings</p>
    </div>

    <div class="team-stats">
      <div class="stat-box">
        <div class="stat-value">14</div>
        <div class="stat-label">Wins</div>
      </div>
      <div class="stat-box">
        <div class="stat-value">3</div>
        <div class="stat-label">Draws</div>
      </div>
      <div class="stat-box">
        <div class="stat-value">3</div>
        <div class="stat-label">Losses</div>
      </div>
      <div class="stat-box">
        <div class="stat-value">45</div>
        <div class="stat-label">Goals For</div>
      </div>
      <div class="stat-box">
        <div class="stat-value">18</div>
        <div class="stat-label">Goals Against</div>
      </div>
    </div>

    <div class="matches-section">
      <div class="section-header">
        <h2>📅 Upcoming Matches</h2>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">League Round 15</span>
          <span class="match-date">📅 25 Nov 2024 • 4:00 PM • City Stadium</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">⚽</div>
            <div class="team-name">Our Team FC</div>
          </div>
          <div class="match-score">
            <div class="vs">VS</div>
          </div>
          <div class="team">
            <div class="team-logo">🛡️</div>
            <div class="team-name">Warriors FC</div>
          </div>
        </div>
        <div class="match-result result-upcoming">Upcoming Match</div>
        <div class="match-details">
          <div class="detail-item">
            <div class="detail-label">Venue</div>
            <div class="detail-value">City Stadium</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Referee</div>
            <div class="detail-value">John Smith</div>
          </div>
          <div class="detail-item">
            <div class="detail-label">Weather</div>
            <div class="detail-value">☀️ Sunny</div>
          </div>
        </div>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">Cup Quarter Final</span>
          <span class="match-date">📅 28 Nov 2024 • 5:30 PM • National Stadium</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">⚽</div>
            <div class="team-name">Our Team FC</div>
          </div>
          <div class="match-score">
            <div class="vs">VS</div>
          </div>
          <div class="team">
            <div class="team-logo">⚡</div>
            <div class="team-name">Thunder United</div>
          </div>
        </div>
        <div class="match-result result-upcoming">Knockout Stage</div>
      </div>
    </div>

    <div class="matches-section">
      <div class="section-header">
        <h2>✅ Recent Results</h2>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">League Round 14</span>
          <span class="match-date">📅 20 Nov 2024 • City Stadium</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">⚽</div>
            <div class="team-name">Our Team FC</div>
          </div>
          <div class="match-score">
            <div class="score">
              <span>3</span>
              <span style="font-size: 24px; color: #999;">-</span>
              <span>1</span>
            </div>
          </div>
          <div class="team">
            <div class="team-logo">🛡️</div>
            <div class="team-name">Warriors FC</div>
          </div>
        </div>
        <div class="match-result result-won">🎉 Victory!</div>
        <div class="player-performance">
          <h4>Your Performance</h4>
          <div class="player-stats">
            <span>⚽ 2 Goals</span>
            <span>🎯 1 Assist</span>
            <span>⭐ Rating: 9.0</span>
            <span>⏱️ 90 minutes</span>
          </div>
        </div>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">League Round 13</span>
          <span class="match-date">📅 15 Nov 2024 • Away Ground</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">⚽</div>
            <div class="team-name">Our Team FC</div>
          </div>
          <div class="match-score">
            <div class="score">
              <span>4</span>
              <span style="font-size: 24px; color: #999;">-</span>
              <span>2</span>
            </div>
          </div>
          <div class="team">
            <div class="team-logo">⚡</div>
            <div class="team-name">Thunder United</div>
          </div>
        </div>
        <div class="match-result result-won">🎉 Victory!</div>
        <div class="player-performance">
          <h4>Your Performance</h4>
          <div class="player-stats">
            <span>⚽ 1 Goal</span>
            <span>🎯 2 Assists</span>
            <span>⭐ Rating: 8.5</span>
            <span>⏱️ 90 minutes</span>
          </div>
        </div>
      </div>

      <div class="match-card">
        <div class="match-header">
          <span class="match-competition">League Round 12</span>
          <span class="match-date">📅 10 Nov 2024 • City Stadium</span>
        </div>
        <div class="match-teams">
          <div class="team">
            <div class="team-logo">⚽</div>
            <div class="team-name">Our Team FC</div>
          </div>
          <div class="match-score">
            <div class="score">
              <span>2</span>
              <span style="font-size: 24px; color: #999;">-</span>
              <span>2</span>
            </div>
          </div>
          <div class="team">
            <div class="team-logo">🦅</div>
            <div class="team-name">Phoenix FC</div>
          </div>
        </div>
        <div class="match-result result-draw">⚖️ Draw</div>
        <div class="player-performance">
          <h4>Your Performance</h4>
          <div class="player-stats">
            <span>⚽ 0 Goals</span>
            <span>🎯 1 Assist</span>
            <span>⭐ Rating: 7.5</span>
            <span>⏱️ 78 minutes</span>
          </div>
        </div>
      </div>
    </div>

    <div class="standings">
      <h3>📊 League Standings</h3>
      <table class="standings-table">
        <thead>
          <tr>
            <th>Pos</th>
            <th>Team</th>
            <th>P</th>
            <th>W</th>
            <th>D</th>
            <th>L</th>
            <th>GF</th>
            <th>GA</th>
            <th>GD</th>
            <th>Pts</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="position">1</td>
            <td>Lions SC</td>
            <td>20</td>
            <td>16</td>
            <td>2</td>
            <td>2</td>
            <td>52</td>
            <td>15</td>
            <td>+37</td>
            <td><strong>50</strong></td>
          </tr>
          <tr class="team-highlight">
            <td class="position">2</td>
            <td><strong>⚽ Our Team FC</strong></td>
            <td>20</td>
            <td>14</td>
            <td>3</td>
            <td>3</td>
            <td>45</td>
            <td>18</td>
            <td>+27</td>
            <td><strong>45</strong></td>
          </tr>
          <tr>
            <td class="position">3</td>
            <td>Phoenix FC</td>
            <td>20</td>
            <td>13</td>
            <td>4</td>
            <td>3</td>
            <td>42</td>
            <td>20</td>
            <td>+22</td>
            <td><strong>43</strong></td>
          </tr>
          <tr>
            <td class="position">4</td>
            <td>Thunder United</td>
            <td>20</td>
            <td>12</td>
            <td>3</td>
            <td>5</td>
            <td>38</td>
            <td>22</td>
            <td>+16</td>
            <td><strong>39</strong></td>
          </tr>
          <tr>
            <td class="position">5</td>
            <td>Warriors FC</td>
            <td>20</td>
            <td>11</td>
            <td>4</td>
            <td>5</td>
            <td>35</td>
            <td>25</td>
            <td>+10</td>
            <td><strong>37</strong></td>
          </tr>
        </tbody>
      </table>
    </div>
  </main>
</div>

</body>
</html>