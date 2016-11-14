<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');

	Class DB_HOBERT {

		private $query = array();
		private $conn = NULL;

		

	 	function __construct($user_name , $password) {
	 		// var_dump($user_name);
	 		// var_dump($password);
	 		$this->conn = oci_connect($user_name, $password, DBSTRINGCON);
			if(!$this->conn) {
				$this->conn = NULL;
				die(oci_error());
			}
	 		$this->query[0] = "create table peserta(
		    id_peserta varchar2(6) not null,
			nama varchar2(20) not null,
			jurusan varchar2(30) not null,
			total_sks  number not null,
			primary key(id_peserta))";
			$this->query[1] = "create table pelajaran(
		   kode_p varchar2(8) not null,
		   mata_pelajaran varchar2(30) not null,
		   jurusan varchar2(20) not null,
		   sks number not null,
		   primary key(kode_p))";
			$this->query[2] = "create table jadwal(
		   kode_p varchar2(8) not null,
		   sesi_jadwal char(1) not null,
		   semester varchar2(15) not null,
		   tahun char(4) not null,
		   gedung varchar2(15) not null,
		   ruang char(5) not null,
		   waktu char(6) not null,
		   foreign key(kode_p) references pelajaran(kode_p)
		 )";
			$this->query[3] = "create table pengajar(
		   id_pengajar char(6) not null,
		   nama varchar2(20) not null,
		   jurusan varchar2(30) not null,
		   honor number,
		   primary key(id_pengajar)  
		  )";
			$this->query[4] = "create table kelas(
		    id_pengajar char(6) not null,
		    kode_p varchar2(8) not null,
			semester varchar2(15) not null,
			tahun char(4) not null,
			foreign key(id_pengajar) references pengajar(id_pengajar),
			foreign key(kode_p) references pelajaran (kode_p)
		  )";
			$this->query[5] = "create table nilai(
		    id_peserta varchar2(6) not null,
			kode_p varchar2(8) not null,
			semester varchar2(15) not null,
			tahun char(4) not null,
			huruf_mutu char(2) null,
			foreign key(id_peserta) references peserta(id_peserta),
			foreign key(kode_p) references pelajaran(kode_p)
		  )";

	 	}

	 	protected function check_connection() {
			if(is_null($this->conn))
			die('Error. uninitialize database connection');
		}

	 	function executeAll(){
	 		$flags = true;
	 		for($i=0; $i<count($this->query); $i++){
	 			$quers = $this->query[$i];
	 			// var_dump($quers);
				$stmt = oci_parse($this->conn, $quers);
				$r = oci_execute($stmt);
				if($r) {
					$ress =  777;
				} else {
					$ress = NULL;
				}
	 			if(!isset($ress)) {
	 				$flags = false;
	 			}
	 		}
	 		oci_close($this->conn);
	 		if($flags) {
	 			return 666;
	 		} else {
	 			return NULL;
	 		}
	 	}

	}


?>