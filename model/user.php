<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');

	Class DB_USER extends Connection{
		function getLogin($username, $password) {
			$this->check_connection();
			$cons = $this->getConn();
			$stid = oci_parse($cons, 'SELECT * FROM login where username = :bus');
			oci_bind_by_name($stid, ':bus', $username);
			oci_execute($stid);
			$row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS);
			oci_free_statement($stid);
			// var_dump($row['PASSWORD']);
			// var_dump($password);
			if($row['PASSWORD'] == $password){
				$_SESSION['NAME_CODE'] = $row['NAME_CODE'];
				return true;
			} else {
				return NULL;
			}
		}


	}


?>