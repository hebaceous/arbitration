<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="panelBar">
	<ul class="toolBar">
		<li class="line">line</li>
		<li><a class="icon" href="javascript:$.printBox('print_arbitrator')"><span>打印</span></a></li>
		<li class="line">line</li>
	</ul>
</div>

<div layoutH="60" id="print_arbitrator">
	<table class="print_arbitrator">
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
			<th class="th3"></th>
			<th class="th4"></th>
		</tr>
		<tr class="title"><td colspan="5">仲裁员选定、指定审批表</td></tr>
		<tr class="number">
			<td colspan="4">
				案号：${fn:split(c.id,"-")[0] }安仲案字${fn:split(c.id,"-")[1] }号
				程序：<c:forEach var="procedure" items="${caseProcedures }">
						<c:if test="${procedure == caseProcedures[c.applicableProcedure] }">${procedure }</c:if>
					</c:forEach>&nbsp;&nbsp;&nbsp;&nbsp;
				仲裁秘书：${arbitrator.secretary }&nbsp;&nbsp;&nbsp;&nbsp;
				<fmt:formatDate value="${arbitrator.date }" pattern="yyyy年MM月dd日"/>
			</td>
		</tr>
		<tr>
			<td>案件</td>
			<td colspan="3">${c.cause }</td>
		</tr>

		<tr>
			<td rowspan="4">申请人选定情况</td>
			<td></td>
			<td>仲裁员姓名</td>
			<td>专业</td>
		</tr>
		<tr>
			<td>首席仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[0] }
			<td>${fn:split(arbitrator.contents, ',')[1] }
		</tr>
		<tr>
			<td>仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[2] }
			<td>${fn:split(arbitrator.contents, ',')[3] }
		</tr>
		<tr>
			<td>独任仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[4] }
			<td>${fn:split(arbitrator.contents, ',')[5] }
		</tr>

		<tr>
			<td rowspan="4">被申请人选定情况</td>
			<td></td>
			<td>仲裁员姓名</td>
			<td>专业</td>
		</tr>
		<tr>
			<td>首席仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[6] }
			<td>${fn:split(arbitrator.contents, ',')[7] }
		</tr>
		<tr>
			<td>仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[8] }
			<td>${fn:split(arbitrator.contents, ',')[9] }
		</tr>
		<tr>
			<td>独任仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[10] }
			<td>${fn:split(arbitrator.contents, ',')[11] }
		</tr>
		<tr>
			<td rowspan="5">仲裁委指定情况</td>
			<td></td>
			<td>仲裁员姓名</td>
			<td>专业</td>
		</tr>
		<tr>
			<td>首席仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[12] }
			<td>${fn:split(arbitrator.contents, ',')[13] }
		</tr>
		<tr>
			<td>仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[14] }
			<td>${fn:split(arbitrator.contents, ',')[15] }
		</tr>
		<tr>
			<td>仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[16] }
			<td>${fn:split(arbitrator.contents, ',')[17] }
		</tr>
		<tr>
			<td>独任仲裁员</td>
			<td>${fn:split(arbitrator.contents, ',')[18] }
			<td>${fn:split(arbitrator.contents, ',')[19] }
		</tr>
		<tr>
			<td>部门意见</td>
			<td colspan="3">
			${fn:split(arbitrator.departmentOpinion,",")[0] }
			<p style="text-align: right;">${fn:split(arbitrator.departmentOpinion,",")[1] }
			<p style="text-align: right;">${fn:split(arbitrator.departmentOpinion,",")[2] }
			</td>
		</tr>
		<tr>
			<td>中心主任审批</td>
			<td colspan="3">
			${fn:split(arbitrator.centerDirectorOpinion,",")[0] }
			<p style="text-align: right;">${fn:split(arbitrator.centerDirectorOpinion,",")[1] }
			<p style="text-align: right;">${fn:split(arbitrator.centerDirectorOpinion,",")[2] }
			</td>
		</tr>
		<tr>
			<td>仲裁委主任审批</td>
			<td colspan="3">
			${fn:split(arbitrator.directorOpinion,",")[0] }
			<p style="text-align: right;">${fn:split(arbitrator.directorOpinion,",")[1] }
			<p style="text-align: right;">${fn:split(arbitrator.directorOpinion,",")[2] }
			</td>
		</tr>
	</table>
</div>