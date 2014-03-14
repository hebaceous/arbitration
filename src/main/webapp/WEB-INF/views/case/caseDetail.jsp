<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="pageContent">
	<div class="pageFormContent" layoutH="10">
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
		<c:forEach var="applicant" items="${respondents }" varStatus="status">
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
				<c:if test="${applicant.type > 0 }">
					<c:if test="${applicant.type == 1 }">
						<dl>
							<dt>单位名称：</dt>
							<dd>${applicant.organization }</dd>
						</dl>
					</c:if>
					<c:if test="${applicant.type == 2 }">
						<dl>
							<dt>组织名称：</dt>
							<dd>${applicant.organization }</dd>
						</dl>
					</c:if>
					<dl>
						<dt>职务：</dt>
						<dd>${applicant.post }</dd>
					</dl>
				</c:if>
				<div class="divider"></div>
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
		<fieldset>
			<legend>案件信息</legend>
			<dl>
				<dt>案件号：</dt>
				<dd>${fn:split(c.id,"-")[0] }安仲裁字${fn:split(c.id,"-")[1] }号</dd>
			</dl>
			<dl>
				<dt>仲裁协议：</dt>
				<dd>
					<c:if test="${empty c.agreement }">已有</c:if>
					<c:if test="${not empty c.agreement }">（联系人）:${c.agreement }</c:if>
				</dd>
			</dl>
			<dl>
				<dt>案件类型：</dt>
				<dd>
					<c:forEach var="type" items="${caseTypes }">
						<c:if test="${type == caseTypes[c.type] }">${type }</c:if>
					</c:forEach>
				</dd>
			</dl>
			<dl>
				<dt>案由：</dt>
				<dd>${c.cause }</dd>
			</dl>
			<dl>
				<dt>仲裁申请日期：</dt>
				<dd>
					<fmt:formatDate value="${c.date }" type="date" />
				</dd>
			</dl>
			<dl class="nowrap">
				<dt>仲裁请求事项：</dt>
				<dd>
					<textarea cols="80" rows="5" disabled="disabled">${c.request }</textarea>
				</dd>
			</dl>
			<div class="divider"></div>
			<dl>
				<dt>争议金额：</dt>
				<dd>${c.money }</dd>
			</dl>
			<dl>
				<dt>适用程序：</dt>
				<dd>
					<c:forEach var="procedure" items="${caseProcedures }">
						<c:if test="${procedure == caseProcedures[c.applicableProcedure] }">${procedure }</c:if>
					</c:forEach>
				</dd>
			</dl>
			<dl>
				<dt>受理费：</dt>
				<dd>${c.acceptCharges }</dd>
			</dl>
			<dl>
				<dt>处理费：</dt>
				<dd>${c.handlingCharges }</dd>
			</dl>
			<dl>
				<dt>仲裁费合计：</dt>
				<dd>${c.arbitrationCharges }</dd>
			</dl>
			<dl>
				<dt>实收仲裁费：</dt>
				<dd>${c.paidCharges }</dd>
			</dl>
			<dl>
				<dt>欠费：</dt>
				<dd>${c.debtCharges }</dd>
			</dl>
			<dl>
				<dt>是否减免：</dt>
				<dd>${c.isRelief?'是':'否' }"</dd>
			</dl>
		</fieldset>
	</div>
</div>