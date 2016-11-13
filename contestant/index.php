<?php
	session_start();
	define('BASE', 'BASE');
	require_once '../utility/config.php';
	require_once '../utility/connection.php';
	require_once '../utility/utility.php';
	require_once '../model/submits.php';
	$hidvalform = $_SESSION['NAME_CODE'];
	$DBSUBS = new DB_SUBMIT();
	$submitlist = $DBSUBS->getSubmission($hidvalform);
	$kosong = true;
	if(isset($submitlist)){
		$kosong = false;
	}
	$starttime = "1478982205.000000000"; // select from db later
	$endtime = "1478992205.000000000"; // select from db later
	$timernow = strtotime("now");
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../css/style.css">
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
					<th title="Problem 1" scope="col">
						A <div class="circle" style="background: #ff0000;"></div>
					</th>
					<th title="Problem 2" scope="col">
						B <div class="circle" style="background: #00ff00;"></div>
					</th>
					<th title="problem 'Stress Factor'" scope="col">
						C <div class="circle" style="background: #0000ff;"></div>
					</th>
					<th title="problem 'Pay Day'" scope="col">
						D <div class="circle" style="background: #ffff00;"></div>
					</th>
					<th title="problem 'Guessing Game'" scope="col">
						E <div class="circle" style="background: #ff00ff;"></div>
					</th>
					<th title="problem 'The Cure'" scope="col">
						F <div class="circle" style="background: #00ffff;"></div>
					</th>
					<th title="problem 'All Are Equal'" scope="col">
						G <div class="circle" style="background: #ff9000;"></div>
					</th>
					<th title="problem 'National Disaster II'" scope="col">
						H <div class="circle" style="background: #ff0090;"></div>
					</th>
					<th title="problem 'Peculiar Microwave'" scope="col">
						I <div class="circle" style="background: #00ff90;"></div>
					</th>
					<th title="problem 'Super Sum'" scope="col">
						J <div class="circle" style="background: #ff3000;"></div>
					</th>
					<th title="problem '2-ME Set'" scope="col">
						K <div class="circle" style="background: #ff0030;"></div>
					</th>
					<th title="problem 'Tale of A Happy Man'" scope="col">
						L <div class="circle" style="background: #00ff30;"></div>
					</th>
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
							<td class="scorenc">12</td> <!--Total soal submited -->
							<td class="scorett"><?php //echo $scl['score']?>100</td>
							<td class="score_correct">3/29</td>
							<td class="score_correct">9/191</td>
							<td class="score_correct">3/111</td>
							<td class="score_correct">1/39</td>
							<td class="score_correct">1/50</td>
							<td class="score_correct">2/275</td>
							<td class="score_correct score_first">1/156</td>
							<td class="score_correct score_first">3/227</td>
							<td class="score_neutral">0</td>
							<td class="score_neutral">0</td>
							<td class="score_correct score_first">2/71</td>
							<td class="score_neutral">0</td>
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