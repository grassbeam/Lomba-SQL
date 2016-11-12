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
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<script>
	$("form").submit(function {
		prevent
		var probid = Document.getElementById('probid');
		var valprobid = probid.option[probid.selectedIndex].value;
		var langid = Document.getElementById('langid');
		var vallangid = vallangid.option[langid.selectedIndex].value;
		var error = false;

		if(valprobid == "") {
			error = true;
			probid.className = "errorfield";
		}
		if(vallangid == "") {
			error = true;
			langid.className = "errorfield";
		}

		if(error){
			return false;
		} else {
			return confirm("Want to Submit?");
		}

	});
</script>
	<form action="./" method="POST">
		<input type="file" name="code[]" id="maincode" required multiple />
	<select name="probid" id="probid">
	<option value="1">A</option>
	<option value="2">B</option>
	<option value="3">C</option>
	<option value="4">D</option>
	<option value="5">E</option>
	<option value="6">F</option>
	<option value="8">G</option>
	<option value="9">H</option>
	<option value="11">I</option>
	<option value="12">J</option>
	<option value="" selected="selected">problem</option>
	</select>
	<select name="langid" id="langid">
	<option value="sql">SQL</option>
	<option value="sql">TXT</option>
	<option value="" selected="selected">file format</option>
	</select>
	<input type="submit" name="submit" id="submit" value="submit"  onclick="confirm('test kampret!'');" />
	<input type="reset" value="cancel"  />
	</form>
</body>
</html>