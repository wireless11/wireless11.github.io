<%-- index.jsp by J-H Ahn 2018 --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>소민과 고양이</title>
<style type="text/css">
    a {text-decoration: none}
    a:hover {text-decoration: underline}
    td {font-family: 조선일보명조; font-weight: bold; font-size: 15px; text-align: center}
</style>

<script>
function calculate(form)
{
  var x = eval(form.x.value);
  var y = eval(form.y.value);
  var z = x + y;
  form.result.value = z;
}

function go_1()
{
  var k = document.go.loc.selectedIndex;
  var url = document.go.loc.options[k].value;
  location.assign(url);
//  document.location.href = url;

}


function go_2()
{
  var n = document.go2.target.length;
  for(i=0;i<n;i++){
    if(document.go2.target[i].checked){
      val uri = document.go2.target[i].value;
      document.go2.action = uri;
      document.go2.submit();
      break;
    }
  }

}



</script>

</head>
<body bgcolor=#ECEBFF>

<script>document.write("<font size=1>정보응용실험 예제</font>");</script>

<br>
<div align=center><h2>☆★소민과 고양이^_^☆★</h2></div>

<table width=100%>
  <tr>
    <td align=left><%@ include file="date.jsp" %></td>
    <td align=right><%@ include file="login.jsp" %></td>
  </tr>
</table>

<a href="write1.html">게시판1</a>
<a href="write2.html">게시판2</a>
<a href="write3.html">게시판3</a>

<input type="button" value="버튼" onClick="location.href='http://www.daum.net'"> 


<hr>

<form name="form1">
 <select name="loc" onchange="window.open(value,'_self');">
   <option value="profile.html" >프로필 </option>
   <option value="board.jsp"  >게시판 </option>
   <option value="pict.html" >사진 </option>
   <option alue="index.jsp" selected> 홈페이지 </option>
   <option value="http://image.cbnu.ac.kr">링크 </option>
  </select>
</form>

&nbsp;



<hr>
<table>
 <tr>
  <td>
    <img src = "뿌밍.jpg" width=300>

	<br><br> 뿌밍이?뿌꾸? <br><br>
  </td>
  <td width =100>
  </td>

  <td>
    <img src = "뿌꾸.jpg" width=250>

	<br><br> 뿌밍이?뿌꾸? <br><br>
  </td>
  <td width =100>

  <td>
    <img src = "다온이.jpg" width=250>

	<br><br> 화가난다온이 <br><br>
  </td>
   <td width =100>
</tr>

  <tr>
  <td>
    <img src = "솔이.jpg" width=250>

	<br><br> 솔이?별이? <br><br>
  </td>
   <td width =100>

  <td>
    <img src = "별이.jpg" width=250>

	<br><br> 별이?솔이? <br><br>
  </td>
   <td width =100>


  <td> <font size=20>귀여운 고양이들 ⊙▽⊙  <br> <br>
<table width=200 border=0 cellspacing=0 cellpadding=10>

<tr><td align=center>
  <font size=+3><b>고</b></font> 양이는 귀엽다<br>
  <font size=+3><b>양</b></font> 도 귀엽다<br>
  <font size=+3><b>이</b></font>  세상은 귀여운거 천지!
</td></tr>
</table>
</td>

  </tr>
</table>






<hr>

<form name=calculator>
  <input type=text name=x size=4> +
  <input type=text name=y size=4> = 
  <input type=button value="  =  "  
onClick="calculate(this.form)">
  <input type=text name= result size=4>

</form>




<input type=button value="뒤로 가기" 
onClick="history.back()">


<input type=button value="창 닫기" 
onClick="window.close()">



</body>
</html>
