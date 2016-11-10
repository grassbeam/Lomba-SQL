<?php
	

?>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Scoreboard</title>
	<link rel="stylesheet" href="./css/style.css">
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/domjudge.js"></script>
</head>
<body>
	<h1>Not Authenticated</h1>

<p>
Please supply your credentials below, or contact a staff member for assistance.
</p>

<form action="./login.php" method="post">
	<input type="hidden" name="cmd" value="login" />
	<table>
		<tr>
			<td>
				<label for="login">Login:</label>
			</td>
			<td>
				<input type="text" id="login" name="login" value="" size="25" maxlength="25" accesskey="l" autofocus />
				</td>
		</tr>
		<tr>
			<td>
				<label for="passwd">Password:</label>
			</td>
			<td>
				<input type="password" id="passwd" name="passwd" value="" size="25" maxlength="255" accesskey="p" />
			</td>
		</tr>
		<tr><td></td><td><input type="submit" value="Login" /></td></tr>
	</table>
</form>

<hr />
<address>
	Azureblashh2177judge/6.6.6DEV at localhost Port 80, page generated 
	<span id="timecur"> <?php echo date("D d M Y H:i:s") . " WIB";?> </span>
</address>
</body>
</html>