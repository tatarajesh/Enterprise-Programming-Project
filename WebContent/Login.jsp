
<html>
<head> <title>Login</title>
<link rel="stylesheet" href="Project1.css">
<script>
function fun0()
{
var status=document.getElementById("1");
var s=document.getElementById("pw").value;
if(status.checked==true)
{
document.getElementById("2").innerHTML=s;
}
else
{
document.getElementById("2").innerHTML="";
}
}

function validate()
{
var un=document.getElementById("un");
var pw=document.getElementById("pw");
if(un.value=="")
{
document.getElementById("3").innerHTML="ERROR : Email is mandatory";
return false;
}
else { document.getElementById("3").innerHTML=""; }

if(pw.value=="") 
{ 
document.getElementById("3").innerHTML="ERROR : Password is required"; 
return false; 
}
else { document.getElementById("3").innerHTML=""; }
}
</script>

<style>
table,tr,td
	{
	background-color:skyblue;
	}
	
	table{ 
	padding:2%;
	border:5px ridge black;
	}
</style>
</head>

<body bgcolor="yellow">

<br>
<h1 style="text-align:center; color:Blue;"><i>Login as <b>Page</b></i> </h1>
<center>
<table onsubmit="return validate()">
<form action="Leader.jsp" method="post">
<tr>
<td>Email:</td>
<td><input type="text"  id="un" name="uname"> <br><br> </td>
</tr>

<tr>
<td>Password</td>
<td><input type="password" onkeyup="fun0()" id="pw" name="pw">  </td>
</tr>

<tr>
<td> <input type="checkbox" id="1" onclick="fun0()">show Password <br><br> </td> 
<td><p id="2" Style="background-color:white;"> </p> </td>
</tr>


<tr>
<td colspan=2 align="center"><input type="submit" class="login" value="LOGIN" ></td> 
</tr>
</center>
<tr>
<td colspan="2"><span id="3" style="color:red;"> </span> </td>
</tr>
</form>
</table> 

</body>

</html>