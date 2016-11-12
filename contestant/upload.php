<?php
	session_start();
	define('BASE', 'BASE');
	require_once '../utility/utility.php';

	if(isset($_POST['submit'])){
		echo 'file_uploads: '. ini_get('file_uploads'). '<br />';
		echo 'upload_tmp_dir: '. ini_get('upload_tmp_dir'). '<br />';
		echo 'upload_max_filesize: '. ini_get('upload_max_filesize'). '<br />';
		echo 'max_file_uploads: '. ini_get('max_file_uploads'). '<br />';
		if(isset($_FILES['code[]'])){
			print_r($_FILES['code[]']);
		} else {
			echo 'KAMPRET GK ADA ' . $_FILES['code[]']['error'];
		}
	} else {
		redirect('./');
	}

?>