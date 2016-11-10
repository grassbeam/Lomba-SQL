<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');
	
	$this->conn = oci_connect(DBUSER, DBPASS, DBSTRINGCON);
	if(!$this->conn) {
		$this->conn = NULL;
		die(oci_error());
	}


?>