<?php
session_start();
//����n�J�ʧ@
if(!isset($_SESSION["membername"]) || ($_SESSION["membername"]=="")){
	if(isset($_POST["username"]) && isset($_POST["passwd"])){
		//�w�]�b���K�X
		$username = "admin";
		$passwd = "1234";
		//���b���K�X�A�Y�n�J���\�h�e�{�n�J���A
		if(($_POST["username"]==$username) && ($_POST["passwd"]==$passwd)){
			$_SESSION["membername"]=$username;
		}
		header("Location: php_session2.php");
	}
}
//����n�X�ʧ@
if(isset($_GET["logout"]) && ($_GET["logout"]=="true")){
	unset($_SESSION["membername"]);
	header("Location: php_session2.php");
}
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=big5" />
	<title>�����|���t��</title>
</head>
<body>
<?php 
//�ˬd�O�_���n�J���A�A�Y���n�J�h��ܵn�J���
if(!isset($_SESSION["membername"]) || ($_SESSION["membername"]=="")){
?>		
<form id="form1" name="form1" method="post" action="php_session2.php">
  <table width="300" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
    <tr>
      <td colspan="2" align="center" bgcolor="#CCCCCC"><font color="#FFFFFF">�|���t��</font></td>
    </tr>
    <tr>
      <td width="80" align="center" valign="baseline">�b��</td>
      <td valign="baseline"><input type="text" name="username" id="username" /></td>
    </tr>
    <tr>
      <td width="80" align="center" valign="baseline">�K�X</td>
      <td valign="baseline"><input type="password" name="passwd" id="passwd" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center" bgcolor="#CCCCCC"><input type="submit" name="button" id="button" value="�n�J" />
      <input type="reset" name="button2" id="button2" value="���]" /></td>
    </tr>
  </table>
</form>
<?php 
//�Y�n�J�Y��ܵn�J���\�T��
}else{
?>
<table width="300" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
  <tr>
    <td align="center" bgcolor="#CCCCCC"><font color="#FFFFFF">�|���t��</font></td>
  </tr>
  <tr>
    <td align="center" valign="baseline"><?php echo $_SESSION["membername"];?> �z�n�A�n�J���\�I</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#CCCCCC"><a href="php_session2.php?logout=true">�n�X�t��</a></td>
  </tr>
</table>
<?php }?>
</body>
</html>