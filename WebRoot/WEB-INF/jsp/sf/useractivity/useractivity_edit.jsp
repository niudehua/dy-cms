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
					
					<form action="useractivity/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="USERACTIVITY_ID" id="USERACTIVITY_ID" value="${pd.USERACTIVITY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">微信用户ID:</td>
								<td><input type="text" name="WXUSERID" id="WXUSERID" value="${pd.WXUSERID}" maxlength="255" placeholder="这里输入微信用户ID" title="微信用户ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">活动主键:</td>
								<td><input type="text" name="ACTIVITYID" id="ACTIVITYID" value="${pd.ACTIVITYID}" maxlength="255" placeholder="这里输入活动主键" title="活动主键" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">步数:</td>
								<td><input type="text" name="COUNT" id="COUNT" value="${pd.COUNT}" maxlength="255" placeholder="这里输入步数" title="步数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公里数:</td>
								<td><input type="text" name="KMCOUNT" id="KMCOUNT" value="${pd.KMCOUNT}" maxlength="255" placeholder="这里输入公里数" title="公里数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用时:</td>
								<td><input type="text" name="TIMES" id="TIMES" value="${pd.TIMES}" maxlength="255" placeholder="这里输入用时" title="用时" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">报名时间:</td>
								<td><input type="text" name="SIGNTIME" id="SIGNTIME" value="${pd.SIGNTIME}" maxlength="255" placeholder="这里输入报名时间" title="报名时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">名次:</td>
								<td><input type="text" name="RANKING" id="RANKING" value="${pd.RANKING}" maxlength="255" placeholder="这里输入名次" title="名次" style="width:98%;"/></td>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#WXUSERID").val()==""){
				$("#WXUSERID").tips({
					side:3,
		            msg:'请输入微信用户ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WXUSERID").focus();
			return false;
			}
			if($("#ACTIVITYID").val()==""){
				$("#ACTIVITYID").tips({
					side:3,
		            msg:'请输入活动主键',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACTIVITYID").focus();
			return false;
			}
			if($("#COUNT").val()==""){
				$("#COUNT").tips({
					side:3,
		            msg:'请输入步数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUNT").focus();
			return false;
			}
			if($("#KMCOUNT").val()==""){
				$("#KMCOUNT").tips({
					side:3,
		            msg:'请输入公里数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#KMCOUNT").focus();
			return false;
			}
			if($("#TIMES").val()==""){
				$("#TIMES").tips({
					side:3,
		            msg:'请输入用时',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TIMES").focus();
			return false;
			}
			if($("#SIGNTIME").val()==""){
				$("#SIGNTIME").tips({
					side:3,
		            msg:'请输入报名时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SIGNTIME").focus();
			return false;
			}
			if($("#RANKING").val()==""){
				$("#RANKING").tips({
					side:3,
		            msg:'请输入名次',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RANKING").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>