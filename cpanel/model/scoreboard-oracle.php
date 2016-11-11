<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');
	
	Class SBO extends Connection {

		function getList(){
			$this->check_connection();
			$query = "SELECT c.name_code, c.name, c.school, t.score FROM contestant c, totalscore t WHERE c.name_code = t.name_code ORDER BY t.score DESC";
			$result = $this->select($query);
			// var_dump($result);
			$ress = array(array());
			$count =0 ;
			// $row = oci_fetch_assoc($result);
			// var_dump($row);
			while(($row = oci_fetch_assoc($result)) != false ){
				$ress[$count] = $row;
				$count++;
			}
			$nrows = $count;
			if ($nrows > 0) {
			    return $ress;
			} else {
			    return NULL;
			}
		}

	}


?>