<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/tld.inc"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>厂商查询</title>
<%@ include file="/WEB-INF/jsp/inc/css-link.inc"%>
<%@ include file="/WEB-INF/jsp/inc/js-link.inc"%>
</head>
<style type="text/css">
body {
	background: #f3f6f5;
}
</style>

<script type="text/javascript">
	function chagepage(url) {
		parent.chagemenuPage(url);
	}
</script>

<body class="output-body">
	<div id="header"></div>
	<div class="search">
		<form method="post" class="search" id="search-data" name="search-data">
			<div class="row">
				<div class="col-sm-12">
					<div class="ibox">
						<div class="search-title">
							<ul class="nav nav-tabs">
								<li><a
									href="javascript:chagepage('<c:url value='/menu/search-customer'/>')">客户查询</a></li>
								<li class="active"><a
									href="javascript:chagepage('<c:url value='/menu/search-manufacturer'/>')">厂商查询</a></li>
							</ul>
						</div>
						<div class="search-content">

							<div class="form-group">
								<div class="col-sm-2">
									<label class="label">厂商名称</label> <input type="text"
										name="manufacturerName" class="form-control input-sm"
										id="manufacturerName" placeholder="模糊查询">
								</div>
							</div>
							<div class="btn" style="padding: 0px 17px;">
								<div class="btn-search">
									<a class="btn-xs btn-primary" type="button"
										href="javascript:search();">查 询</a> <a
										class="btn-xs btn-default" type="button">清除</a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox">
					<div class="search-title">
						<h5>厂商信息</h5>
						<div class="ibox-tools">
							<a data-toggle="modal" data-target="#addmanufacturermodal"
								style="color: #337ab7;">新增厂商</a>
						</div>
					</div>
					<div class="search-content">
						<table class="search-enter-table" id="table">
						</table>
						<div class="ai-tool">
							<div class="ai-left"></div>
							<div class="ai-right">
								<div class="ai-pagination" id="page"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 新增客户（Modal） -->
	<div class="modal fade" id="addmanufacturermodal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<p class="modal-title" style='text-align:center'>新增厂商</p>
				</div>
				<div class="modal-body">
					<form  id="m_from">
						<table class="output-table">
							<tbody>
								<tr>
									<td><FONT color=#ff0000>*</FONT>厂商名称</td>
									<td><input type="text" class="input-info" name="manufacturerName"
										id="outTime" /></td>
								</tr>
								<tr>
									<td><FONT color=#ff0000>*</FONT>厂商地址</td>
									<td><input type="text" class="input-info" name="address"
										id="unitPrice" /></td>
								</tr>
								<tr>
									<td><FONT color=#ff0000>*</FONT>电话</td>
									<td><input type="text" class="input-info" name="phone"
										id="number" /></td>
								</tr>
								<tr>
									<td><FONT color=#ff0000>*</FONT>电子邮箱</td>
									<td><input type="text" class="input-info" name="email"
										id="number" /></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<a type="button" class="btn btn-primary"
						href="javascript:addmanufacturer()">保存</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script type="text/javascript">
		/* 重置清空 */
		function reset() {
			$("#manufacturerName").val("");
		}

		function search() {
			$("#table").datagrid({
				url : "<c:url value='/api/info/manufacturer/query'/>",
				type : "get",
				data : {
					manufacturerName : $("#manufacturerName").val()
				},
				table : {
					id : "table",
					head : [ {
						item : "manufacturerId",
						name : "厂商编号"
					}, {
						item : "manufacturerName",
						name : "厂商名称"
					}, {
						item : "address",
						name : "地址"
					}, {
						item : "phone",
						name : "电话"
					}, {
						item : "email",
						name : "电子邮箱"
					} ],
				},
				page : {
					enable : true,
					id : "page",
					pageSize : 5
				}
			});
		}
		
		
		function addmanufacturer(){
			$.ajax({
				type : "post",
				url : "<c:url value='/api/info/manufacturer/add'/>",
				data : $('#m_from').serialize(),
				dataType : "json",
				success : function(data) {
					if (data.message == "success") {
						swal("成功", "新增厂商成功", "success");
						$('#addmanufacturermodal').modal('hide');
					} else {
						swal("失败", "新增厂商失败", "error");
						$('#addmanufacturermodal').modal('hide');
					}
				}
			});
		}
		
	</script>
</body>
</html>