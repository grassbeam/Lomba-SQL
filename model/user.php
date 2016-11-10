<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');

	Class DB_USER extends Database{
		function getLogin($username, $password) {
			$this->check_connection();
			$username = $this->sanitize($username);
			$password = $this->sanitize($password);
			$query = "SELECT * FROM login"

		}
	}


?>