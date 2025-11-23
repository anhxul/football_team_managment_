<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Messages - Football Team</title>
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
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.page-title h1 {
  color: #1e3c72;
  font-size: 28px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.compose-btn {
  padding: 10px 25px;
  background: linear-gradient(135deg, #2a5298, #1e3c72);
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  gap: 8px;
}

.compose-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(42, 82, 152, 0.4);
}

.messages-container {
  display: grid;
  grid-template-columns: 350px 1fr;
  gap: 20px;
  height: calc(100vh - 200px);
}

.messages-list {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 15px;
  padding: 20px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  overflow-y: auto;
}

.messages-list h3 {
  color: #1e3c72;
  margin-bottom: 15px;
  font-size: 18px;
  padding-bottom: 15px;
  border-bottom: 2px solid #e0e0e0;
}

.message-item {
  padding: 15px;
  border-radius: 10px;
  margin-bottom: 10px;
  cursor: pointer;
  transition: all 0.3s ease;
  border-left: 4px solid transparent;
}

.message-item:hover {
  background: #f8f9fa;
  border-left-color: #2a5298;
}

.message-item.active {
  background: linear-gradient(90deg, rgba(42, 82, 152, 0.1) 0%, transparent 100%);
  border-left-color: #2a5298;
}

.message-item.unread {
  background: #e3f2fd;
}

.message-header {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 8px;
}

.avatar {
  width: 45px;
  height: 45px;
  border-radius: 50%;
  background: linear-gradient(135deg, #2a5298, #7e22ce);
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-weight: 700;
  font-size: 18px;
}

.message-info {
  flex: 1;
}

.sender-name {
  font-weight: 600;
  color: #333;
  font-size: 14px;
  margin-bottom: 3px;
}

.message-preview {
  color: #666;
  font-size: 13px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.message-time {
  font-size: 12px;
  color: #999;
  white-space: nowrap;
}

.unread-badge {
  width: 10px;
  height: 10px;
  background: #2a5298;
  border-radius: 50%;
  margin-left: auto;
}

.chat-view {
  background: rgba(255, 255, 255, 0.95);
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
}

.chat-header {
  padding: 20px 25px;
  border-bottom: 2px solid #e0e0e0;
  display: flex;
  align-items: center;
  gap: 15px;
}

.chat-header .avatar {
  width: 50px;
  height: 50px;
  font-size: 20px;
}

.chat-info h3 {
  color: #1e3c72;
  font-size: 18px;
  margin-bottom: 3px;
}

.chat-status {
  color: #666;
  font-size: 13px;
}

.chat-messages {
  flex: 1;
  padding: 25px;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.message-bubble {
  max-width: 70%;
  padding: 12px 18px;
  border-radius: 15px;
  font-size: 14px;
  line-height: 1.5;
}

.message-received {
  align-self: flex-start;
  background: #f0f0f0;
  color: #333;
  border-bottom-left-radius: 5px;
}

.message-sent {
  align-self: flex-end;
  background: linear-gradient(135deg, #2a5298, #1e3c72);
  color: white;
  border-bottom-right-radius: 5px;
}

.message-timestamp {
  font-size: 11px;
  color: #999;
  margin-top: 5px;
  display: block;
}

.message-sent .message-timestamp {
  color: rgba(255, 255, 255, 0.7);
}

.chat-input {
  padding: 20px 25px;
  border-top: 2px solid #e0e0e0;
  display: flex;
  gap: 15px;
  align-items: center;
}

.chat-input input {
  flex: 1;
  padding: 12px 20px;
  border: 2px solid #e0e0e0;
  border-radius: 25px;
  font-size: 14px;
  transition: all 0.3s ease;
}

.chat-input input:focus {
  outline: none;
  border-color: #2a5298;
}

.send-btn {
  width: 45px;
  height: 45px;
  background: linear-gradient(135deg, #2a5298, #1e3c72);
  color: white;
  border: none;
  border-radius: 50%;
  font-size: 18px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.send-btn:hover {
  transform: scale(1.1);
}

.empty-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #999;
}

.empty-state-icon {
  font-size: 80px;
  margin-bottom: 20px;
}

.empty-state p {
  font-size: 16px;
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
      <li><a href="matches.jsp"><span>🏆</span> Matches</a></li>
      <li><a href="messages.jsp" class="active"><span>💬</span> Messages</a></li>
      <li><a href="logout.jsp"><span>🚪</span> Logout</a></li>
    </ul>
  </aside>

  <main class="main-content">
    <div class="page-title">
      <h1>💬 Messages</h1>
      <button class="compose-btn">
        <span>✏️</span>
        <span>New Message</span>
      </button>
    </div>

    <div class="messages-container">
      <div class="messages-list">
        <h3>Conversations</h3>

        <div class="message-item active unread">
          <div class="message-header">
            <div class="avatar">C</div>
            <div class="message-info">
              <div class="sender-name">Coach Anderson</div>
              <div class="message-preview">Great performance today! Keep it up...</div>
            </div>
            <div>
              <div class="message-time">10:30 AM</div>
              <div class="unread-badge"></div>
            </div>
          </div>
        </div>

        <div class="message-item unread">
          <div class="message-header">
            <div class="avatar">T</div>
            <div class="message-info">
              <div class="sender-name">Team Group</div>
              <div class="message-preview">Tomorrow's practice at 6 AM sharp!</div>
            </div>
            <div>
              <div class="message-time">9:45 AM</div>
              <div class="unread-badge"></div>
            </div>
          </div>
        </div>

        <div class="message-item">
          <div class="message-header">
            <div class="avatar">M</div>
            <div class="message-info">
              <div class="sender-name">Manager Smith</div>
              <div class="message-preview">Need to discuss contract details</div>
            </div>
            <div class="message-time">Yesterday</div>
          </div>
        </div>

        <div class="message-item">
          <div class="message-header">
            <div class="avatar">P</div>
            <div class="message-info">
              <div class="sender-name">Physio Johnson</div>
              <div class="message-preview">Your fitness report is ready</div>
            </div>
            <div class="message-time">Yesterday</div>
          </div>
        </div>

        <div class="message-item">
          <div class="message-header">
            <div class="avatar">K</div>
            <div class="message-info">
              <div class="sender-name">Keeper Mike</div>
              <div class="message-preview">Want to practice penalties?</div>
            </div>
            <div class="message-time">2 days ago</div>
          </div>
        </div>

        <div class="message-item">
          <div class="message-header">
            <div class="avatar">D</div>
            <div class="message-info">
              <div class="sender-name">Defender Carlos</div>
              <div class="message-preview">Thanks for the assist yesterday!</div>
            </div>
            <div class="message-time">3 days ago</div>
          </div>
        </div>

        <div class="message-item">
          <div class="message-header">
            <div class="avatar">N</div>
            <div class="message-info">
              <div class="sender-name">Nutritionist Sara</div>
              <div class="message-preview">Updated meal plan for next week</div>
            </div>
            <div class="message-time">1 week ago</div>
          </div>
        </div>
      </div>

      <div class="chat-view">
        <div class="chat-header">
          <div class="avatar">C</div>
          <div class="chat-info">
            <h3>Coach Anderson</h3>
            <div class="chat-status">🟢 Online</div>
          </div>
        </div>

        <div class="chat-messages">
          <div class="message-bubble message-received">
            Hey! I watched your performance in today's match. You were outstanding!
            <span class="message-timestamp">9:15 AM</span>
          </div>

          <div class="message-bubble message-received">
            Those two goals were phenomenal. Your positioning and timing were perfect.
            <span class="message-timestamp">9:16 AM</span>
          </div>

          <div class="message-bubble message-sent">
            Thank you so much, Coach! I've been working hard on my finishing.
            <span class="message-timestamp">9:20 AM</span>
          </div>

          <div class="message-bubble message-sent">
            The team played really well together today.
            <span class="message-timestamp">9:20 AM</span>
          </div>

          <div class="message-bubble message-received">
            Absolutely! I want to see the same energy in tomorrow's training session. We have a big match coming up against Thunder United.
            <span class="message-timestamp">9:25 AM</span>
          </div>

          <div class="message-bubble message-sent">
            Definitely! I'll be there at 6 AM sharp. Ready to give 100%!
            <span class="message-timestamp">9:27 AM</span>
          </div>

          <div class="message-bubble message-received">
            Great! Also, we need to work on your defensive positioning. I'll show you some drills tomorrow.
            <span class="message-timestamp">10:30 AM</span>
          </div>
        </div>

        <div class="chat-input">
          <input type="text" placeholder="Type your message here...">
          <button class="send-btn">📤</button>
        </div>
      </div>
    </div>
  </main>
</div>

</body>
</html>