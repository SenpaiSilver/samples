<?php
	$to = "@gmail.com";
	$sub = "Hello World !";
	$msg = "Hello World\nWhy so serious.\nWhat's up ?\n".time();

	$head = "From: No Reply <noreply@senpaisilver.com>";
	//$head = "From: No Reply <noreply@senpaisilver.com>";
	$head .= "\nReply-To: noreply@senpaisilver.com";
	$head .= "\nMIME-Version: 1.0";
	$head .= "\nContent-Type: text/plain; charset=iso-8859-1";
	$head .= "\nX-Mailer: PHP/" .phpversion();

	if (mail($to, $sub, $msg, $head))
		echo("OK\n");
	else
		echo("KO\n");
?>

