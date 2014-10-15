<?php
require_once("data/db_info.php");
$s=mysql_connect($SERV,$USER,$PASS) or die("失敗しました");
print "<BR>接続OK! <BR><BR>";
mysql_set_charset("utf8");
mysql_select_db($DBNM);

$a1_d=$_POST["a1"];
$a2_d=$_POST["a2"];
mysql_query("INSERT INTO tbkeijiban (name,message) VALUES ('$a1_d','$a2_d')");
$re=mysql_query("SELECT * FROM tbkeijiban ORDER BY number");
while($kekka=mysql_fetch_array($re)){
	print $kekka[0];
	print " : ";
	print $kekka[1];
	print " : ";
	print $kekka[2];
	print "<BR>";
}
mysql_close($s);
print "<BR><A HREF='index.html'>掲示板トップに戻ります</A>";
?>
