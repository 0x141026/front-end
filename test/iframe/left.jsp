<%@ page language="java" pageEncoding="GBK" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>房源校验</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link href="<s:url value="/css/webStyle.css"/>" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript" src="<s:url value="/js/jquery-1.4.1.min.js"/>"></script>
<script language="javascript" type="text/javascript" src="<s:url value="/js/jquery.validationEngine.js"/>"></script>
<script language="javascript" type="text/javascript" src="<s:url value="/js/webStyle.js"/>"></script>
<script language="javascript" type="text/javascript" src="<s:url value="/js/common.js"/>"></script>
<script language="javascript" type="text/javascript" src="<s:url value="/js/calendar.js"/>"></script>
<script type="text/javascript">
function clearQueryInfo(){
	$("#field option[value='']").attr("selected",true);
	$("#keyWord").val('请输入要查询的关键字');
	$("#hsRegBeginDate").val('');
	$("#hsRegEndDate").val('');
	$("#gpjBeginValue").val('');
	$("#gpjEndValue").val('');
	$("#areaConstBeginValue").val('');
	$("#areaConstEndValue").val('');
	$("#fwzt option[value='']").attr("selected",true);
	$("#djbz option[value='']").attr("selected",true);
	$("#selfdj option[value='']").attr("selected",true);
	$("#cityId option[value='']").attr("selected",true);
}
</script>
<script language="JavaScript"> 
var timer;
var time=60*1000;
function refresh() //刷新界面
{ 
	form.action="../fgry/House_hd.action";
	form.submit();
} 
function startRefresh(){
	timer=setTimeout('refresh()',time); //指定X秒刷新一次 
}
function closeRefresh(){
	clearTimeout(timer);
}
function iselect(){
	var boxs = document.getElementsByName("box"); 
	if(boxs!=null){
		if(boxs[0].checked==true){//选中
			startRefresh();
			document.getElementById("tFlag").value='true';
		}else{//未选中
			if(timer!=null){
				closeRefresh();
			}
			document.getElementById("tFlag").value='false';
		}
	}
}
</script>
<style type="text/css">
.common {
	color:#FF4500;
}
</style>
</head>
<body>
<span class="title">房源校验</span>

<s:form name="form" action="House_hd" namespace="/fgry" method="get">
<table width="100%">
  <tr>
    <td nowrap align="right" width="10%">
    <!-- ,'c.ownerName':'房屋所有权人','c.ownerId':'所有权人证件号' -->
	<s:select id="field" name="field" list="#{'t3.keyCode':'产权证号','':'--请选择字段--'}"></s:select>：
    </td>
    <td nowrap align="left" width="15%">
	<s:if test="keyWord==null || keyWord==''">
      &nbsp;<s:textfield id="keyWord" name="keyWord" onmouseover="this.focus()" onfocus="this.select()" onclick="if(this.value=='请输入要查询的关键字')this.value=''" size="30"  value='请输入要查询的关键字'></s:textfield>
    </s:if>
    <s:else>
      &nbsp;<s:textfield id="keyWord" name="keyWord" onmouseover="this.focus()" onfocus="this.select()" onclick="if(this.value=='请输入要查询的关键字')this.value=''" size="30"  ></s:textfield>
    </s:else>
    </td>
    <td nowrap align="right" width="10%">
	房屋录入时间：
    </td>
     <td nowrap align="left" width="15%">
&nbsp;<s:textfield id="hsRegBeginDate" name="hsRegBeginDate" size="10" onclick="c.getCalendar('[yy]-[mon]-[dd]',this.value,'hsRegBeginDate',this);" cssClass="validate[custom[date]]"/>
- <s:textfield type="text" id="hsRegEndDate" name="hsRegEndDate" size="10" onclick="c.getCalendar('[yy]-[mon]-[dd]',this.value,'hsRegEndDate',this);" cssClass="validate[custom[date]]"/>
    </td>
  <td nowrap align="right" width="10%">
	 房屋状态：
    </td>
     <td nowrap align="left" width="10%">
		&nbsp;<s:select id="fwzt" name="fwzt" list="#{'':'--房屋状态--','1待审核':'待校验','2审核通过':'校验通过','2已审':'校验未通过'}"></s:select>
    </td>
    <td nowrap align="right" width="10%">
	  是否冻结：
    </td>
    <td nowrap align="left">
	  &nbsp;<s:select id="djbz" name="djbz" list="#{'':'--是否冻结--','1':'已冻结','0':'未冻结'}"></s:select>
    </td>
    <td ><input id="box" type="checkbox" name="box"  value="定时刷新" onclick="iselect()">定时刷新（60s）
    <s:hidden id="tFlag" name="tflag"></s:hidden>
    </td>
  </tr>
  <tr>
    <td nowrap align="right">
	挂牌价区间（元）：
   </td>
    <td nowrap align="left">
		&nbsp;<s:textfield id="gpjBeginValue" type="text" name="gpjBeginValue" size="10" cssClass="validate[custom[onlyPNumber]]"/> - <s:textfield type="text" id="gpjEndValue" name="gpjEndValue" size="10" cssClass="validate[custom[onlyPNumber]]"/>
   </td>
   <td nowrap align="right">
	建筑面积区间（㎡）：
    </td>
     <td nowrap align="left">
		&nbsp;<s:textfield id="areaConstBeginValue" type="text" name="areaConstBeginValue" size="10" cssClass="validate[custom[onlyPNumber]]"/> 
		- <s:textfield type="text" id="areaConstEndValue" name="areaConstEndValue" size="10" cssClass="validate[custom[onlyPNumber]]"/>
    </td>
     <td nowrap align="right">
	登记范围：
    </td>
     <td nowrap align="left">
		&nbsp;<s:select id="selfdj" name="selfdj" list="#{'':'--登记范围--','self':'自己登记','others':'他人登记'}"></s:select>
    </td>
    <td nowrap align="right">
	辖市区域：
    </td>
     <td nowrap align="left">
		&nbsp;<select id="cityId" name="cityId">
					  <option value="">----请选择---</option>
                      <s:iterator value="resultCityList">
                      <option value="<s:property value="cid"/>"><s:property value="cname"/></option>
                      </s:iterator>
                    </select>
                    <script type="text/javascript">$("#cityId").val("${param['cityId']}");</script>
                    </td>
     <td align="right" nowrap colspan="2">
   		 <s:submit value="查  询"></s:submit><input type="button" value="清  空" onclick="clearQueryInfo()"/>
   		 
    </td>
    
  </tr>
</table>
</s:form>
<table width="100%">
  <tr>
  	<th nowrap>房屋录入时间</th>
    <th nowrap width="8%">产权证号</th>
    <th nowrap width="180px">房屋坐落</th>
    <th nowrap>产权登记时间</th>
    <th nowrap>面积（㎡）</th>
    <th nowrap>联系人</th>
    <th nowrap width="8%">联系电话</th>
    <th nowrap>挂牌价（元）</th>
    <th nowrap>状态</th>
    <th nowrap>中介公司名称（中介代码）</th>
    <th nowrap style="width:150px;">操作</th>
  </tr>
  <s:iterator value="resultfwlist">
  <tr class="tr_list">
  <s:if test="flag==\"1\"">
  <td nowrap><CENTER><FONT color="#0000FF"><s:date name="lrrq" format="yyyy-MM-dd"/></FONT></CENTER></td>
	    <td nowrap><CENTER><FONT color="#0000FF"><s:property value="keyCode"/></FONT></CENTER></td>
	    <td style="text-align: left;width:180px;"><FONT color="#0000FF"><s:property value="hsOldAddr"/></FONT></td>
	    <td nowrap><CENTER><FONT color="#0000FF"><s:property value="hsRegDate"/></FONT></CENTER></td>
	    <td nowrap><CENTER><FONT color="#0000FF"><s:property value="hsAreaConst"/></FONT></CENTER></td>
	    <td nowrap><CENTER><FONT color="#0000FF"><s:property value="lxr"/></FONT></CENTER></td>
	    <td nowrap><CENTER><FONT color="#0000FF"><s:property value="lxdh"/></FONT></CENTER></td>
	    <td style="text-align: right;" nowrap><FONT color="#0000FF"><s:property value="gpj"/></FONT></td>
	    <td nowrap><CENTER><FONT color="#0000FF">
	    <s:if test="fwdjbz==\"1\"">
	     <s:if test='fwzt=="1待审核"'>待校验  | 预登记  | 已冻结</s:if>
	    <s:elseif test='fwzt=="2已审"'>校验未通过  | 预登记 | 已冻结</s:elseif>
	    <s:elseif test='fwzt=="2审核通过"'>校验通过  | 预登记  | 已冻结</s:elseif>
	    </s:if>
	    <s:else>
	    <s:if test='fwzt=="1待审核"'>待校验  | 预登记</s:if>
	    <s:elseif test='fwzt=="2已审"'>校验未通过  | 预登记</s:elseif>
	    <s:elseif test='fwzt=="2审核通过"'>校验通过  | 预登记</s:elseif>
	    </s:else>
	    </FONT></CENTER>
	    </td>
	    <td nowrap><CENTER><FONT color="#0000FF">
	    <s:if test='prId==null'></s:if>
	     <s:else>
	    	<s:url id="viewProv_url" action="viewProv" namespace="/fgry">
	        	<s:param name="paramProv.prId"><s:property value="prId"/></s:param>
	        </s:url>
	    	<a href="#" onclick="$().winOpen('<s:property value="#viewProv_url"/>')"><s:property value="prName"/>（<s:property value="prId"/>）</a>
	    </s:else>
	    </FONT></CENTER></td>
  </s:if>
  <s:elseif test="fwdjbz==\"1\"">  <!-- 已冻结   -->
	    <td nowrap><CENTER><span class="common"><s:date name="lrrq" format="yyyy-MM-dd"/></span></CENTER></td>
	    <td nowrap><CENTER><span class="common"><s:property value="keyCode"/></span></CENTER></td>
	    <td style="text-align: left;width:180px;"><span class="common"><s:property value="hsOldAddr"/></span></td>
	    <td nowrap><CENTER><span class="common"><s:property value="hsRegDate"/></span></CENTER></td>
	    <td nowrap><CENTER><span class="common"><s:property value="hsAreaConst"/></span></CENTER></td>
	    <td nowrap><CENTER><span class="common"><s:property value="lxr"/></span></CENTER></td>
	    <td nowrap><CENTER><span class="common"><s:property value="lxdh"/></span></CENTER></td>
	    <td style="text-align: right;" nowrap><span class="common"><s:property value="gpj"/></span></td>
	    <td nowrap><CENTER><span class="common">
	     <s:if test='fwzt=="1待审核"'>待校验  | 已冻结</s:if>
	    <s:elseif test='fwzt=="2已审"'>校验未通过  | 已冻结</s:elseif>
	    <s:elseif test='fwzt=="2审核通过"'>校验通过  | 已冻结</s:elseif>
	    </span></CENTER>
	    </td>
	    <td nowrap><CENTER><span class="common">
	    <s:if test='prId==null'></s:if>
	     <s:else>
	    	<s:url id="viewProv_url" action="viewProv" namespace="/fgry">
	        	<s:param name="paramProv.prId"><s:property value="prId"/></s:param>
	        </s:url>
	    	<a href="#" onclick="$().winOpen('<s:property value="#viewProv_url"/>')"><s:property value="prName"/>（<s:property value="prId"/>）</a>
	    </s:else>
	    </span></CENTER></td>
    </s:elseif>
    <s:else>
        <td nowrap><CENTER><s:date name="lrrq" format="yyyy-MM-dd"/></CENTER></td>
    	<td nowrap><CENTER><s:property value="keyCode"/></CENTER></td>
	    <td style="text-align: left;width:180px;"><s:property value="hsOldAddr"/></td>
	    <td nowrap><CENTER><s:property value="hsRegDate"/></CENTER></td>
	    <td nowrap><CENTER><s:property value="hsAreaConst"/></CENTER></td>
	    <td nowrap><CENTER><s:property value="lxr"/></CENTER></td>
	    <td nowrap><CENTER><s:property value="lxdh"/></CENTER></td>
	    <td style="text-align: right;" nowrap><s:property value="gpj"/></td>
	    <td nowrap><CENTER>
	    <s:if test='fwzt=="1待审核"'>待校验</s:if>
	    <s:elseif test='fwzt=="2已审"'>校验未通过</s:elseif>
	    <s:elseif test='fwzt=="2审核通过"'>校验通过</s:elseif>
	    </CENTER></td>
	    <td nowrap><CENTER><s:if test='prId==null'></s:if>
	    <s:else>
	    	<s:url id="viewProv_url" action="viewProv" namespace="/fgry">
	        	<s:param name="paramProv.prId"><s:property value="prId"/></s:param>
	        </s:url>
	    	<a href="#" onclick="$().winOpen('<s:property value="#viewProv_url"/>')"><s:property value="prName"/>（<s:property value="prId"/>）</a>
	    </s:else>
	    
	    </CENTER></td>
    </s:else>
    <td style="width:150px;">
    	<b><a href="#" onclick="$().winOpen('<s:url value='/fgry/fwshow.action'/>?paramfw_fwgl.fwId=<s:property value="fwId"/>&operate=view','900','500','浏览')">浏览</a></b>   	    	
    	<s:if test='fwzt=="1待审核"'>
    	|<b><a href="#" onclick="$().winOpen('<s:url value='/fgry/beforefyhd2.action'/>?paramfw_fwgl.fwId=<s:property value="fwId"/>&paramfw_fwgl.keyCode=<s:property value="keyCode"/>&paramfw_fwgl.ownerName=<s:property value="ownerName"/>','1000','650','校验')">校验</a></b>
		<!--|<b><a href="#" onclick="$().winOpen('<s:url value='/fgry/beforefyhd_test.action'/>?paramfw_fwgl.fwId=<s:property value="fwId"/>&paramfw_fwgl.keyCode=<s:property value="keyCode"/>&paramfw_fwgl.ownerName=<s:property value="ownerName"/>','1000','750','快速校验')">快速校验</a></b>
		  -->
    	</s:if>
    	<s:else>
    	|<b><a href="#" onclick="$().winOpen('<s:url value='/fgry/beforefyhd_again.action'/>?paramfw_fwgl.fwId=<s:property value="fwId"/>&paramfw_fwgl.keyCode=<s:property value="keyCode"/>&paramfw_fwgl.ownerName=<s:property value="ownerName"/>','1000','650','重新校验')">重新校验</a></b>
    	</s:else>
    	<!--  <s:if test='fwzt=="2审核通过"'>
    	|<b><s:a action="resendtzm" namespace="/fgry" onclick="javascript:if(confirm('确定为该房源重发通知码吗?')){}else{return false;}">
	       <s:param name="paramfw.zjkfwglId"><s:property value="zjkfwglId"/></s:param>
		   <s:param name="queryCode"><s:property value="queryCode"/></s:param>
	        	<strong>重发通知码</strong>
	       </s:a></b>
	    </s:if> -->
    	
    <!--	<s:elseif test='fwzt=="3待售"'>
    	|<b><s:a action="fyhd_ch" namespace="/fgry" onclick="javascript:if(confirm('确定撤回该套房源吗?')){}else{return false;}">
	       <s:param name="paramfw_fwgl.fwId"><s:property value="fwId"/></s:param>
		   <s:param name="queryCode"><s:property value="queryCode"/></s:param>
	       	撤回
	       </s:a></b>
    	</s:elseif>
	         	<s:else>
    	  |<b><s:a action="fyhd_ch" namespace="/fgry" onclick="javascript:if(confirm('确定撤回该套房源吗?')){}else{return false;}">
	       <s:param name="paramfw_fwgl.fwId"><s:property value="fwId"/></s:param>
		   <s:param name="queryCode"><s:property value="queryCode"/></s:param>
	       	撤回
	       </s:a></b>
  </s:else>   	-->    	
  
    </td>
  </tr>
  </s:iterator>
</table>
	<s:if test="resultfwlist.size>0">
		<s:text name="pageToolbar"></s:text>
	</s:if>	
	<br><br><s:if test="resultfwlist.size==0"><center><font size="4" color="#ff0000">您所查询的信息不存在！</font></center></s:if>	
	
	</body>
	
<script language="JavaScript">
if($('#tFlag').val()=='true'){
	document.getElementById("box").checked=true
}else{
	document.getElementById("box").checked=false
}
iselect();
</script> 
</html>