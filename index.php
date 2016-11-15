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
</head>
<body>
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
	
	<div>
	  
	</div>

	<div>
		<div style="margin-left:auto;margin-right:auto;">
			<p>
				<img src="./images/logo.png" alt="COMP_LOGO" title="COMP_LOGO" align="middle" />
			</p>
		</div>
		<br>
		<div style="margin-left:auto;margin-right:auto;">
			<img src="./images/logoSI.png" alt="FTI_UNTAR" title="FTI_UNTAR" align="middle" />
		</div>
	</div>

</body>
</html>