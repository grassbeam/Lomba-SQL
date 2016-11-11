<?php
	session_start();
	define('BASE', 'BASE');
	require_once './utility/config.php';
	require_once './utility/connection.php';
	require_once './utility/utility.php';
	
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
				<a href="login.php/">login</a>
			<?php } else {
				?>
				<a href="./logout.php">logout</a>
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
	
	<?php
		if (isset($_SESSION['NAME_CODE'])) {	
			require_once './view/submit.php';
		} else {

		}
	?>	

</body>
</html>