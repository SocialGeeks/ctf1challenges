<?php
$key = "af4eed06aa4f49e8d3f2aec74ee8d95a";

// Is truthiness even a word?
if (0 == strcasecmp($key, $_GET['key'])) {
	echo "The flag is : " . $key;
}
else {
	echo "Try again";
}
?>

<p><a href="checkkeys.phps">View Source</a></p>

