<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="import">
<%@ taglib prefix="s" uri="/struts-tags" %>
</Layout:overwrite>
<Layout:overwrite name="title">
结算设定
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
                    <a href="#">代理管理</a><i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="/Student/add">代理增加</a></i>
                </li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
<div class="row-fluid">
        <div class="span12">
            <div class="portlet box yellow">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-reorder"></i>
                        <span class="NavTitle">填写代理信息</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                	<div class="control-group" id="formRanges">
                <%-- <s:bean name="com.wsbalance.service.RangesService" var="rs"></s:bean>
                	<s:set var="rslist" value="#rs.getRangesAll()"></s:set>
                	<s:debug></s:debug>
                	<s:iterator value="#rslist" var="r">
                		<form action="#"  class="form-horizontal formRange" novalidate="novalidate">
                			<label class="control-label">范围</label>
                			<div class="controls">
                            			<div class="input-append">
											<input class="m-wrap span9 popovers" type="text" value="#r.getMinnum()"/><span class="add-on">元</span>
										</div>
										<span class="">--</span>
										<div class="input-append">
												<input class="m-wrap span9 popovers" type="text" value="#r.getMaxnum()"/><span class="add-on">元</span>
										</div>
										<div class="input-append">
												<input class="m-wrap span3 popovers" type="text" value="#r.getProportion()"/><span class="add-on">%</span>
										</div>
										<button type="button" class="btn blue">提交</button>
										<button type="button" class="btn yellow">修改</button>
                           		</div>
                    	</form>
                	</s:iterator> --%>
                    </div>
                    <a href="javascript:void(0);" class="btn green icn-only" onclick="addForm()"><i class="m-icon-swapright icon-plus"></i></a>
                    <a href="javascript:void(0);" class="btn red icn-only" onclick="deleteForm()"><i class="m-icon-swapright icon-minus"></i></a>
                </div>
            </div>
        </div>
    </div>


	
</Layout:overwrite>
 <Layout:overwrite name="MyScript">
 	<script>
 		function addForm(){
 			var str=' <form action="RangesAction_addRange"  class="form-horizontal formRange" novalidate="novalidate">';
 			str+=' <label class="control-label">范围：'+count+'</label><div class="controls">';
 			str+='	<div class="input-append"><input class="m-wrap span9 popovers" type="text" name="range.minnum" /><span class="add-on">元</span></div>';
 			str+='<span class="">--</span><div class="input-append"><input class="m-wrap span9 popovers" type="text"  name="range.maxnum"/><span class="add-on">元</span></div>';
 			str+='<div class="input-append"><input class="m-wrap span3 popovers" type="text" name="range.proportion"/><span class="add-on">%</span></div>';
 			str+='<input type="submit" class="btn blue" value="提交"/></div><br> </form>';
 			$("#formRanges").html($("#formRanges").html()+str);
 			count++;
 		}
 		function deleteForm(){
 			var length=$(".formRange").length;
 			var formRange=$(".formRange")[length-1];
 			if($(".rangeid")[length-1]!=null){
 				var i=1;
 				$(".rangeid").each(function(){
 					if(i==length){
 						if(deleteRange($(this).val(),formRange)){
 							count--;
 						}
 					}
 					i++;
 				})
 			} else{
 				formRange.remove();
 				count--;
 			}
 			
 		}
 		function deleteRange(id,formRange){
 			var flag=true;
 			noty({
                  text: '确定要删除这条范围吗',
                  type: 'information',
                  layout: 'center',
                  buttons: [
                      {
                          addClass: 'btn blue', text: '确定', onClick: function ($noty) {
				 			$.ajax({
					            url: "RangesAction_deleteRange",
					            type: "POST",   
					            data: {"range.rid":id},
					            dataType: "json",
					            success: function (result) {
					            	if(result.code==1){
					            		 flag=true;
					            		 $noty.close();
					            		 noty({ text: "删除成功！", type: "success", layout: "topCenter", timeout: 1000, modal: true }); 
					            		 setTimeout(function(){formRange.remove();}, 3000)
					            	}else{
					            		 $noty.close();
					            		noty({ text: "删除失败！", type: "warning", layout: "topCenter", timeout: 1000, modal: true }); 
					            	}
					            },
					            error: function () {
                                    noty({ text: "检查网络设置", type: 'warning', layout: 'center', timeout: 2000 });
                                }
				 			});
                          }
                      },
                      {
                          addClass: 'btn red', text: '取消', onClick: function ($noty) {
                              $noty.close();
                          }
                      }
                  ]
              });
 			 return flag;
 		}
 		
 		GetRangeAll();
 		var count;
 		function GetRangeAll(){
 			$.ajax({
	            url: "RangesAction_getRangesAll",
	            type: "POST",    	            
	            dataType: "json",
	            success: function (result) { 
	            	if(result.code==1){
	            		var lr=result.lr;
	            		count=1;
	            		var html="";
	            		for(var i=0;i<lr.length;i++){
		            		html+='<form action="RangesAction_addRange"  class="form-horizontal formRange" novalidate="novalidate"><input type="text" class="rangeid" name="range.rid" value="'+lr[i].rid+'" style="display:none"/>';
		            		html+=' <label class="control-label">范围：'+count+'</label><div class="controls">';
		            		html+='	<div class="input-append"><input class="m-wrap span9 popovers" type="text" value="'+lr[i].minnum+'" name="range.minnum"/><span class="add-on">元</span></div>';
		            		html+='<span class="">--</span><div class="input-append"><input class="m-wrap span9 popovers" type="text"  value="'+lr[i].maxnum+'" name="range.maxnum"/><span class="add-on">元</span></div>';
		            		html+='<div class="input-append"><input class="m-wrap span3 popovers" type="text" value="'+ lr[i].proportion+'" name="range.proportion"/><span class="add-on">%</span></div>';
		            		html+='<input type="submit" class="btn blue" value="提交"/> </div> <br></form>';
		            		count++;
	            		}
	            		$("#formRanges").html(html);
	            	}else{
	            		alert("没有设置范围哦！！！");
	            	}
	            }
 			})
 			
	       
 		}
 	</script>
 </Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>