<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="pageContent">
	<form method="post" action="${pageContext.request.contextPath }/case/cost/${c.id }" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>案件号：</label>
				${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号
			</p>
			<p>
				<label>仲裁费：</label>
				${c.arbitrationCharges }
			</p>
			<p>
				<label>欠费金额：</label>
				${c.debtCharges }
			</p>
			<p>
				<label>已付费用：</label>
				<input name="paidCharges" value="${c.paidCharges }" min="${c.paidCharges }" max="${c.arbitrationCharges }" type="text" class="digits textInput">
			</p>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>