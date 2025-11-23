<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Schedule - Football Team</title>
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

.tabs {
  display: flex;
  gap: 10px;
  margin-bottom: 30px;
  background: rgba(255, 255, 255, 0.95);
  padding: 20px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.tab-btn {
  flex: 1;
  padding: 12px 20px;
  border: none;
  background: #f5f5f5;
  color: #555;
  border-radius: 8px;
  font-size: 15px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.tab-btn.active {
  background: linear-gradient(135deg, #2a5298, #1e3c72);
  color: white;
}

.schedule-grid {
  display: grid;
  gap: 20px;
}

.schedule-card {
  background: rgba(255, 255, 255, 0.95);
  padding: 25px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  display: flex;
  gap: 25px;
  transition: transform 0.3s ease;
  border-left: 5px solid #2a5298;
}

.schedule-card:hover {
  transform: translateX(5px);
}

.schedule-date {
  background: linear-gradient(135deg, #2a5298, #7e22ce);
  color: white;
  padding: 20px;
  border-radius: 10px;
  text-align: center;
  min-width: 100px;
}

.date-day {
  font-size: 36px;
  font-weight: 700;
  line-height: 1;
}

.date-month {
  font-size: 14px;
  margin-top: 5px;
  opacity: 0.9;
}

.date-time {
  font-size: 13px;
  margin-top: 10px;
  padding-top: 10px;
  border-top: 1px solid rgba(255, 255, 255, 0.3);
}

.schedule-details {
  flex: 1;
}

.schedule-type {
  display: inline-block;
  padding: 5px 12px;
  border-radius: 5px;
  font-size: 12px;
  font-weight: 600;
  margin-bottom: 10px;
}

.type-match {
  background: #d4edda;
  color: #155724;
}

.type-training {
  background: #cce5ff;
  color: #004085;
}

.type-meeting {
  background: #fff3cd;
  color: #856404;
}

.schedule-title {
  font-size: 20px;
  font-weight: 700;
  color: #1e3c72;
  margin-bottom: 10px;
}

.schedule-info {
  display: flex;
  gap: 20px;
  color: #666;
  font-size: 14px;
  margin-bottom: 15px;
}

.schedule-info span {
  display: flex;
  align-items: center;
  gap: 5px;
}

.schedule-description {
  color: #777;
  font-size: 14px;
  line-height: 1.6;
}

.calendar-view {
  background: rgba(255, 255, 255, 0.95);
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  margin-top: 30px;
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 25px;
}

.calendar-header h3 {
  color: #1e3c72;
  font-size: 22px;
}

.calendar-nav {
  display: flex;
  gap: 10px;
}

.calendar-nav button {
  padding: 8px 15px;
  border: none;
  background: #f5f5f5;
  border-radius: 5px;
  cursor: pointer;
  font-weight: 600;
  transition: all 0.3s ease;
}

.calendar-nav button:hover {
  background: #2a5298;
  color: white;
}

.calendar-grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 10px;
}

.calendar-day-header {
  text-align: center;
  font-weight: 600;
  color: #666;
  padding: 10px;
  font-size: 14px;
}

.calendar-day {
  aspect-ratio: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f8f9fa;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
  font-weight: 600;
  color: #333;
  position: relative;
}

.calendar-day:hover {
  background: #e9ecef;
}

.calendar-day.has-event {
  background: linear-gradient(135deg, #2a5298, #7e22ce);
  color: white;
}

.calendar-day.today {
  border: 2px solid #2a5298;
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
      <li><a href="schedule.jsp" class="active"><span>📅</span> Schedule</a></li>
      <li><a href="matches.jsp"><span>🏆</span> Matches</a></li>
      <li><a href="messages.jsp"><span>💬</span> Messages</a></li>
      <li><a href="logout.jsp"><span>🚪</span> Logout</a></li>
    </ul>
  </aside>

  <main class="main-content">
    <div class="page-title">
      <h1>📅 Schedule & Events</h1>
      <p style="color: #666; margin-top: 10px;">Your upcoming matches, trainings and meetings</p>
    </div>

    <div class="tabs">
      <button class="tab-btn active">All Events</button>
      <button class="tab-btn">Matches</button>
      <button class="tab-btn">Training</button>
      <button class="tab-btn">Meetings</button>
    </div>

    <div class="schedule-grid">
      <div class="schedule-card">
        <div class="schedule-date">
          <div class="date-day">25</div>
          <div class="date-month">NOV</div>
          <div class="date-time">⏰ 4:00 PM</div>
        </div>
        <div class="schedule-details">
          <span class="schedule-type type-match">⚽ MATCH</span>
          <div class="schedule-title">League Match vs Warriors FC</div>
          <div class="schedule-info">
            <span>📍 City Stadium</span>
            <span>👥 Full Squad</span>
            <span>🎯 League Round 15</span>
          </div>
          <div class="schedule-description">
            Important league match. Please arrive 1 hour before kickoff for warmup and team briefing.
          </div>
        </div>
      </div>

      <div class="schedule-card">
        <div class="schedule-date">
          <div class="date-day">24</div>
          <div class="date-month">NOV</div>
          <div class="date-time">⏰ 6:00 AM</div>
        </div>
        <div class="schedule-details">
          <span class="schedule-type type-training">🏃 TRAINING</span>
          <div class="schedule-title">Morning Training Session</div>
          <div class="schedule-info">
            <span>📍 Training Ground</span>
            <span>👥 All Players</span>
            <span>⏱️ 2 hours</span>
          </div>
          <div class="schedule-description">
            Focus on attacking strategies and set pieces. Bring training kit and boots.
          </div>
        </div>
      </div>

      <div class="schedule-card">
        <div class="schedule-date">
          <div class="date-day">23</div>
          <div class="date-month">NOV</div>
          <div class="date-time">⏰ 3:00 PM</div>
        </div>
        <div class="schedule-details">
          <span class="schedule-type type-meeting">📋 MEETING</span>
          <div class="schedule-title">Team Strategy Meeting</div>
          <div class="schedule-info">
            <span>📍 Club House</span>
            <span>👥 Starting XI</span>
            <span>⏱️ 1 hour</span>
          </div>
          <div class="schedule-description">
            Pre-match tactical discussion and opponent analysis for upcoming Warriors match.
          </div>
        </div>
      </div>

      <div class="schedule-card">
        <div class="schedule-date">
          <div class="date-day">28</div>
          <div class="date-month">NOV</div>
          <div class="date-time">⏰ 5:30 PM</div>
        </div>
        <div class="schedule-details">
          <span class="schedule-type type-match">⚽ MATCH</span>
          <div class="schedule-title">Cup Quarter Final vs Thunder United</div>
          <div class="schedule-info">
            <span>📍 National Stadium</span>
            <span>👥 Full Squad</span>
            <span>🏆 Cup Competition</span>
          </div>
          <div class="schedule-description">
            Knockout stage match. High-pressure game. Team dinner planned after the match.
          </div>
        </div>
      </div>

      <div class="schedule-card">
        <div class="schedule-date">
          <div class="date-day">30</div>
          <div class="date-month">NOV</div>
          <div class="date-time">⏰ 7:00 AM</div>
        </div>
        <div class="schedule-details">
          <span class="schedule-type type-training">🏃 TRAINING</span>
          <div class="schedule-title">Fitness & Conditioning</div>
          <div class="schedule-info">
            <span>📍 Gym & Track</span>
            <span>👥 All Players</span>
            <span>⏱️ 90 minutes</span>
          </div>
          <div class="schedule-description">
            Physical conditioning session with focus on endurance and strength training.
          </div>
        </div>
      </div>
    </div>

    <div class="calendar-view">
      <div class="calendar-header">
        <h3>📆 November 2024</h3>
        <div class="calendar-nav">
          <button>◀ Prev</button>
          <button>Today</button>
          <button>Next ▶</button>
        </div>
      </div>
      <div class="calendar-grid">
        <div class="calendar-day-header">Sun</div>
        <div class="calendar-day-header">Mon</div>
        <div class="calendar-day-header">Tue</div>
        <div class="calendar-day-header">Wed</div>
        <div class="calendar-day-header">Thu</div>
        <div class="calendar-day-header">Fri</div>
        <div class="calendar-day-header">Sat</div>

        <div class="calendar-day"></div>
        <div class="calendar-day"></div>
        <div class="calendar-day"></div>
        <div class="calendar-day"></div>
        <div class="calendar-day">1</div>
        <div class="calendar-day">2</div>
        <div class="calendar-day">3</div>
        <div class="calendar-day">4</div>
        <div class="calendar-day has-event">5</div>
        <div class="calendar-day">6</div>
        <div class="calendar-day">7</div>
        <div class="calendar-day has-event">8</div>
        <div class="calendar-day">9</div>
        <div class="calendar-day has-event">10</div>
        <div class="calendar-day">11</div>
        <div class="calendar-day">12</div>
        <div class="calendar-day">13</div>
        <div class="calendar-day">14</div>
        <div class="calendar-day has-event">15</div>
        <div class="calendar-day">16</div>
        <div class="calendar-day">17</div>
        <div class="calendar-day">18</div>
        <div class="calendar-day">19</div>
        <div class="calendar-day has-event">20</div>
        <div class="calendar-day">21</div>
        <div class="calendar-day">22</div>
        <div class="calendar-day today has-event">23</div>
        <div class="calendar-day has-event">24</div>
        <div class="calendar-day has-event">25</div>
        <div class="calendar-day">26</div>
        <div class="calendar-day">27</div>
        <div class="calendar-day has-event">28</div>
        <div class="calendar-day">29</div>
        <div class="calendar-day has-event">30</div>
      </div>
    </div>
  </main>
</div>

</body>
</html>