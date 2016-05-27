<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
代理树型图
</Layout:overwrite>
 <Layout:overwrite name="Mycss">
 	<link rel="stylesheet" href="Css/zTreeStyle.css" type="text/css">
 </Layout:overwrite>

 <Layout:overwrite name="MyContent">
 <div class="row-fluid">
        <div>
            <div class="span12">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="index.jsp">首页</a>
                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="javascript:void(0)">代理管理</a><i class="icon-angle-right"></i>
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
        <div class="span6">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-reorder"></i>
                        <span class="NavTitle">代理组织图</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
        			<ul id="treeDemo" class="ztree"></ul>
                </div>
            </div>
        </div>
    </div>
		
			
</Layout:overwrite>
<Layout:overwrite name="MyScript">
<script src="Js/jquery.ztree.core.js"></script>
<script type="text/javascript">
<!--
var setting = {
	data: {
		simpleData: {
			enable: true
		}
	}
	,async: {
		enable: true,
		url:"AgentAction_getAgentTreeData",
		autoParam:["id", "name","level"],
		dataFilter: filter
	}
};
function filter(treeId, parentNode, childNodes) {
	if (!childNodes) return null;
	for (var i=0, l=childNodes.length; i<l; i++) {
		childNodes[i].name = childNodes[i].name.replace('','');
	}
	return childNodes;
}
var zNodes =[
	{ id:0, pId:-1, name:"总公司",isParent:true,iconOpen:"Css/img/diy/1_open.png", iconClose:"Css/img/diy/1_close.png"}	
];

$(document).ready(function(){
	$.fn.zTree.init($("#treeDemo"), setting,zNodes);
});
//-->
</script>
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>