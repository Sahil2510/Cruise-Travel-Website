<?php
require_once 'config.php';
require_once 'session.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {

    $fullname = trim($_POST['Full name']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $confirm_password = trim($_POST['confirm_password']);
    $password_hash = password_hash($_password, PASSWORD_BCRYPT);

    if($query = $db->prepare("SELECT * FROM users WHERE email = ?")) {
        $error = '';


    $query->bind_param('s', $email);
    $query->execute();

    $query->store_result();
        if ($query->num_rows > 0) {
            $error .= '<p class="error">The email address is already registered!</p>';

        } else {
            if (strlen($password) < 6) {
                $error .= '<p class="error">Password must have atleast 6 characters.</p>';

            }

            if (empty($confirm_password)) {
                $error .= '<p class="error">Password did not match.</p>';
            }
         }
         if (empty($error) ) {
             $insertQuery = $db->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?);");
             $insertQuery->bind_param("sss", $fullname, $email, $password_hash);
             $result = $insertQuery->execute();
             if ($result) {
                 $error .= '<p class="success">Your registration was successful!</p>';
             } else {
                 $error .= '<p class="error">Something went wrong!</p>';
             }
         }
    }
}
$query->close();
$insertQuery->close();

mysqli_close($db)
}




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cruise Booking Form</title>
    <link rel="stylesheet" href="registration.css">
     <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>
	
    <div class="container"><!--container-->

        <form class="form-group"><!--form-->
            <h1 class="text-center">Cruise Booking Form</h1>

            <div id="form"><!--form-->
                <h3 class="text-white">Booking Details</h3>

            <div id="input"><!--input-->
                <input type="text" id="input-group" placeholder="From">
                <input type="text" id="input-group" placeholder="To">
                <input type="text" id="input-group" placeholder="Departure Date">
                <input type="text" id="input-group" placeholder="Departure Time">
                <select  id="input-group" style="background: black;">
                    <option value="">Preffered Cruise</option>
                    <option value="">Royal Carribean</option>
                    <option value="">Celebrity Cruises</option>
                    <option value="">Jalesh Cruise</option>
                </select>
                <select  id="input-group" style="background: black;">
                    <option value="">Preffered Seating</option>
                    <option value="">Economy Class</option>
                    <option value="">Business Class</option>
                    <option value="">First Class</option>
                </select>
                </div><!--input-->

                <div id="input2"><!--input2-->
                    <input type="number" id="input-group" placeholder="Adult">
                    <input type="number" id="input-group" placeholder="Children(2-11years)">
                    <input type="number" id="input-group" placeholder="infant(under 2years)">
                </div><!--input2-->

                <div id="input3"><!--input3-->
                    <span id="input-group" class="text-primary">Select Your Fare</span> 
                    <input type="radio" id="input-group" name="r">
                    <label class="text-white" for="input-group">One Way</label>
                    <input type="radio" id="input-group" name="r">
                    <label class="text-white" for="input-group">Round Trip</label>
                </div><!--input3-->

                <div id="input4"><!--input4-->
                    <input type="text" id="input-group" placeholder="Return Date">
                    <input type="text" id="input-group" placeholder="Return time">
                    <input type="text" id="input-group1" placeholder="Any Message">
                </div><!--input4-->

                <div id="input5"><!--input5-->
                    <h3 class="text-white">Personal Details</h3>
                </div><!--input5-->

                <div id="input6"><!--input6-->
                    <input type="text" id="input-group" placeholder="Full Name">
                    <input type="number" id="input-group" placeholder="Phone Number">
                    <input type="email" id="input-group1" placeholder="Email">
                </div><!--input6-->
                <button onclick="window.location.href='mailto:dalimasskk@gmail.com';" type="submit" class="btn btn-warning text-white">Submit Form</button>
                <button type="reset" class="btn btn-primary">Clear Form</button>
            </div><!--form-->

        </form><!--form-->

    </div><!--container-->
</body>
</html>