<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="${pageContext.request.contextPath }/statistics/secretary"
		method="post">
		<div class="searchBar">
			<ul class="searchContent">
				<li>
					<label>案件的年份：</label>
					<select class="combox" name="year">
						<option value="">所有年份</option>
						<c:forEach var="year" items="${years }">
							<option value="${year }" ${param.year == year ? 'selected':'' }>${year }年</option>
						</c:forEach>
					</select>
				</li>
			</ul>

			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">生成报表</button>
							</div>
						</div></li>
				</ul>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript" charset="utf-8">
/* Title settings */		
title = "${datas[2]}";
titleXpos = 390;
titleYpos = 85;

/* Pie Data */
pieRadius = 130;
pieXpos = 150;
pieYpos = 150;
pieData = [${datas[1]}];
pieLegend = [${datas[0]}];

pieLegendPos = "east";

$(function () {
	var r = Raphael("chart_secretary");
	 
	r.text(titleXpos, titleYpos, title).attr({"font-size": 20});
	
	var pie = r.piechart(pieXpos, pieYpos, pieRadius, pieData, {legend: pieLegend, legendpos: pieLegendPos});
	pie.hover(function () {
		this.sector.stop();
		this.sector.scale(1.1, 1.1, this.cx, this.cy);
		if (this.label) {
			this.label[0].stop();
			this.label[0].attr({ r: 7.5 });
			this.label[1].attr({"font-weight": 800});
		}
	}, function () {
		this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");
		if (this.label) {
			this.label[0].animate({ r: 5 }, 500, "bounce");
			this.label[1].attr({"font-weight": 400});
		}
	});
	
});
</script>

<div id="chart_secretary"></div>
