<?php
	session_start();
	define('BASE', 'BASE');
	require_once '../utility/config.php';
	require_once '../utility/connection.php';
	require_once '../utility/utility.php';
	require_once '../model/submits.php';
	require_once '../model/scoreboard-oracle.php';
	$hidvalform = $_SESSION['NAME_CODE'];
	$ussr = $_SESSION['USERNAME'];
	$DBSUBS = new DB_SUBMIT();
	$submitlist = $DBSUBS->getSubmission($hidvalform);
	$kosong = true;
	if(isset($submitlist)){
		$kosong = false;
	}
	$starttime = "1478982205.000000000"; // select from db later
	$endtime = "1478992205.000000000"; // select from db later
	$timernow = strtotime("now");
	$DBSBO = new SBO();
	$SBdetail = $DBSBO->getContestantDetail($hidvalform);
	$totalscore = $DBSBO->getTotalScore($hidvalform);
	$totalac = $DBSBO->getTotalAC($hidvalform);
	$probSums = $DBSBO->getProbnum();
	if(!isset($SBdetail) || !isset($probSums) ){
		die('<h1>ERROR DATABASE</h1>');
		exit();
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/octicons.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/domjudge.js"></script>
</Contestant y>
	<nav><div id="menutop">
<a target="_top" href="index.php" accesskey="o"><span class="octicon octicon-home"></span> overview</a>
<a target="_top" href="problems.php" accesskey="t"><span class="octicon octicon-book"></span> problems</a>
</div>

<div id="menutopright">
<div id="clock"><span id="timeleft"></span><div id="username">logged in as <abbr title="team">Contestant user</abbr> <a href="../auth/logout.php">×</a></div></div>
<script type="text/javascript">
	var initial = <?php echo $timernow;?>;
	var activatetime = 1195369200.000000000;
	var starttime = <?php echo $starttime;?> ;
	var endtime = <?php echo $endtime;?> ;
	var offset = 0;
	var date = new Date(initial*1000);
	var timeleftelt = document.getElementById("timeleft");

	setInterval(function(){updateClock();},1000);
	updateClock();
</script>
</div></nav>

<script type="text/javascript">
<!--
function getMainExtension(ext)
{
	switch(ext) {
		case 'sql': return 'sql';
		case 'txt': return 'txt';
		default: return '';
	}
}

function getProbDescription(probid)
{
	switch(probid) {
		case 'A': return 'Assemble';
		case 'B': return 'March of the Penguins';
		case 'C': return 'Containers';
		case 'D': return 'Youth Hostel Dorm';
		case 'E': return 'Escape from Enemy Territory';
		case 'F': return 'Flight Safety';
		case 'G': return 'Summits';
		case 'H': return 'Obfuscation';
		case 'I': return 'Tower Parking';
		case 'J': return 'Walk';
		default: return '';
	}
}
</script>
<h2 id="teamwelcome">Welcome <?php if(isset($_SESSION['NAME'])) echo $_SESSION['NAME']; else "NO_NAME"; ?></h2>
	<div class="teamscoresummary">
		<table class="scoreboard center">
			<colgroup><col id="scorerank" /><col id="scoreaffil" /><col id="scoreteamname" /></colgroup><colgroup><col id="scoresolv" /><col id="scoretotal" /></colgroup>
			<colgroup><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /><col class="scoreprob" /></colgroup>

			<thead>
				<tr class="scoreheader">
					<th title="rank" scope="col">rank</th>
					<th title="team name" scope="col" colspan="2">Name</th>
					<th title="# solved / penalty time" colspan="2" scope="col">score</th>
					<!-- PROBLEM LIST -->
				<?php for($i=0;$i<$probSums;$i++) { ?>
				<th title="Problem <?php echo $i+1; ?>" scope="col">
				<?php
					$huruf = $i+1;
					switch ($huruf) {
					 	case '1':
					 		?> A <div class="circle" style="background: #ff00ff;"><?php
					 		break;
					 	case '2':
					 		?> B <div class="circle" style="background: #6d4ea5;"><?php
					 		break;
					 	case '3':
					 		?> C <div class="circle" style="background: #8b4ec1;"><?php
					 		break;
					 	case '4':
					 		?> D <div class="circle" style="background: #bea0f0;"><?php
					 		break;
					 	case '5':
					 		?> E <div class="circle" style="background: #87011f;"><?php
					 		break;
					 	case '6':
					 		?> F <div class="circle" style="background: #855ef9;"><?php
					 		break;
					 	case '7':
					 		?> G <div class="circle" style="background: #0f077b;"><?php
					 		break;
					 	case '8':
					 		?> H <div class="circle" style="background: #cc78ed;"><?php
					 		break;
					 	case '9':
					 		?> I <div class="circle" style="background: #1a4c38;"><?php
					 		break;
					 	case '10':
					 		?> J <div class="circle" style="background: #da6234;"><?php
					 		break;
					 	case '11':
					 		?> K <div class="circle" style="background: #ff00ff;"><?php
					 		break;
					 	case '12':
					 		?> L <div class="circle" style="background: #10c5e4;"><?php
					 		break;
					 	case '13':
					 		?> M <div class="circle" style="background: #653b72;"><?php
					 		break;
					 	case '14':
					 		?> N <div class="circle" style="background: #5ad9dc;"><?php
					 		break;
					 	case '15':
					 		?> O <div class="circle" style="background: #36e57e;"><?php
					 		break;
					 	case '16':
					 		?> P <div class="circle" style="background: #e0066e;"><?php
					 		break;
					 	case '17':
					 		?> Q <div class="circle" style="background: #98f949;"><?php
					 		break;
					 	case '18':
					 		?> R <div class="circle" style="background: #cea595;"><?php
					 		break;
					 	default:
					 		?> ZZ <div class="circle" style="background: #ef30b3;"><?php
					 		break;
					 } 
				?>
				</div>
				</th>
				<?php } ?>
				<!--END OF PROBLEM LIST-->
				</tr>
			</thead>

			<tbody>
				<?php
							?>
						<tr class="sortorderswitch" id="team:<?php if(isset($_SESSION['NAME_CODE'])) echo $_SESSION['NAME_CODE']; else echo "666"; ?>">
							<td class="scorepl">?<?php //echo $counter; ?></td>
							<td class="scoreaf"> <img src="../images/IDN.png" alt="IDN" title="IDN" /></td>
							<td class="scoretn">
								<?php if(isset($_SESSION['NAME'])) echo $_SESSION['NAME']; else "NO_NAME"; ?> <br /><span class="univ"><?php if(isset($_SESSION['SCHOOL'])) echo $_SESSION['SCHOOL']; else "UNKNOWN"; ?></span>
							</td>
							<td class="scorenc"><?php echo $totalac; ?></td> <!--Total soal submited -->
							<td class="scorett"><?php echo $totalscore; ?></td>
							<?php for($i=1; $i<=$probSums; $i++){ ?>
							<td class="
							<?php
								switch ($SBdetail[$i]['VERDICT']) {
								 	case '0':
								 		echo 'score_correct';
								 		break;
								 	case '1':
								 		echo 'score_incorrect';
								 		break;
								 	case '2':
								 		echo 'score_incorrect';
								 		break;
								 	default:
								 		echo 'score_neutral';
								 		break;
								 } 
							 ?>">
							 <?php 
							 	if($SBdetail[$i]['VERDICT'] === 0) {
							 		echo $SBdetail[$i]['SUBMIT_COUNT'] . "/" . $SBdetail[1]['SUBMIT_TIME'] ; 
							 	} else {
							 		echo $SBdetail[$i]['SUBMIT_COUNT'];
							 	}
							 }
							 ?>
							 	
							 </td>
						</tr>
							<?php				
				?>
			</tbody>	
		</table>
	</div>

	<div id="submitlist">
		<h3 class="teamoverview">Submissions</h3>

	<script type="text/javascript">
	$(function() {
		var matches = location.hash.match(/submitted=(\d+)/);
		if (matches) {
			var $p = $('<p class="submissiondone" />').html('submission done <a href="#">x</a>');
			$('#submitlist > .teamoverview').after($p);
			$('table.submissions tr[data-submission-id=' + matches[1] + ']').addClass('highlight');

			$('.submissiondone a').on('click', function() {
				$(this).parent().remove();
				$('table.submissions tr.highlight').removeClass('highlight');
				reloadLocation = 'index.php';
			});
		}
	});
	</script>
	<form style="display:inline;" action="upload.php" method="post" enctype="multipart/form-data" onreset="resetUploadForm(30, 100);">
	<p id="submitform">
	<input type="hidden" name="nc" value="<?php echo $hidvalform; ?>">
	<input type="hidden" name="us" value="<?php echo $ussr; ?>">
	<input type="file" name="maincode" id="maincode" required multiple />
	<select name="probid" id="probid">
	<option value="1">A</option>
	<option value="2">B</option>
	<option value="3">C</option>
	<option value="4">D</option>
	<option value="5">E</option>
	<option value="6">F</option>
	<option value="8">G</option>
	<option value="9">H</option>
	<option value="11">I</option>
	<option value="12">J</option>
	<option value="" selected="selected">problem</option>
	</select>
	<select name="langid" id="langid">
	<option value="sql">SQL</option>
	<option value="" selected="selected">file format</option>
	</select>
	<input type="submit" name="submit" id="submit" value="submit"  onclick="return checkUploadForm();" />
	<input type="reset" value="cancel"  />
	<br /><span id="auxfiles"></span>
	<input type="button" name="addfile" id="addfile" value="Add another file" onclick="addFileUpload();" disabled="false"/>
	<script type="text/javascript">initFileUploads(100);</script>

	</p>
	</form>

	<table class="list sortable submissions">
<thead>
<tr><th scope="col">time</th><th scope="col">problem</th><th scope="col">file</th><th scope="col">result</th></tr>
</thead>
<tbody>
<?php
	if(!$kosong){

	$counter = 1;
	foreach ($submitlist as $row) {
		
?>
	<tr class="<?php if($counter %2 == 0) echo "roweven "; else echo "rowodd "?>unseen" data-team-id="<?php echo $row['NAME_CODE'];?>" data-problem-id="<?php echo $row['PROB_NUM'];?>" data-language-id="sql" data-submission-id="<?php echo $row['SUB_ID'];?>">
		<td>
			<a>
			<?php
				$tot = $row['SUBMIT_TIME'];
				$sec = $tot % 60;
				$min = ($tot - $sec) / 60;
				echo sprintf("%02d:%02d", $min,$sec);
			?>
			</a>
		</td>
		<td class="probid" title="<?php echo $row['SOLUTION_QUERY'];?>"><a><?php echo $row['PROB_NUM'];?></a></td>
		<td class="langid" title="SQL"><a>SQL</a></td>
		<td class="result">
		<a><span class="sol 
		<?php
			switch ($row['STATUS']) {
				case '0':
					echo 'sol_correct">correct';
					break;
				case '1':
					echo 'sol_incorrect">wrong-answer';
					break;
				case '2':
					echo 'sol_incorrect">syntax-error';
					break;
				case '666':
					echo 'sol_queued">too-late';
					break; 
				default:
					echo 'sol_queued">pending...';
					break;
			}
		?>
		</span></a></td>
	</tr>
<?php
	$counter++;
		}
	}
?>
</tbody>
</table>



	</div>
</body>
</html>