<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');
	
	Class SBO extends Connection {

		function close(){
			$this->klasclos();
		}

		function getContestantRank(){
			$this->check_connection();
			$query = "SELECT c.name_code, c.name, c.school, count(verdict) verd , Sum(s.time_after_penalty) totscore FROM scoreboard s JOIN contestant c ON(s.name_code = c.name_code) WHERE s.verdict!=0 group by c.name_code, c.name, c.school ORDER BY verd asc, totscore asc";
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

		function getSumProb(){
			$this->check_connection();
			$query = "SELECT (COUNT(*)-1) NUM FROM problem";
			$result = $this->select($query);
			$row = oci_fetch_assoc($result);
			$nr = $row['NUM'];
			if($nr > 0) {
				return $nr;
			} else {
				return NULL;
			}
		}

		function getProbScore($name_code){
			$this->check_connection();
			$query = "Select * from scoreboard WHERE name_code = '" . $name_code . "' ORDER BY prob_num asc";
			$result = $this->select($query);
			// var_dump($result);
			$ress = array(array());
			$count =0 ;
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

		function getScore($name_code, $prob_num){
			$this->check_connection();
			$query = "SELECT * FROM scoreboard WHERE name_code = '" . $name_code . "' AND prob_num = '" . $prob_num . "'";
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