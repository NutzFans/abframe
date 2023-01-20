<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<html>
<!-- 
  - Author(s): huangqj
  - Date: 2014-01-02 16:46:34
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
    <e:datasource name="empvac" type="entity" path="com.bos.mp.common.performance.OmEmployeeVac" />
	<w:panel id="panel1" width="100%" title="本人年假情况查看">
          <table align="center" border="0" width="100%" class="EOS_table">
          	<tr>
              <th align="center">工号</th>
              <th>姓名</th>
              <th>入职日期</th>
              <th>社会工作起始时间</th>
              <th>统计截止时间</th>
              <th>司龄</th>
              <th>2019年在职天数</th>
              <th>社会工龄</th>
              <th>标准年假天数</th>
              <th>奖励年假天数</th>
              <th>2019年可用年假天数</th>
              <th>2018年剩余年假</th>
              <th>2019春节统筹休假</th>
              <th>2019年已休天数</th>
              <th>2018年延期年假(清零）</th>
              <th>2019年剩余年假</th>
            </tr>
          	<tr>
              <th></th>
              <th></th>
              <th></th>
              <th></th>
              <th></th>
              <th></th>
              <th></th>
              <th></th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
              <th>6</th>
              <th>7=4-5-6</th>
              <th>8=2+3+4-5-6</th>
            </tr>
            <tr>
              <td colspan="1"><b:write property="empvac/userid"/></td>
              <td colspan="1"><b:write property="empvac/username" /></td>
              <td colspan="1"><b:write property="empvac/indate" formatPattern="yyyy-MM-dd"/></td>
              <td colspan="1"><b:write property="empvac/startdate" formatPattern="yyyy-MM-dd"/></td>
              <td colspan="1"><b:write property="empvac/countdate" formatPattern="yyyy-MM-dd"/></td>
              <td colspan="1"><b:write property="empvac/compservice" /></td>
              <td colspan="1"><b:write property="empvac/thisyeardays" /></td>
              <td colspan="1"><b:write property="empvac/socialservice" /></td>
              <td colspan="1"><b:write property="empvac/standard" /></td>
              <td colspan="1"><b:write property="empvac/bonus" /></td>
              <td colspan="1"><b:write property="empvac/canuse" /></td>
              <td colspan="1"><b:write property="empvac/lastyearleft" /></td>
              <td colspan="1"><b:write property="empvac/unitetake" /></td>
              <td colspan="1"><b:write property="empvac/used" /></td>
              <td colspan="1"><b:write property="empvac/lastyeardelay" /></td>
              <td colspan="1"><b:write property="empvac/nowleft" /></td>
            </tr>
          </table>
          <table align="center" border="0" width="100%" class="form_table">
          	<tr>
          		<td class="form_label">说明：</td>
				<td colspan="1">1、2019年在职天数：指员工的可用年假按在职天数计算。</td>
			</tr>
			<tr>
				<td class="form_label"></td>
				<td colspan="1">2、奖励年假：员工在公司工作满5年，之后每增加1年，增加1天奖励年假，公司奖励年假与法定年假合计满20天封顶；奖励年假有效期为每年1月1日-12月31日，过期自动清零。</td>
			</tr>
			<tr>
				<td class="form_label"></td>
				<td colspan="1">3、2018年延期年假：指2018年剩余年假如仍有剩余，将于2019年12月31日到期清零。</td>
			</tr>
			<tr>
				<td class="form_label"></td>
				<td colspan="1">4、当年剩余年假若为负数，将在下一年年假中扣减。</td>
			</tr>
			<tr>
				<td class="form_label"></td>
				<td colspan="1">5、2019年剩余年假中包含奖励年假。</td>
			</tr>
			<tr>
				<td class="form_label"></td>
				<td colspan="1">6、年假扣减顺序：优先扣除奖励年假，其次为上年剩余年假，最后为当年年假。</td>
			</tr>
			<tr>
				<td class="form_label"></td>
				<td colspan="1">以上，如有异议，请与人力资源部刘师霞 （liusx@primeton.com）联系，谢谢！</td>
			</tr>
          </table>         
        </w:panel>
</body>
</html>