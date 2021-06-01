<?php
define('DBSERVER', 'locahost'); //Database server
define('DBUSERNAME', 'root'); //Database username
define('DBPASSWORD', ''); //Database PASS
define('DBNAME', 'demo'); // Database name

/*connection to sql Database*/
$db = mysqli_connect(DBSERVER, DBUSERNAME, DBPASSWORD, DBNAME);

//CHECK CONNECTION

if($db === false){
    die("Error: connection error. " . mysqli_connect_error());
}
?>