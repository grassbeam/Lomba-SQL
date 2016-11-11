<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');

	Class DB_USER extends Connection{
		function getLogin($username, $password) {
			// $this->check_connection();
			// $username = $this->sanitize($username);
			// $password = $this->sanitize($password);
			// $query = "SELECT * FROM login"

		}

		function importUser($arr){
			$ress = array(array());
			$ct = 1;
			foreach ($arr as $row ) {
				# code..
				$resrow = array();
				if($ct < 10){
					$namecode = "sql-0" . $ct;
				} else {
					$namecode = "sql-" . $ct;
				}
				$query = "INSERT INTO contestant (name_code, name, school) VALUES ('" . $namecode . "', '" . $row['NAME'] . "', '" . $row['SCHOOL'] . "')";
				// var_dump($query);
				// echo "<br/>";
				$ressz = $this->insertUser($query);
				$resrow['STATUS'] = $ressz;
				$resrow['NAME'] = $row['NAME'];
				$resrow['SCHOOL'] = $row['SCHOOL'];
				$resrow['NAME_CODE'] = $namecode;
				$resrow['USERNAME'] = "-";
				$resrow['PASSWORD'] = "-";
				$ress[$ct-1] = $resrow;
				$ct++;
			}
			return $ress;
		}

	}


?>