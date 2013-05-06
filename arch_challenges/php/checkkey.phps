<?php
$key = "<CENSORED, did you think it would be that easy?>";

// Is truthiness even a word?
if (0 == strcasecmp($key, $_GET['key'])) {
	echo "The flag is : " . $key;
}
else {
	echo "Try again";
}
?>

<p><a href="checkkey.phps">View Source</a></p>

