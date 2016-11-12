<?php
	session_start();
	define('BASE', 'BASE');
	require_once '../utility/utility.php';

	if(isset($_POST['submit'])){
		if(isset($_POST['code[]'])){
			var_dump($_POST['code[]']);
		} else {
			echo 'KAMPRET GK ADA';
		}
	} else {
		redirect('./');
	}

?>