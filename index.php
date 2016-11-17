<?php
	session_start();
	define('BASE', 'BASE');
	require_once './utility/config.php';
	require_once './utility/connection.php';
	require_once './utility/utility.php';
	if(isset($_SESSION['NAME_CODE'])){
		redirect('./contestant');
	}
	
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="./css/style.css">
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/domjudge.js"></script>
	<script type="text/javascript">
		function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('timer').innerHTML = "Jam: " + 
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
	</script>
</head>
<body onload="startTime()">
	<nav>
		<div id="menutop">
			<a href="./">home</a>
			<?php if (!isset($_SESSION['NAME_CODE'])) {
				?>
				<a href="./auth/login.php">login</a>
			<?php } else {
				?>
				<a href="./auth/logout.php">logout</a>
				<?php
			}
			?>
		</div>
	</nav>
	<div id="menutopright">
		<div id="clock">
			<span id="timeleft"></span>
		</div>
		<script type="text/javascript">
			
		</script>
	</div>
	<br>
	<br>
	<br>
	<div align="middle">
		<h1>UNTAR SQL COMPETITION</h1>
		<h1 id="timer"></h1>
	</div>
	<br>
	<br>
	<br>
	<div style="display:block; margin:auto; padding-left: 28%;">
		<img src="./images/logoSI.png" alt="FTI_UNTAR" title="FTI_UNTAR" align="middle" class="center" />
	</div>
	<br>
	<br>
	<br>
	<br>
	<div style="display:block; margin:auto; padding-left: 28%;">
		<img src="./images/logo.png" alt="COMP_LOGO" title="COMP_LOGO" align="middle"  />
	</div>
	
	

</body>
</html>