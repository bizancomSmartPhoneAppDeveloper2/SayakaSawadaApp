<?php
require_once("data/db_info.php");
$s=mysql_connect($SERV,$USER,$PASS) or die("失敗しました");
print "<BR>接続OK! <BR><BR>";
mysql_set_charset("utf8");
mysql_select_db($DBNM);

$c1_d=$_POST["c1"];

$re=mysql_query("SELECT * FROM tbkeijiban WHERE message LIKE '%$c1_d%' or name LIKE '%$c1_d%'");
while($kekka=mysql_fetch_array($re)){
	print $kekka[0];
	print " : ";
	print $kekka[1];
	print " : ";
	print $kekka[2];
	print "<br>";
}
mysql_close($s);
print "<BR><A HREF='index.html'>掲示板トップに戻ります</A>";
?>
