<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
代理列表
</Layout:overwrite>
<%-- <Layout:overwrite name="Mycss"></Layout:overwrite> --%>

<Layout:overwrite name="MyContent">
<div class="row-fluid">
            <div class="span12">
                <div class="portlet box light-grey" style="border-top: 1px solid #eee;">
                    <div class="portlet-body">
                        <div class="clearfix">
                           
                            <div class="btn-group">
                                <a id="addhref" href="Agent/addAgent.jsp?active=menupage6_0"type="button" class="btn green">添加<i class="icon-edit"></i>
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
                            <div class="span6" style="text-align: right;">
                                <div class="dataTables_filter" id="sample_1_filter">
                                    <label>检索: <input type="text" aria-controls="sample_1" class="m-wrap small" id="search" style="height:30px;" placeholder="姓名,微信号"></label>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>姓名</th>
                                <th>微信号</th>
                                <th>电话</th>
                                <th>等级</th>
                                <th>状态</th>
                                <th>团队人数</th>
                                <th>操作</th>
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
                        <div class="span6" style="text-align: right;margin-top:-20px;">
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
	var pageSize = 10; //一页显示的记录数
    var pageIndex = 1; //当前页
    var PSize = 10;
    var orderby = "", strSearch ="";
    var count = 0;  //总记录数
   
    $(document).ready(function () {
    	getAgentList();
        document.getElementById("pagesize").onchange = function () {
            if (this.value < 0) {
                pageSize = count;
            } else
                pageSize = this.value;
            pageIndex = 1;
            getAgentList();
        }
        document.getElementById("search").onkeyup = function () {
            strSearch = this.value;
            getAgentList();
        };
    }); 
    function changelevel(level){
    	if(level==0){
    		return "总代";
    	}else{
    		return level+"级代理";
    	}
    }
    function changestatus(status){
    	if(status==0){
    		return "离开";
    	}else{
    		return "代理中"
    	}
    }
    function deleteagent(id,agpid){
    	  $.ajax({
              url: "AgentAction_deleteAgent",
              type: "POST",
              data: { "agent.agid":id,"agent.agpid":agpid},
              dataType: "json",
              success: function (result) { 
            	  if(result.code==1){
            	  noty({ text: "删除成功！", type: "success", layout: "topCenter", timeout: 2000 });
            	  getAgentList();
            	  }else{
            		  noty({ text: "删除失败！,请确认是否能删", type: "warnning", layout: "topCenter", timeout: 2000 });
            	  }
              }
    	  });
    }
    function getAgentList() {
        $.ajax({
            url: "AgentAction_getAgentAllByPage",
            type: "POST",
            data: { "page.pageSize": pageSize, "page.pageIndex": pageIndex, "page.strWhere": strSearch},
            dataType: "json",
            success: function (result) {            	
                if (result.code == 1) {
                    count = result.count;
                    var html = "";
                    var data=result.lg;          
                    for (var i = 0; i < data.length; i++) {
                        html += '<tr class="odd gradeX">';
                        html += '<td class="hidden-480">' + data[i].agname+ '</td>';
                        html += '<td class="hidden-480">' + data[i].agwxnum + '</td>';
                        html += '<td class="hidden-480">' + data[i].agtel + '</td>';
                        html += '<td class="hidden-480">' + changelevel(data[i].aglevel) + '</td>';
                        html += '<td class="hidden-480">' + changestatus(data[i].agstatus)  + '</td>';
                        html += '<td class="hidden-480">' + data[i].agcount + '</td>';
                        html += '<td class="hidden-480"><a href="AgentAction_getAgentByID?agent.agid=' + data[i].agid + '" class="label label-success" style="color: white;">编辑</a>';
                        html += '<a onclick="deleteagent('+data[i].agid+','+data[i].agpid+')" class="label label-important" style="color: white;margin-left:5px;">删除</a></td>';
                    }
                    $("#ListBody").html(html);
                }
                else {
                    var html = "";
                    html += "<tr class='odd gradeX'>";
                    html += "<td colspan='10' style='text-align:center'>抱歉，还没有任何代理</td>";
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
        	pageCount=0;
        }
        $("#pagePart").html(pageHtml);
        if (pageIndex > pageCount) {
            pageIndex = pageCount;
        }
    }

    function GotoPage(topage) {
        pageIndex = topage;
        if (0 < topage && topage <= pageCount)
        	getAgentList();
    }
    
    </script>
</Layout:overwrite> 
<%@ include file="/share/_Layout.jsp"%>