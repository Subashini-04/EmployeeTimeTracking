
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #73C8A9, #373B44);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 90%;
            text-align: center;
        }

        .brand {
            font-size: 2em;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-size: 1em;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #73C8A9;
            outline: none;
        }

        .form-group button {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            border: none;
            border-radius: 5px;
            background-color: #73C8A9;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group button:hover {
            background-color: #67B89B;
        }

        .error-message {
            color: #FF6B6B;
            font-size: 0.9em;
            margin-top: 10px;
            text-align: center;
        }

        .bottom-text {
            margin-top: 20px;
            font-size: 0.9em;
            color: #555;
        }

        .bottom-text a {
            color: #73C8A9;
            text-decoration: none;
            transition: color 0.3s;
        }

        .bottom-text a:hover {
            color: #67B89B;
        }

        /* Popup Styles */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            z-index: 2;
            width: 300px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .popup .input-group {
            margin-bottom: 10px;
            text-align: left;
        }

        .popup button {
            background-color: #73C8A9;
            margin-top: 10px;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .popup button:hover {
            background-color: #67B89B;
        }

        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
            display: none;
        }

        .popup .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 1.2em;
            color: #73C8A9;
            cursor: pointer;
            transition: color 0.3s;
        }

        .popup .close-button:hover {
            color: #67B89B;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="brand">Login</div>
        <form action="login" method="post" class="login-form">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label for="username">Account Number</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
            <%-- Display error message if login fails --%>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="error-message"><%= request.getAttribute("errorMessage") %></div>
            <% } %>
        </form>
        <div class="bottom-text">
            Forgot your password?
            <a href="#" onclick="showPopup('passwordUpdatePopup')">Reset here</a>
        </div>
    </div>

    <!-- Password Update Popup -->
    <div class="popup" id="passwordUpdatePopup">
        <div class="popup-overlay" onclick="hidePopup('passwordUpdatePopup')"></div>
        <div class="popup-content">
            <span class="close-button" onclick="hidePopup('passwordUpdatePopup')">&times;</span>
            <form action="updatePassword" method="post">
                <input type="hidden" name="action" value="updatePassword">
                <div class="input-group">
                    <label for="acc_no">Account Number</label>
                    <input type="text" id="acc_no" name="accno" required>
                </div>
                <div class="input-group">
                    <label for="oldPassword">Old Password</label>
                    <input type="password" id="oldPassword" name="oldPassword" required>
                </div>
                <div class="input-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" required>
                </div>
                <div class="input-group">
                    <label for="confirmPassword">Confirm New Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>
                <button type="submit">Change Password</button>
            </form>
        </div>
    </div>

    <script>
        function showPopup(popupId) {
            document.getElementById(popupId).style.display = 'block';
            document.body.style.overflow = 'hidden'; // Prevent scrolling when popup is open
        }

        function hidePopup(popupId) {
            document.getElementById(popupId).style.display = 'none';
            document.body.style.overflow = 'auto'; // Enable scrolling when popup is closed
        }
    </script>
</body>
</html>
