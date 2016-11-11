<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');
	
	

	Class Connection {
		private $conn = NULL;

		function __construct(){
			$this->conn = oci_connect(DBUSER2, DBPASS2, DBSTRINGCON);
			if(!$this->conn) {
				$this->conn = NULL;
				die(oci_error());
			}
		}

		protected function check_connection() {
			if(is_null($this->conn))
			die('Error. uninitialize database connection');
		}

		function getConn(){
			return $this->conn;
		}

		function insertUser($query){
			$this->check_connection();
			$stmt = oci_parse($this->conn, $query);
			@oci_execute($stmt);
			$nr = oci_num_rows($stmt);
			oci_free_statement($stmt);
			if($nr>0){
				return $nr;
			} else {
				return 0;
			}
		}

		function select($query){
			$stid = oci_parse($this->conn, $query);
			oci_execute($stid);
			return $stid;
		}
	}


?>