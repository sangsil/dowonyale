<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>

    <!-- con2 -->
    <div class="con2">
      <div class="con2_1">
      	<div class="tot_cnt">총 200건</div>
       	<div class="sort_cnt">
            <select id="order_cnt" class="select1203">
                <option value="">정렬갯수</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="100">100</option>
           </select>       
        </div>
      </div>
      <div class="con2_2">
	        <button id="btn_search" class="btn_search">검색</button>
            <input name="search_value" type="text" class="search_value" id="search_value" size="25" maxlength="30" />
      	<div class="search_type com_fright">
            <select id="search_type" class="select1003">
                <option value="all">전체</option>
                <option value="user_name">이름</option>
                <option value="user_id">아이디</option>
                <option value="email">이메일</option>
            </select>
        </div> 
      </div>    	
    </div>    
   	<!-- //con2 -->