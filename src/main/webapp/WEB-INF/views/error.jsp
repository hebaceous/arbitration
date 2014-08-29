<%@ page language="java" pageEncoding="UTF-8"%>
<%
	response.getOutputStream().write("{\"statusCode\":\"300\", \"message\":\"系统出错，请联系管理员。\"}".getBytes());
%>