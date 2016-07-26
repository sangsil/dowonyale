<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>DOWON</title>
<link type="text/css" href="/css/jquery-ui-1.8.20.custom.css" rel="stylesheet"/>
<link type="text/css" href="/css/basic.css" rel="stylesheet"/>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	$("#sign").button();
	$("#id").focus();

	$("#sign").click(function(){
		fnLogin();
	});

	$("#pw").keyup(function(e){
		if (e.keyCode == 13) {
			fnLogin();
		}
	});
	
	fnLogin = function(){
		$("#signin").ajaxForm({
			url : "/user/login.dowon",
			type : "post",
			dataType: "text",
			success: function(result) {
				if(result == "N")
				{
					alert("아이디 또는 패스워드를 확인 해 주십시오.");
					return false;
				}
				else location.href = "/user/main.dowon";
			},
			error: function(result) {				
				alert("로그인 오류입니다. 관리자에게 문의하세요.");
			}
		});
	};
});

function roundTable(objID) {
    var $obj = $("table#" + objID);
    var s, r;
    var y, x, MAX;
    var w, h;
 
    r = parseInt($obj.attr('radius'));
    if (r == null || r < 1) r = 1;
    else if (r > 6) r = 6;
 
    MAX = r * 2 + 1;
 
    $obj.before("<TABLE id='tmpRoundTbl'></TABLE>")
    $("table#tmpRoundTbl")
        .attr("cellSpacing", 0)
        .attr("cellPadding", 0)
        .append("<TBODY></TBODY>");
 
    for (y=0; y < MAX; y++) {
        $("table#tmpRoundTbl TBODY").append("<TR></TR");
        s = Math.abs(y - parseInt(r));
        for (x=0; x < MAX; x++) {
             
            $("table#tmpRoundTbl TBODY TR:eq("+y+")")
                .append("<TD></TD>");
 
            w = '1px'; h = '1px';
            if (x == 0 || x == MAX - 1) h = null;
            else if (y == 0 || y == MAX - 1) w = null;
            else if (r > 2) {
                if (Math.abs(x - r) == 1) w = '2px';
                if (Math.abs(y - r) == 1) h = '2px';
            }
 
            if (w != null)
                $("table#tmpRoundTbl TBODY TR:eq("+y+") TD:eq("+x+")")
                    .css("width", w);
            if (h != null)
                $("table#tmpRoundTbl TBODY TR:eq("+y+") TD:eq("+x+")")
                    .css("height", h);
 
            if (s == x || s == MAX - x - 1)
                $("table#tmpRoundTbl TBODY TR:eq("+y+") TD:eq("+x+")")
                    .css("backgroundColor", $obj.attr('rborder') );
            else if (x > s && s < MAX - x - 1)
                $("table#tmpRoundTbl TBODY TR:eq("+y+") TD:eq("+x+")")
                    .css("backgroundColor", $obj.attr('rbgcolor') );
        }
    }
 
    $("table#tmpRoundTbl TBODY TR:eq("+s+") TD:eq("+r+")").append( $obj );
}
</script>
</head>
<body>
<form id="signin">
<div style="position: absolute; top:50%; left:50%; margin: -180px 0 0 -230px; width:450px;">
<table width="100%" align="center" border="0">
<tr>
	<td align="center">
	<img src="/images/page_logo.png"/>
	</td>
</tr>
<tr>
	<td height="150" align="center">
		<table id="ta" cellpadding="0" cellspacing="10" border="0" radius="4" rborder="#999999" rbgcolor="#FFFFFF">
		<tr>
			<td align="right">ID </td>
			<td><input type="text" name="user_id" id="id" class="text ui-widget-content ui-corner-all" style="width: 15em" tabindex="1"/></td>
			<td rowspan="2"><input type="submit" value="Sign in" name="sign"  id="sign" style="width: 100px;height: 70px; font-size: 17px"/></td>
		</tr>
		<tr>
			<td align="right">PASSWORD </td>
			<td><input type="password" name="user_pw" id="pw" class="text ui-widget-content ui-corner-all" style="width: 15em" tabindex="2"/></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td align="center">DOWON</td>
</tr>
</table>
</div>
<span><script>roundTable("ta");</script></span>
</form>
</body>
</html>