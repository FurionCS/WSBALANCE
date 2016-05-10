
<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
代理树型图
</Layout:overwrite>
 <Layout:overwrite name="Mycss">
 <link href="Css/jquery.treeview.css" rel="stylesheet" type="text/css" />
 <link href="Css/screen.css" rel="stylesheet" type="text/css" />
 </Layout:overwrite>

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
                    <ul id="browser" class="filetree">
		<li><i class="icon-group"></i><span class="">Folder 1</span>
			<ul>
				<li><i class="icon-male"></i>Item 1.1</li>
			</ul>
		</li>
		<li><i class="icon-group"></i><span class="">Folder 2</span>
			<ul>
				<li><i class="icon-group"></i><span class="">Subfolder 2.1</span>
					<ul id="folder21">
						<li>  <i class="icon-male"></i>File 2.1.1</li>
						<li><i class="icon-male"></i>File 2.1.2</li>
					</ul>
				</li>
				<li><i class="icon-male"></i>File 2.2</li>
			</ul>
		</li>
		<li class="closed"><i class="icon-group"></i><span class="">Folder 3 (closed at start)</span>
			<ul>
				<li><i class="icon-male"></i>File 3.1</li>
			</ul>
		</li>
		<li><i class="icon-male"></i>File 3.1</li>
	</ul>		
                </div>
            </div>
        </div>
    </div>
		
			
</Layout:overwrite>
<Layout:overwrite name="MyScript">
<script src="Js/jquery.cookie.js" type="text/javascript"></script>
<script src="Js/jquery.treeview.js"></script>
<script src="Js/demo.js"></script>
<script type="text/javascript">
$(document).ready(function(){
 
 $("#navigation").treeview({
  persist: "location",
  collapsed: true,
  unique: true
 });
});
</script>
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>