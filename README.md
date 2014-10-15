SayakaSawadaApp
===============
insert_message.php
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

search_message.php
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

show_message.php
<?php
require_once("data/db_info.php");
$s=mysql_connect($SERV,$USER,$PASS) or die("失敗しました");
print "<BR>接続OK! <BR><BR>";
mysql_set_charset("utf8");
mysql_select_db($DBNM);
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

index.html
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>徳島けいじばん</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="stylesheet" href="sample.css">
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
</head>

<body>

<BR><form method="post" action="show_message.php">
書き込み見るで？<BR>
<INPUT TYPE="submit" VALUE="書き込みを見る"><BR><BR>
</form>

<form method="post" action="insert_message.php">
ニックネーム<BR>
<INPUT TYPE="text" NAME="a1"><BR>
徳島について語り合いましょう♪<BR>
<TEXTAREA NAME="a2" ROWS="10" COLS="30"></TEXTAREA>
<BR><INPUT TYPE="submit" VALUE="送信する">
</form>

<form method="post" action="search_text.php">
<BR>検索したいワードを入れてね♪<br><input type="text" name="c1"><br>
<input type="submit" value="検索">
</form>

</body>
</html>
