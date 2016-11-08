<?php
	Class testquer extends Database{
		function querytester($query) {
			$this->check_connection();
			$result = $this->query($query);

			return $result;
		}
	}
?>