<?php
	session_start();
	define('BASE', 'BASE');
	require_once './utility/config.php';
	require_once './utility/database.php';
	require_once './utility/utility.php';

	require_once './model/querytester.php';



	if (isset($_POST['query'])){
		$quer = $_POST['query'];
		$tester = new testquer();
		$ress = $tester->querytester($quer);
		var_dump($ress);
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<form action="./" method="POST">
		<input type="text" name="query" id="query">
		<input type="submit"/>
	</form>
</body>
</html>