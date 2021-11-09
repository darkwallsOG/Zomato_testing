<?php

// connect to database
include "includes/dbconn.php";
session_start();

// receive form data
$name = $_POST['user_name'];
$email = $_POST['user_email'];
$password = $_POST['user_password'];

$query3 = "SELECT * FROM users WHERE email LIKE '$email'";
$result2 = mysqli_query($conn,$query3);
$num_rows = mysqli_num_rows($result2);

if($num_rows == 0){
	// insert into database
	$query = "INSERT INTO users (user_id,name,email,password) VALUES (NULL,'$name','$email','$password')";

	if(mysqli_query($conn,$query)){
		// search users table
		$query2 = "SELECT * FROM users WHERE email LIKE '$email'";
		$result = mysqli_query($conn,$query2);
		$result = mysqli_fetch_assoc($result);

		$_SESSION['user_id'] = $result['user_id'];
		$_SESSION['name'] = $result['name'];
		header('Location:profile.php');
	}else{
		echo "Reg Failed";
	}
}else{
	echo "Email already exists";
}

?>