<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
添加业绩
</Layout:overwrite>
<%-- <Layout:overwrite name="Mycss"></Layout:overwrite> --%>

<Layout:overwrite name="MyContent">
<div class="row-fluid">
        <div class="span12">
            <ul class="breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="/Home/Index">首页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="#">业绩管理</a><i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="/Student/add">业绩添加</a></i>
                </li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
<div class="row-fluid">
        <div class="span6">
            <div class="portlet box purple">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-reorder"></i>
                        <span class="NavTitle">添加业绩信息</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form action="#" id="InfoForm" class="form-horizontal" novalidate="novalidate">
                        
                        <div class="control-group">
                            <label class="control-label">新增业绩&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="agauthorization" id="agauthorization" class="span6 m-wrap popovers" data-trigger="hover"  data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAgauthorization"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">业绩比例&nbsp;</label>
                            <div class="controls">
                              <div class="input-append"><input class="m-wrap span3 popovers" type="text" name="range.proportion" value="10" disabled/><span class="add-on">%</span></div>
                                <span style="color: red;" id="spanAgauthorization"></span>
                            </div>
                        </div>
                        <div class="form-actions">
                            <a type="submit" class="btn green" href="javascript:void(0);" onclick="SaveForm();">保存</a>
                            <a type="button" class="btn green" href="javascript:void(0);" onclick="Clear();">清空</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    	 <div class="span6">
                <div class="portlet box red" style="border-top: 1px solid #eee;">
                 	<div class="portlet-title">
                    <div class="caption">
                        <i class="icon-reorder"></i>
                        <span class="NavTitle">总代列表</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
               		 </div>
                    <div class="portlet-body">
                        <div class="clearfix">                         
                        </div>
                        <div class="row-fluid">
                            <div class="span6">
                                <div id="sample_1_length" class="dataTables_length">
                                    <label>
                                        <select size="1" name="sample_1_length" id="pagesize" aria-controls="sample_1" class="m-wrap small">
                                            <option value="5" selected="selected">5</option>
                                            <option value="10">10</option>
                                            <option value="20">20</option>
                                            <option value="-1">All</option>

                                        </select> 条每页</label>
                                </div>
                            </div>
                            <div class="span6">
                                <div class="dataTables_filter" id="sample_1_filter">
                                    <label>检索: <input type="text" aria-controls="sample_1" class="m-wrap small" id="search" style="height:30px;" placeholder="姓名、微信号..."></label>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th >
                                  	单选
                               	</th>
                                <th>姓名</th>
                                <th>微信号</th>
                                <th>手机号</th>
                            </tr>
                        </thead>
                        <tbody id="ListBody">
								
                        </tbody>
                    </table>
                    <div class="row-fluid">
                        <div class="span6">
                            <div id="pageInfo" class="dataTables_info">
                            </div>
                        </div>
                        <div class="span6">
                            <div class="dataTables_paginate paging_bootstrap pagination">
                                <ul id="pagePart">
                                </ul>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
           
    </div>
</Layout:overwrite>
 <Layout:overwrite name="MyScript">
 		<script>
 		var pageSize = 5;
 	    var pageIndex = 1;
 	    var PSize = 5;
 	    var count=0;
 	    var strSearch = "";
 		getAgentList();
 		document.getElementById("pagesize").onchange = function () {
            if (this.value < 0) {
                pageSize = count;
            } else
                pageSize = this.value;
            getAgentList();
        }
        document.getElementById("search").onkeyup = function () {
            strSearch = this.value;
            getAgentList();
        }
 		 function getAgentList() {
 	        $.ajax({
 	            url: "AgentAction_getAgentByPage",
 	            type: "POST",
 	            data: {"page.pageSize": pageSize, "page.pageIndex": pageIndex, "page.strWhere":strSearch},
 	            dataType: "json",
 	            success: function (result) { 
 	                if (result.code == 1) {
 	                    count = result.count;
 	                    var html = "";
 	                    var data=result.lg;
 	                    for (var i = 0; i < data.length; i++) {            	
 	                        html += '<tr class="odd gradeX">';
 	                        html += '<td class="sorting_1"><div ><span><input type="radio" onclick="checkItem(this);" name="AgentRadio" value=' + data[i].agid + '></span></div></td>';
 	                        html += '<td class="hidden-480">' + data[i].agname+ '</td>';
 	                        html += '<td class="hidden-480">' + data[i].agwxnum + '</td>';
 	                        html += '<td class="hidden-480">' + data[i].agtel + '</td></tr>';
 	                    }
 	                    $("#ListBody").html(html);
 	                }
 	                else {
 	                    var html = "";
 	                    html += "<tr class='odd gradeX'>";
 	                    html += "<td colspan='10' style='text-align:center'>抱歉，还没有任何信息</td>";
 	                    html += "</tr>";
 	                    $("#ListBody").html(html);
 	                }
 	                GetPageInfo(count);
 	            },
 	            error: function () {
 	                console.log("error");
 	            }
 	        });
 	    }

 	    function GetPageInfo(count) {
 	    	
 	        var pageHtml = "";
 	        if (count != 0) {
 	            recordCount = count;
 	            pageCount = Math.ceil(recordCount/ pageSize);
 	            if (pageIndex == 1) {
 	            	
 	                pageHtml += "<li class='prev disabled' ><a> « </a></li>";
 	            }
 	            else {
 	                pageHtml += "<li class='prev' onclick='GotoPage(" + Number(pageIndex - 1) + ")'><a>«</a></li>";
 	            }

 	            var PNumCount = Math.ceil(pageCount / PSize);//判断总分页
 	            var PNum = parseInt((pageIndex - 1) / PSize);//判断第几页分页
 	            if (PNum >= 1)
 	                pageHtml += "<li onclick='GotoPage(" + Number((PNum - 1) * PSize + 1) + ")'><a >...</a></li>";
 	            for (var j = PNum * PSize; j < (pageCount <= PSize * (PNum + 1) ? pageCount : PSize * (PNum + 1)) ; j++) {
 	                if (j == pageIndex - 1) {
 	                    pageHtml += "<li class=\"active\"><a >" + (j + 1) + "</a></li>";
 	                }
 	                else {
 	                    pageHtml += "<li onclick='GotoPage(" + (j + 1) + ")'><a >" + (j + 1) + "</a></li>";
 	                }
 	            }
 	            if ((PNum + 1) < PNumCount)
 	                pageHtml += "<li onclick='GotoPage(" + Number((PNum + 1) * PSize + 1) + ")'><a >...</a></li>";

 	            if (pageIndex == pageCount) {
 	                pageHtml += " <li class='next disabled'><a>»</a></li>";
 	            }
 	            else {
 	                pageHtml += " <li class='next' onclick='GotoPage(" + Number(pageIndex + 1) + ")'><a>»</a></li>";
 	            }
 	            $("#pagePart").html(pageHtml);
 	            if (pageSize * pageIndex > recordCount) {
 	                if (recordCount == 0) {
 	                    $("#pageInfo").html("暂无数据");
 	                }
 	                else {
 	                    $("#pageInfo").html("第" + ((pageIndex - 1) * pageSize + 1) + "-" + recordCount + "条，共 " + pageCount + "页");
 	                }
 	            }
 	            else {
 	                $("#pageInfo").html("第 " + ((pageIndex - 1) * pageSize + 1) + "-" + pageSize * pageIndex + " 条，共 " + pageCount + " 页");
 	            }
 	          
 	 	        if (pageIndex > pageCount) {
 	 	            pageIndex = pageCount;
 	 	        }
 	        }
 	        else {
 	            pageHtml += "<li class='prev disabled' ><a>«</a></li>";
 	            pageHtml += " <li class='next disabled'><a> » </a></li>";
 	            $("#pageInfo").html(" 0 条到 0 条，总共 0 页");
 	        } 
 	        $("#pagePart").html(pageHtml);
 	       
 	    }
 	   function GotoPage(topage) {
 	        pageIndex = topage;
 	        if (0 < topage && topage <= pageCount)
 	            getArticleList();
 	    }
 		</script>
 </Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>
