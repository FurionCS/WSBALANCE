<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="import">
<%@ taglib prefix="s" uri="/struts-tags" %>
</Layout:overwrite>

<Layout:overwrite name="title">
编辑代理
</Layout:overwrite>
<%-- <Layout:overwrite name="Mycss"></Layout:overwrite> --%>

<Layout:overwrite name="MyContent">
<div class="row-fluid">
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
                    <a href="javascript:void(0)">代理增加</a></i>
                </li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
<div class="row-fluid">
        <div class="span12">
            <div class="portlet box green">
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
                    <form action="#" id="InfoForm" class="form-horizontal" novalidate="novalidate">
                    	<input value='<s:property value="#session.agent.agid" />' id="agid" style="display:none">
                        <div class="control-group">
                            <label class="control-label">*姓名</label>
                            <div class="controls">
                                <input type="text" id="agname" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理姓名" data-input="text" data-maxlength="250" value='<s:property value="#session.agent.agname" />' required />
                                <span style="color: red;" id="spanAgname"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">*身份证</label>
                            <div class="controls">
                                <input type="text" id="agidcard" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理身份证"   value='<s:property value="#session.agent.agidcard" />' data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAgidcard"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">*电话&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="agtel" id="agtel" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理电话" value='<s:property value="#session.agent.agtel" />' data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAgtel"></span>
                            </div>
                        </div>
                         <div class="control-group">
                            <label class="control-label">*等级&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="aglevel" id="aglevel" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理等级" value='<s:property value="#session.agent.aglevel" />' data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAglevel"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">*状态</label>
                            <div class="controls">
                            	<s:if test="0==#session.agent.agstatus">
                             		<input type="radio" name="status" id="status1" class="span6 m-wrap popovers" value="0" checked="checked" required /><span style="position:relative;top:4px;">离开</span>
                             		<input type="radio" name="status" id="status2" class="span6 m-wrap popovers" value="1"  required /><span  style="position:relative;top:4px;">代理中</span>
                                </s:if>
                                <s:else>
                                	<input type="radio" name="status" id="status1" class="span6 m-wrap popovers" value="0"  required /><span style="position:relative;top:4px;">离开</span>
                                	<input type="radio" name="status" id="status2" class="span6 m-wrap popovers" value="1" checked="checked" required /><span  style="position:relative;top:4px;">代理中</span>
                                </s:else>
                                <span style="color: red;" id="spanAgstatus"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">*授权号&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="agauthorization" id="agauthorization" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理授权号" value='<s:property value="#session.agent.agauthorization" />' data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAgauthorization"></span>
                            </div>
                        </div>
                        <div class="form-actions">
                            <a type="submit" class="btn green" href="javascript:void(0);" onclick="saveEdit();">保存</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <s:debug></s:debug>
</Layout:overwrite>
<Layout:overwrite name="MyScript">
<script type="text/javascript" src="Js/Check.js"></script>
<script>
		$("#agname").keyup(function (e) {
		    if (checkCName(this.value)) {
		        $("#spanAgname").html("");
		    }
		    else $("#spanAgname").html("请输入中文名,在2-4个字间");
		});
		$("#agidcard").keyup(function (e) {
		    var text = "";
		    if (this.value =="") {
		        $("#spanAgidcard").html("请输入身份证号");
		    }
		    else if ( (text=checkIdcard(this.value))!= true) {
		        $("#spanAgidcard").html(text);
		    }
		    else {
		        $("#spanAgidcard").html("");
		    }
		});
		$("#agtel").keyup(function (e) {
		    if (checkMobile(this.value)) {
		        $("#spanAgtel").html("");
		    }
		    else $("#spanAgtel").html("请输入正确的手机号");
		});
		
		$("#aglevel").keyup(function (e) {
		    if (chekcLevel(this.value)) {
		        $("#spanAglevel").html("");
		    }
		    else $("#spanAglevel").html("请输入0以上的正整数");
		});
		$("#agauthorization").keyup(function (e) {
		    if (!this.value=="") {
		        $("#spanAgauthorization").html("");
		    }
		    else $("#spanAgauthorization").html("请输入代理授权码");
		});
	 function saveEdit() {
		 var agid=$("#agid").val().trim();
		 var agname=$("#agname").val().trim();
		 if (checkCName(agname)) { $("#spanAgname").html("");}
		 else{$("#spanAgname").html("请输入中文名,在2-4个字间");return false;}
		var agidcard=$("#agidcard").val().trim();
		var text;
		 if (agidcard =="") {$("#spanAgidcard").html("请输入身份证号");return false;}
		 else if ( (text=checkIdcard(agidcard))!= true) {$("#spanAgidcard").html(text);return false;}
		 else { $("#spanAgidcard").html("");}
		var agtel=$("#agtel").val().trim();
		 if (checkMobile(agtel)) {$("#spanAgtel").html("");}
		 else{ $("#spanAgtel").html("请输入正确的手机号");return false;};
		 var aglevel=$("#aglevel").val().trim();
		 if (chekcLevel(aglevel)) { $("#spanAglevel").html("");}
		 else{ $("#spanAglevel").html("请输入0以上的正整数");return false;};
		var agauthorization=$("#agauthorization").val().trim();
		 if(agauthorization==""){$("#spanAgauthorization").html("请填写授权码");return false;}
		 var status= $('input[name="status"]:checked ').val();
        $.ajax({
            url: "AgentAction_changeAgent",
            type: "POST",
            data: {"agent.agid":agid,"agent.agname": agname,"agent.agidcard": agidcard,"agent.agtel": agtel,"agent.aglevel": aglevel,"agent.agauthorization": agauthorization,"agent.agstatus":status},
            dataType: "json",
            success: function (result) {
            	if (result.code == 1) {
                     noty({ text: "修改成功！", type: "success", layout: "topCenter", timeout: 3000 }); $("#InfoForm")[0].reset();
                     setTimeout(function () { location.href = "Agent/AgentList.jsp?active=menupage6_1" }, 1000);
                 }
                 else {
                     noty({ text: "修改失败，请重新操作！", type: "warning", layout: "topCenter", timeout: 3000 });
                 }
               },
             error: function () {
                 console.log("error");
	        }
        })
	 }
</script>          
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>