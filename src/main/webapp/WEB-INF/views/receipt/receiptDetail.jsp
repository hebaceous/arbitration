<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="panelBar">
	<ul class="toolBar">
		<li class="line">line</li>
		<li><a class="icon" href="javascript:$.printBox('print_receipt')"><span>打印</span></a></li>
		<li class="line">line</li>
	</ul>
</div>

<div layoutH="10" id="print_receipt">
	<table class="print_receipt">
		<tr>
			<th class="th1"></th>
			<th class="th2"></th>
			<th class="th3"></th>
			<th class="th4"></th>
		</tr>
		<tr class="title"><td colspan="4">安阳仲裁委员会送达回证</td></tr>
		<tr>
			<td>案由</td>
			<td>${receipt.cause }</td>
			<td>案号</td>
			<td>${fn:split(receipt.id,"-")[0] }安仲案字${fn:split(receipt.id,"-")[1] }号</td>
		</tr>
		<tr>
			<td>受送达人</td>
			<td colspan="3">${receipt.addressee }</td>
		</tr>
		<tr>
			<td>送达地址</td>
			<td colspan="3">${receipt.address }</td>
		</tr>
		<tr>
			<td>送达方式</td>
			<td colspan="3">${receipt.mode }</td>
		</tr>
		<tr>
			<td>送达文书名称及签收</td>
			<td colspan="2">
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"a")?'checked':'' }/>1、仲裁申请书副本</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"b")?'checked':'' }/>2、反请求申请书副本</label><br/>
				<span><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"c")?'checked':'' }/>3、（ ${fn:split(receipt.contents,",")[0] } ）安裁（ ${fn:split(receipt.contents,",")[1] } ）字第（ ${fn:split(receipt.contents,",")[2] } ）号通知书</span><br/>
				<span><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"d")?'checked':'' }/>4、（ ${fn:split(receipt.contents,",")[3] } ）安裁（ ${fn:split(receipt.contents,",")[4] } ）字第（ ${fn:split(receipt.contents,",")[5] } ）号通知书</span><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"e")?'checked':'' }/>5、《安阳仲裁委员会仲裁规则》</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"f")?'checked':'' }/>6、《安阳仲裁委员会仲裁员名册》</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"g")?'checked':'' }/>7、《当事人提交材料须知》</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"h")?'checked':'' }/>8、《证据提交清单》</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"i")?'checked':'' }/>9、《授权委托书》</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"j")?'checked':'' }/>10、《法定代表人证明书》</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"k")?'checked':'' }/>11、《仲裁员选定书》</label><br/>
				<span><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"l")?'checked':'' }/>12、（ ${fn:split(receipt.contents,",")[6] } ）安仲（ ${fn:split(receipt.contents,",")[7] } ）字第（ ${fn:split(receipt.contents,",")[8] } ）号调解书/裁决书/决定书</span><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"m")?'checked':'' }/>13、延期通知书</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"n")?'checked':'' }/>14、仲裁员仲裁庭案件通知书</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"o")?'checked':'' }/>15、答辩书</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"p")?'checked':'' }/>16、《安阳仲裁委员会仲裁风险责任告知书》</label><br/>
				<label><input type="checkbox" name="files" disabled="disabled" ${fn:contains(receipt.files,"q")?'checked':'' }/>17、《仲裁案件当事人意见征询表》</label><br/>
			</td>
			<td>
				上述送达文书和证据材料共
				${receipt.piece }
				件，于
				<fmt:formatDate value="${receipt.receiptDate }" pattern="yyyy年MM月dd日"/>
				收到。
				<br/>受送达人或代收人（签名或盖章）：
			</td>
		</tr>
		<tr>
			<td>不能送达原因或拒收理由</td>
			<td colspan="3">${receipt.reason }</td>
		</tr>
		<tr>
			<td>签发人</td>
			<td>${receipt.secretary }</td>
			<td>送达人</td>
			<td>${receipt.processServer }</td>
		</tr>
		<tr>
			<td>备注</td>
			<td colspan="3">${receipt.description }</td>
		</tr>
	</table>
</div>
