<?php
	if (!defined('BASE')) die('<h1 class="try-hack">Restricted access!</h1>');

	require_once './model/scoreboard.php';
	$scoreboard = new SB();
	$sblist = $scoreboard->getList();
?>