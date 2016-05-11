<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
I am title
</Layout:overwrite>
<%-- <Layout:overwrite name="Mycss"></Layout:overwrite> --%>

<Layout:overwrite name="MyContent">
<div class="row-fluid">
        <div>
            <div class="span12">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="/Home/Index">首页</a>
                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="javascript:void(0)">业绩管理</a><i class="icon-angle-right"></i>
                    </li>

                    <li>
                        <a href="javascript:void(0)">业绩列表</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
<div class="row-fluid">
            <div class="span12">
                <div class="portlet box light-grey" style="border-top: 1px solid #eee;">
                    <div class="portlet-body">
                        <div class="clearfix">
                            <div class="btn-group">
                                <a id="excel" href="com.Manager.Communication/DownloadExcel" type="button" class="btn yellow">导出Excel <i class="icon-bar-chart"></i>
                                </a>
                            </div>
                           
                        </div>
                        <div class="row-fluid">
                            <div class="span6">
                                <div id="sample_1_length" class="dataTables_length">
                                    <label>
                                        <select size="1" name="sample_1_length" id="pagesize" aria-controls="sample_1" class="m-wrap small">
                                            <option value="5">5</option>
                                            <option value="10" selected="selected">10</option>
                                            <option value="20">20</option>
                                            <option value="-1">All</option>

                                        </select> 条记录每页</label>
                                </div>
                            </div>
                            <div class="span6">
                                <div class="dataTables_filter" id="sample_1_filter" style="text-align: right;">
                                    <label>检索: <input type="text" aria-controls="sample_1" class="m-wrap small" id="search" style="height:30px; " placeholder="姓名、微信号"></label>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
<!--                                 <th style="text-align: center">
                                    <input type="checkbox" id="chk_All" class="checkboxes" onclick="CheckAll(this)" />
                                </th>
 -->                                <th>姓名</th>
                                <th>微信号</th>
                                <th>团队业绩</th>
                                <th>团队奖金</th>
                                <th>个人奖金</th>
                            </tr>
                        </thead>
                        <tbody id="ListBody">
								<%-- <%
									ArrayList ContactList=(ArrayList)session.getAttribute("ContactList");
									if(ContactList==null || ContactList.size()==0){
								%>
								<tr class='odd gradeX'><td colspan='10' style='text-align:center'>抱歉，还没有任何信息</td></tr>
								<% 
									}
									else{
										for(int i=ContactList.size()-1;i>=0;i--){
											ContactBean CB=(ContactBean)ContactList.get(i);
											%>
											<tr class="odd gradeX">
											<td class="sorting_1"><div class="checker"><span><input type="checkbox" onclick="checkItem(this);" class="checkboxes" value="<%=CB.getID() %>"></span></div></td>
											<td class="hidden-480"><%=CB.getName() %></td>
											<td class="hidden-480"><%=CB.getSex() %></td>
											<td class="hidden-480"><%=CB.getPhone() %></td>
											<td class="hidden-480"><%=CB.getEmail() %></td>
											<td class="hidden-480"><%=CB.getQQ() %></td>
											<td class="hidden-480"><%=CB.getHomeAdress() %></td>
											<td class="hidden-480"><%=CB.getWorkAdress()%></td>
											<td class="hidden-480"><%=CB.getCode() %></td>
											<td class="hidden-480"><a href="./com.Manager.Communication/EditContact?ID=<%=CB.getID()%>"class="label label-important" style="color: white;">编辑</a></td>
											<% 
										}
										
									}
									
								%> --%>
                        </tbody>
                    </table>
                    <div class="row-fluid">
                        <div class="span6">
                            <div id="pageInfo" class="dataTables_info">
                            </div>
                        </div>
                        <div class="span6">
                            <div class="dataTables_paginate paging_bootstrap pagination" style="text-align: right;">
                                <ul id="pagePart">
                                </ul>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        <h4 >excel上传到数据库</h4>
      </div>
      <div class="modal-body">
        <form id="fileupload">
        	<span class="btn green fileinput-button">
        		<i class="icon-plus icon-white"></i>
        		<span>上传文件</span>
        		<input type="file" name="files[]" id="upfile" multiple/>    
        	</span>       
        </form>
        	<p>说明：如果您不清楚上传的要求请先下载模板</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a type="button" class="btnWarning btn" href="com.Manager.Util/SmartDownload?filename=博弈经济协会.xlsx"><i class="m-icon-swapdown m-icon-white"></i>下载模板</a>
        <button type="button" class="btn btnprimary"><i class="m-icon-swapup m-icon-white"></i>确定上传</button>
      </div>
    </div>
  </div>
</div>
</Layout:overwrite>
 <Layout:overwrite name="MyScript">
	<script>
	var pageSize = 10; //一页显示的记录数
    var pageIndex = 1; //当前页
    var PSize = 10;
    var orderby = "", strSearch = "";
    var count = 0;  //总记录数
    $(document).ready(function () {
    	getPerformanceList();
        document.getElementById("pagesize").onchange = function () {
            if (this.value < 0) {
                pageSize = count;
            } else
                pageSize = this.value;
            getPerformanceList();
        }
        document.getElementById("search").onkeyup = function () {
            strSearch =this.value;
            getPerformanceList();
        };
    });
    function getPerformanceList() {
        $.ajax({
            url: "AchievementAction_getPerformanceByPage",
            type: "POST",
            data: { "page.pageSize": pageSize, "page.pageIndex": pageIndex, "page.strWhere": strSearch},
            dataType: "json",
            success: function (result) {  
                if (result.code == 1) {
                    var count = result.count;
                    var data=result.lp;
                    var html = "";
                    for (var i = 0; i < data.length; i++) {
                        html += '<tr class="odd gradeX">';
                       /*  html += '<td class="sorting_1"><div class="checker"><span><input type="checkbox" onclick="checkItem(this);" class="checkboxes" value=' + data[i][0] + '></span></div></td>'; */
                        html += '<td class="hidden-480">' + data[i][1]+ '</td>';
                        html += '<td class="hidden-480">' + data[i][2] + '</td>';
                        html += '<td class="hidden-480">' + data[i][3] + '</td>';
                        html += '<td class="hidden-480">' + data[i][4] + '</td>';
                        html += '<td class="hidden-480">' + data[i][5]  + '</td></tr>';
                      
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
                $("#chk_All").attr("checked", false).closest("span").removeClass("checked");

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
            pageCount = Math.ceil(recordCount / pageSize);

            if (pageIndex == 1) {
                pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
            }
            else {
                pageHtml += "<li class='prev' onclick='GotoPage(" + Number(pageIndex - 1) + ")'><a>← <span class='hidden-480'>上一页</span></a></li>";
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
                pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
            }
            else {
                pageHtml += " <li class='next' onclick='GotoPage(" + Number(pageIndex + 1) + ")'><a><span class='hidden-480'>下一页</span> → </a></li>";
            }
            $("#pagePart").html(pageHtml);
            if (pageSize * pageIndex > recordCount) {
                if (recordCount == 0) {
                    $("#pageInfo").html("显示第 0 条数据到 0 条数据，总共 0 页");
                }
                else {
                    $("#pageInfo").html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + recordCount + " 条数据，总共 " + pageCount + " 页");
                }
            }
            else {
                $("#pageInfo").html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + pageSize * pageIndex + " 条数据，总共 " + pageCount + " 页");
            }
        }
        else {
            pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
            pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
            $("#pageInfo").html("显示 0 条数据到 0 条数据，总共 0 页");
        }
        $("#pagePart").html(pageHtml);
        if (pageIndex > pageCount) {
            pageIndex = pageCount;
        }
    }

    function GotoPage(topage) {
        pageIndex = topage;
        if (0 < topage && topage <= pageCount)
            getContactList();
    }
    </script> 
</Layout:overwrite>	
	
<%@ include file="/share/_Layout.jsp"%>