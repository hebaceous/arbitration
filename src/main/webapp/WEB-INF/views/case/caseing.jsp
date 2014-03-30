<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="now" value="<%=new Date() %>"/>

<div class="pageContent">

	<div>
	<table class="list" width="100%" targetType="navTab">
		<thead>
			<tr>
				<th width="110" style="text-align: center;">案件号</th>
				<th style="text-align: center;">案由</th>
				<th width="52" style="text-align: center;">仲裁秘书</th>
				<th width="110" style="text-align: center;">时间</th>
				<th width="150" style="text-align: center;">当前状态</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty cases }">
				<tr>
					<td colspan="5" style="text-align: center;color: red;">没有相关数据！</td>
				</tr>
			</c:if>
			<c:forEach var="c" items="${cases }">
			<tr mark_update="${c.id }" status="${c.status }">
				<td><a target="navTab" title='${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号' href="${pageContext.request.contextPath }/case/${c.id }">${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号</a></td>
				<td>${c.cause }</td>
				<td><c:if test="${c.status <= 4 }">未指定</c:if><c:if test="${c.status > 4 }">${c.user.name }</c:if></td>
				<td>
					<!-- 简易 -->
					<c:if test="${c.type == 0 }">
						<c:if test="${c.status>=4 && c.status<=12 }"><span class="day_thing">组庭</span>还剩<span class="day"><fmt:formatNumber value="${9-((now.time-c.registerDate.time)-(now.time-c.registerDate.time)%86400000)/86400000 }" pattern="#"/></span>天<br/></c:if>
						<c:if test="${c.status>=14 && c.status<=15 }"><span class="day_thing">开庭</span>还剩<span class="day"><fmt:formatNumber value="${6-((now.time-c.formationDate.time)-(now.time-c.formationDate.time)%86400000)/86400000 }" pattern="#"/></span>天<br/></c:if>
						<c:if test="${c.status>=16 && c.status<=24 }"><span class="day_thing">结案</span>还剩<span class="day"><fmt:formatNumber value="${59-((now.time-c.formationDate.time)-(now.time-c.formationDate.time)%86400000)/86400000 }" pattern="#"/></span>天<br/></c:if>
					</c:if>
					<!-- 普通 -->
					<c:if test="${c.type == 1 }">
						<c:if test="${c.status>=4 && c.status<=12 }"><span class="day_thing">组庭</span>还剩<span class="day"><fmt:formatNumber value="${14-((now.time-c.registerDate.time)-(now.time-c.registerDate.time)%86400000)/86400000 }" pattern="#"/></span>天<br/></c:if>
						<c:if test="${c.status>=14 && c.status<=15 }"><span class="day_thing">开庭</span>还剩<span class="day"><fmt:formatNumber value="${6-((now.time-c.formationDate.time)-(now.time-c.formationDate.time)%86400000)/86400000 }" pattern="#"/></span>天<br/></c:if>
						<c:if test="${c.status>=16 && c.status<=24 }"><span class="day_thing">结案</span>还剩<span class="day"><fmt:formatNumber value="${119-((now.time-c.formationDate.time)-(now.time-c.formationDate.time)%86400000)/86400000 }" pattern="#"/></span>天<br/></c:if>
					</c:if>
				</td>
				<td>
					<c:choose>
						<c:when test="${c.status == 1 }">审批仲裁申请（立案科长）</c:when>
						<c:when test="${c.status == 2 }">审批仲裁申请（副主任）</c:when>
						<c:when test="${c.status == 3 }">审批仲裁申请（中心主任）</c:when>
						<c:when test="${c.status == 4 }">联络科长指定秘书</c:when>
						<c:when test="${c.status == 5 }">送达回证中--立案后（${c.user.name }）</c:when>
						<c:when test="${c.status == 6 }">处理回证和文书--立案后</c:when>
						<c:when test="${c.status == 9 }">选定仲裁员（${c.user.name }）</c:when>
						<c:when test="${c.status == 10 }">审批仲裁员选定表（副主任）</c:when>
						<c:when test="${c.status == 11 }">审批仲裁员选定表（中心主任）</c:when>
						<c:when test="${c.status == 12 }">审批仲裁员选定表（仲裁委主任）</c:when>
						<c:when test="${c.status == 14 }">送达回证--组庭后（${c.user.name }）</c:when>
						<c:when test="${c.status == 15 }">等待收到回证--组庭后（${c.user.name }）</c:when>
						<c:when test="${c.status == 16 }">上传开庭笔录（${c.user.name }）</c:when>
						<c:when test="${c.status == 17 }">下达裁决书（${c.user.name }）</c:when>
						<c:when test="${c.status == 18 }">审批裁决书（副主任）</c:when>
						<c:when test="${c.status == 19 }">审批裁决书（中心主任）</c:when>
						<c:when test="${c.status == 20 }">审批裁决书（仲裁委主任）</c:when>
						<c:when test="${c.status == 21 }">送达回证--裁决书后（${c.user.name }）</c:when>
						<c:when test="${c.status == 22 }">等待收到回证--裁决书后（${c.user.name }）</c:when>
						<c:when test="${c.status == 23 }">案件归档</c:when>
						<c:when test="${c.status == 24 }">已结案</c:when>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>

<div style="height: 35px;"></div>
