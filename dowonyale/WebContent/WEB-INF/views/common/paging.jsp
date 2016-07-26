<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<script type="text/javascript">
<!--
$(function(){
	/*	페이징	*/
	$(paging($("#totalPages").val(),$("#cPage").val()));

	$("#first").live("click",(function(){
		$("#startNum").val("0");
		$("#cPage").val("1");
		$("form[name=frm]").attr("action","${default_url}");
		$("form[name=frm]").submit();
	}));

	$("#pre").live("click",(function(){
		var cPage = $("#cPage").val();
		var maxRows = $("#maxRows").val();
		var startNum = $("#startNum").val();
		var intGrp = Math.floor((cPage-1)/10);
		$("#startNum").val((intGrp-1)*10*maxRows);
		$("#cPage").val((intGrp-1)*10+1);
		$("form[name=frm]").attr("action","${default_url}");
		$("form[name=frm]").submit();
	}));

	$("#next").live("click",(function(){
		var cPage = $("#cPage").val();
		var maxRows = $("#maxRows").val();
		var startNum = $("#startNum").val();
		var intGrp = Math.floor((cPage-1)/10+1);
		$("#startNum").val((intGrp*10+1)*maxRows);
		$("#cPage").val(intGrp*10+1);
		$("form[name=frm]").attr("action","${default_url}");
		$("form[name=frm]").submit();
	}));

	$("#last").live("click",(function(){
		var maxRows = $("#maxRows").val();
		$("#startNum").val(Math.floor($("#totalPages").val()-1)*maxRows);
		$("#cPage").val(Math.floor($("#totalPages").val()));
		$("form[name=frm]").attr("action","${default_url}");
		$("form[name=frm]").submit();
	}));
	/*	페이징	*/
});

function paging(totalPages,cPage){
	var arr = [];
	var pre = "";
	var next = "";
	var cGrp = Math.floor((cPage-1)/10)+1;
	var startPage = cGrp*10-9;
	var endPage = startPage+9;
	if(endPage > totalPages) endPage = totalPages;
	//alert(cPage);
	for(var i=startPage; i<=endPage; i++)
	{
		if(cPage == i) arr[i] = "&nbsp;&nbsp;<b>" + i + "</b>&nbsp;&nbsp;";
		else arr[i] = "&nbsp;<a href='javascript:gopage(" + i + ")' style='text-decoration:none;border:0px;'>&nbsp;<font color='#6da8d5'>" + i + "</font>&nbsp;</a>&nbsp;";
	}
	
	pre += "<table style='border:0px'><tr style='border:0px'>";
	pre += "<td style='border:0px'><button id='first' style='width: 26px; height: 16px'>처음</button>";
	if(totalPages >= 11)
	{
		if(cPage > 10) pre += "<button id='pre' style='width: 26px; height: 16px'>이전</button>";
		if(Math.floor((cPage-1)/10) < Math.floor(totalPages/10)) next += "<button id='next' style='width: 26px; height: 16px'>다음</button>";
	}
	next += "<button id='last' style='width: 26px; height: 16px'>마지막</button>";
	next += "</tr></table>";

	$("#paging").append(pre + "" + arr.join("") + "" + next);

	$("#first").button({
		icons: {
        primary: "ui-icon-arrowstop-1-w"
    	},
    	text: false
	});
	$("#pre").button({
		icons: {
        primary: "ui-icon-arrow-1-w"
    	},
    	text: false
	});
	$("#next").button({
		icons: {
        primary: "ui-icon-arrow-1-e"
    	},
    	text: false
	});
	$("#last").button({
		icons: {
        primary: "ui-icon-arrowstop-1-e"
    	},
    	text: false
	});
}
function gopage(cPage)
{
	$("#startNum").val((cPage-1)*$("#maxRows").val());
	$("form[name=frm]").attr("action","${default_url}");
	$("form[name=frm]").submit();
}	



//-->
</script>
<div class="con4">
  <div id="paging" class="paging" align="center"></div>    	
</div>  