<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="activity/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ACTIVITY_ID" id="ACTIVITY_ID" value="${pd.ACTIVITY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动主题:</td>
								<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="255" placeholder="这里输入活动主题" title="活动主题" style="width:98%;"/></td>
							</tr>
							<tr>
								<%-- <td style="width:75px;text-align: right;padding-top: 13px;">活动主图:</td>
								<td><input type="text" name="ATT" id="ATT" value="${pd.ATT}" maxlength="255" placeholder="这里输入活动主图" title="活动主图" style="width:98%;"/></td>
								 --%>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动主图:</td>
								<td><input onmouseover="showTU('ATT','yulantu1');" onmouseout="hideTU('yulantu1');" type="text" name="ATT" id="ATT" value="${pd.ATT}" maxlength="100" placeholder="这里输入图片" title="图片" style="width:88%;"/>
									<a class="btn btn-xs btn-info" style="margin-top: -5px;" title="选择" onclick="xuanTp();">选择 </a>
									<div class="yulantu" id="yulantu1"></div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开始时间:</td>
								<td>
								<input type="datetime-local" name="BEGTIME" id="BEGTIME" value="${pd.BEGTIME}" style="width:98%;"> 
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">结束时间:</td>
								<td><input type="datetime-local" name="ENDTIME" id="ENDTIME" value="${pd.ENDTIME}" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动主办单位:</td>
								<td><input type="text" name="UNIT" id="UNIT" value="${pd.UNIT}" maxlength="255" placeholder="这里输入活动主办单位" title="活动主办单位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动规则:</td>
								<td><input type="text" name="RULES" id="RULES" value="${pd.RULES}" maxlength="1000" placeholder="这里输入活动规则" title="活动规则" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动对象:</td>
								<td><input type="text" name="OBJECT" id="OBJECT" value="${pd.OBJECT}" maxlength="255" placeholder="这里输入活动对象" title="活动对象" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动奖品:</td>
								<td><input type="text" name="PRIZE" id="PRIZE" value="${pd.PRIZE}" maxlength="255" placeholder="这里输入活动奖品" title="活动奖品" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">领奖时间:</td>
								<td><input type="text" name="AWARDTIME" id="AWARDTIME" value="${pd.AWARDTIME}" maxlength="255" placeholder="这里输入领奖时间" title="领奖时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">领奖地址:</td>
								<td><input type="text" name="AWARDADDRESS" id="AWARDADDRESS" value="${pd.AWARDADDRESS}" maxlength="255" placeholder="这里输入领奖地址" title="领奖地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->
<form  name="attForm" id="attForm" method="post" enctype="multipart/form-data">
 <input type="file" id="tp" name="file" onchange="fileType(this)"  style="display: none;"/>
</form>

	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="/static/js/jquery.easyui.min.js"></script> 
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入活动主题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#ATT").val()==""){
				$("#ATT").tips({
					side:3,
		            msg:'请输入活动主图',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ATT").focus();
			return false;
			}
			if($("#BEGTIME").val()==""){
				$("#BEGTIME").tips({
					side:3,
		            msg:'请输入开始时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BEGTIME").focus();
			return false;
			}
			if($("#ENDTIME").val()==""){
				$("#ENDTIME").tips({
					side:3,
		            msg:'请输入结束时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ENDTIME").focus();
			return false;
			}
			if($("#UNIT").val()==""){
				$("#UNIT").tips({
					side:3,
		            msg:'请输入活动主办单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UNIT").focus();
			return false;
			}
			/* if($("#RULES").val()==""){
				$("#RULES").tips({
					side:3,
		            msg:'请输入活动规则',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RULES").focus();
			return false;
			}
			if($("#OBJECT").val()==""){
				$("#OBJECT").tips({
					side:3,
		            msg:'请输入活动对象',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OBJECT").focus();
			return false;
			}
			if($("#PRIZE").val()==""){
				$("#PRIZE").tips({
					side:3,
		            msg:'请输入活动奖品',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PRIZE").focus();
			return false;
			}
			if($("#AWARDTIME").val()==""){
				$("#AWARDTIME").tips({
					side:3,
		            msg:'请输入领奖时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AWARDTIME").focus();
			return false;
			}
			if($("#AWARDADDRESS").val()==""){
				$("#AWARDADDRESS").tips({
					side:3,
		            msg:'请输入领奖地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AWARDADDRESS").focus();
			return false;
			} */
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		//显示图片
		function showTU(ID,TPID){
			 $("#"+TPID).html('<img width="200" src="'+$("#"+ID).val()+'">');
			 $("#"+TPID).show();
		}
		
		//隐藏图片
		function hideTU(TPID){
			 $("#"+TPID).hide();
		}
		
		//选择图片
		function xuanTp(){
			$("#tp").click();
		}
		
		
	  //过滤类型
	  function fileType(obj){
	   	 var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	     if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
		     $("#tp").tips({
		     	side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	         });
		     $("#tp").val('');
		     document.getElementById("tp").files[0] = '请选择图片';
	     }else{
	         console.info('submit');
	         $('#attForm').form('submit', { 
	         	url: '<%=basePath%>pictures/upFile', 
	           	success:function(d){
	                var json = $.parseJSON(d);  
	                console.log(json);
			        if("success" == json.msg){
			        	$("#ATT").val(json.filePath);
			        }else{ 
			        	alert(json.msg);
			        }
			      }
		     });
	      }
	  }
</script>
</body>
</html>