<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="pageFormContent" layoutH="56">
	<c:forEach var="applicant" items="${applicants }" varStatus="status">
		<fieldset>
			<c:if test="${applicant.isApplicant }">
				<legend>申请人${status.index+1 }：</legend>
			</c:if>
			<c:if test="${!applicant.isApplicant }">
				<legend>被申请人${status.index+1 }：</legend>
			</c:if>
			<dl>
				<dt>类型：</dt>
				<dd>
					<c:forEach var="type" items="${applicantTypes }">
						<c:if test="${applicantTypes[applicant.type] == type }">${type }</c:if>
					</c:forEach>
				</dd>
			</dl>
			<div class="divider"></div>
			<%-- 公民 --%>
			<c:if test="${applicant.type == 0 }">
				<dl>
					<dt>姓名：</dt>
					<dd>${applicant.name }</dd>
				</dl>
				<dl>
					<dt>性别：</dt>
					<dd>${applicant.sex }</dd>
				</dl>
				<dl>
					<dt>身份证号：</dt>
					<dd>${applicant.identityCard }</dd>
				</dl>
				<dl>
					<dt>联系方式：</dt>
					<dd>${applicant.phone }</dd>
				</dl>
				<dl>
					<dt>地址：</dt>
					<dd>${applicant.address }</dd>
				</dl>
			</c:if>
			<%-- 法人 --%>
			<c:if test="${applicant.type == 1 }">
				<dl>
					<dt>单位名称：</dt>
					<dd>${applicant.organization }</dd>
				</dl>
				<dl>
					<dt>法定代表人：</dt>
					<dd>${applicant.name }</dd>
				</dl>
				<dl>
					<dt>职务：</dt>
					<dd>${applicant.post }</dd>
				</dl>
				<dl>
					<dt>联系方式：</dt>
					<dd>${applicant.phone }</dd>
				</dl>
				<dl>
					<dt>住所地：</dt>
					<dd>${applicant.address }</dd>
				</dl>
			</c:if>
			<%-- 组织 --%>
			<c:if test="${applicant.type == 1 }">
				<dl>
					<dt>组织名称：</dt>
					<dd>${applicant.organization }</dd>
				</dl>
				<dl>
					<dt>法定代表人：</dt>
					<dd>${applicant.name }</dd>
				</dl>
				<dl>
					<dt>职务：</dt>
					<dd>${applicant.post }</dd>
				</dl>
				<dl>
					<dt>联系方式：</dt>
					<dd>${applicant.phone }</dd>
				</dl>
				<dl>
					<dt>住所地：</dt>
					<dd>${applicant.address }</dd>
				</dl>
			</c:if>
			<div class="divider"></div>
			<dl>
				<dt>主要发言人：</dt>
				<dd>${applicant.proxy_spokesman }</dd>
			</dl>
			<dl>
				<dt>代理人1：</dt>
				<dd>${applicant.proxy_proxy1 }</dd>
			</dl>
			<dl>
				<dt>代理人2：</dt>
				<dd>${applicant.proxy_proxy2 }</dd>
			</dl>
			<dl>
				<dt>单位：</dt>
				<dd>${applicant.proxy_organization }</dd>
			</dl>
			<dl>
				<dt>联系方式：</dt>
				<dd>${applicant.proxy_contact }</dd>
			</dl>
			<dl>
				<dt>代理权限：</dt>
				<dd>${applicant.proxy_power }</dd>
			</dl>
		</fieldset>
	</c:forEach>
</div>