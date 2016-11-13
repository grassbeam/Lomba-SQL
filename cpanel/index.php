<?php
	session_start();
	define('BASE', 'BASE');
	require_once '../utility/config.php';
	// require_once '../utility/database.php';
	require_once '../utility/connection.php';
	require_once '../utility/utility.php';
	// require_once '../model/scoreboard.php';
	require_once '../model/scoreboard-oracle.php';
	require_once './controller/scoreboard-controller.php';

	$starttime = "1478982205.000000000"; // select from db later
	$endtime = "1478992205.000000000"; // select from db later
	$timernow = strtotime("now");
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/domjudge.js"></script>
</head>
<body>
	<nav>
		<div id="menutop">
			<a href="./">home</a>
			<?php if (!isset($_SESSION['login-id'])) {
				?>
				<a href="login.php/">login</a>
			<?php } else {
				?>
				<a href="submission.php/">submission</a>
				<a href="import.php/">import user</a>
				<a href="logout.php/">logout</a>
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
			var initial = <?php echo $timernow;?>;
			var activatetime = 1195369200.000000000;
			var starttime = <?php echo $starttime;?> ;
			var endtime = <?php echo $endtime;?> ;
			var offset = 0;
			var date = new Date(initial*1000);
			var timeleftelt = document.getElementById("timeleft");
			setInterval(function(){updateClock();},1000);
			updateClock();
		</script>
	</div>
	

</body>
</html>