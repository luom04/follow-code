<!DOCTYPE HTML>
<html>

<head>
	<meta charset="UTF-8" />
	<title>Notification</title>
	<meta name="robots" content="noindex,nofollow" />
	<link href="assets/coming/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="assets/coming/css/clock.css" rel="stylesheet" type="text/css" media="all" />
	<link href='http://fonts.googleapis.com/css?family=Petit+Formal+Script' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Alegreya+Sans:300,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300' rel='stylesheet' type='text/css'>
	<script src="assets/js/jquery.min.js"></script>


</head>

<body>
	<div class="content">
		<div class="wrap">
			<div class="content-grid">
				<p><img src="assets/coming/images/dayden2.png" title=""></p>
				<div class="wall">
					<h1 class="coming">Coming</h1>
					<div class="soon">Soon</div>
				</div>
				<div class="smoke"></div>
				<div class="smoke smoke2"></div>
				<div class="smoke smoke3"></div>
				<div class="particles"></div>
			</div>
			<div class="grid">
				<h3>We are Still Working on it.</h3>
				<div class="clock">
					<ul>
						<li id="hours"></li>
						<li id="point">:</li>
						<li id="min"></li>
						<li id="point">:</li>
						<li id="sec"></li>
					</ul>
					<div id="Date"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<p style="text-align: center;"><a href="index.php" title="Trial" rel="nofollow" style="color: #fff;  font-size: 18px !important; ">Trial</a></p>
			<a class="logo-hdh " href="index.php"><img src="assets/coming/images/logo_mima.png" title="Trial"></a>

		</div>
	</div>
	<div class="clear"></div>
	<script type="text/javascript">
		$(document).ready(function() {
			// Create two variable with the names of the months and days in an array
			var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
			var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

			// Create a newDate() object
			var newDate = new Date();
			// Extract the current date from Date object
			newDate.setDate(newDate.getDate());
			// Output the day, date, month and year    
			$('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

			setInterval(function() {
				// Create a newDate() object and extract the seconds aof the current time on the visitor's
				var seconds = new Date().getSeconds();
				// Add a leading zero to seconds value
				$("#sec").html((seconds < 10 ? "0" : "") + seconds);
			}, 1000);

			setInterval(function() {
				// Create a newDate() object and extract the minutes of the current time on the visitor's
				var minutes = new Date().getMinutes();
				// Add a leading zero to the minutes value
				$("#min").html((minutes < 10 ? "0" : "") + minutes);
			}, 1000);

			setInterval(function() {
				// Create a newDate() object and extract the hours of the current time on the visitor's
				var hours = new Date().getHours();
				// Add a leading zero to the hours value
				$("#hours").html((hours < 10 ? "0" : "") + hours);
			}, 1000);

		});


		// Bụi sáng
		const particles = document.querySelector('.particles');

		for (let i = 0; i < 80; i++) {

			let s = document.createElement('span');

			s.style.left = Math.random() * 100 + 'vw';
			s.style.top = Math.random() * 100 + 'vh';

			let size = Math.random() * 5 + 2;

			s.style.width = size + 'px';
			s.style.height = size + 'px';

			s.style.animationDuration = (8 + Math.random() * 12) + 's';
			s.style.animationDelay = (-Math.random() * 20) + 's';

			particles.appendChild(s);

		}
	</script>
</body>

</html>


<?php /*
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8" />
	<title>Notification</title>
	<meta name="robots" content="noindex,nofollow" />
	<link href="assets/coming/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="assets/coming/css/clock.css" rel="stylesheet" type="text/css" media="all" />
	<link href='http://fonts.googleapis.com/css?family=Petit+Formal+Script' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Alegreya+Sans:300,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300' rel='stylesheet' type='text/css'>
	<script src="assets/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		// Create two variable with the names of the months and days in an array
		var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
		var dayNames= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

		// Create a newDate() object
		var newDate = new Date();
		// Extract the current date from Date object
		newDate.setDate(newDate.getDate());
		// Output the day, date, month and year    
		$('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

		setInterval( function() {
			// Create a newDate() object and extract the seconds of the current time on the visitor's
			var seconds = new Date().getSeconds();
			// Add a leading zero to seconds value
			$("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
			},1000);
			
		setInterval( function() {
			// Create a newDate() object and extract the minutes of the current time on the visitor's
			var minutes = new Date().getMinutes();
			// Add a leading zero to the minutes value
			$("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
		    },1000);
			
		setInterval( function() {
			// Create a newDate() object and extract the hours of the current time on the visitor's
			var hours = new Date().getHours();
			// Add a leading zero to the hours value
			$("#hours").html(( hours < 10 ? "0" : "" ) + hours);
		    }, 1000);
			
		}); 
	</script>
</head>
<body>
	<div class="content">
		<div class="wrap">
			<div class="content-grid">
				<p><img src="assets/coming/images/top.png" title=""></p>
			</div>
			<div class="grid">
				<p><img src="assets/coming/images/coming.png" title=""></p>
				<h3>We are Still Working on it.</h3>
				<div class="clock">
					<ul>
						<li id="hours"></li>
						<li id="point">:</li>
						<li id="min"></li>
						<li id="point">:</li>
						<li id="sec"></li>
					</ul>
					<div id="Date"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<p style="text-align: center;"><a href="index.php" title="Trial" rel="nofollow" style="color: #fff; ">Trial</a></p>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>
*/?>