<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
增加代理
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
                        <div class="control-group">
                            <label class="control-label">*姓名</label>
                            <div class="controls">
                                <input type="text" id="agname" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理姓名" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAgname"></span>
                            </div>
                        </div>
                         <div class="control-group">
                            <label class="control-label">*微信号</label>
                            <div class="controls">
                                <input type="text" id="agwxnum" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理微信号" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAgwxnum"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">*身份证</label>
                            <div class="controls">
                                <input type="text" id="agidcard" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理身份证" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAgidcard"></span>
                            </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">*电话&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="agtel" id="agtel" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理电话" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAgtel"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">密码</label>
                            <div class="controls">
                                <input type="password" name="agpassword" id="agpassword" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理初始密码" data-input="text" data-maxlength="250" required value="123456" />
                                <span style="color: red;" id="spanAgpassword"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">上家微信号</label>
                            <div class="controls">
                                <input type="text" name="agpwxnum" id="agpwxnum" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理上家" data-input="text" data-maxlength="250" required />
                                <input type="text" id="agpid" style="display: none"/>
                                <span style="color: red;" id="spanAgpwxnum"></span>
                            </div>
                        </div>
                         <div class="control-group">
                            <label class="control-label">*等级&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="aglevel" id="aglevel" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理等级" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanAglevel"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">*授权号&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="agauthorization" id="agauthorization" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写代理授权号" data-input="text" data-maxlength="250" required />
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
    </div>
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
			$("#agwxnum").keyup(function (e) {
			    if (checkwx(this.value)) {
			        $("#spanAgwxnum").html("");
			    }
			    else $("#spanAgwxnum").html("请输入正确的微信号");
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
			$("#agpwxnum").blur(function (e) {
			    checkPwxnum(this.value);
			});
			function checkPwxnum(agpwxnum){
				
				var flag=false;
				 $.ajax({
			            url: "AgentAction_getAgentByAgwxnum",
			            type: "POST",
			            data: {"agent.agwxnum":agpwxnum},
			            dataType: "json",
			            success: function (result) {
			            	if(result.code==1){
			            		var agent=result.agent;
			            		$("#agpid").val(agent.agid);
			            		 $("#spanAgpwxnum").html("");
			            		flag=true;
			            	}else{
			            		$("#agpid").val("");
			            		$("#spanAgpwxnum").html("请输入存在的上家");
			            	}
			            }
				 });
				 return flag;
			}
			function SaveForm() {
				var agname=$("#agname").val().trim();
				 if (checkCName(agname)) { $("#spanAgname").html("");}
				 else{$("#spanAgname").html("请输入中文名,在2-4个字间");return false;}
				var agwxnum=$("#agwxnum").val().trim();
				 if (checkwx(agwxnum)) {$("#spanAgwxnum").html("");}
				 else{ $("#spanAgwxnum").html("请输入正确的微信号");return false;};
				var agidcard=$("#agidcard").val().trim();
				var text;
				 if (agidcard =="") {$("#spanAgidcard").html("请输入身份证号");return false;}
				 else if ( (text=checkIdcard(agidcard))!= true) {$("#spanAgidcard").html(text);return false;}
				 else { $("#spanAgidcard").html("");}
				var agtel=$("#agtel").val().trim();
				 if (checkMobile(agtel)) {$("#spanAgtel").html("");}
				 else{ $("#spanAgtel").html("请输入正确的手机号");return false;};
				var agpassword=$("#agpassword").val().trim();
				 if(agpassword==""){agpassword="123456";};
				var agpid=$("#agpid").val().trim();
				var aglevel=$("#aglevel").val().trim();
				 if (chekcLevel(aglevel)) { $("#spanAglevel").html("");}
				 else{ $("#spanAglevel").html("请输入0以上的正整数");return false;};
				var agauthorization=$("#agauthorization").val().trim();
				 if(agauthorization==""){$("#spanAgauthorization").html("请填写授权码");return false;}
		        $.ajax({
		            url: "AgentAction_addAgent",
		            type: "POST",
		            data: {"agent.agname": agname,"agent.agwxnum": agwxnum,"agent.agidcard": agidcard,"agent.agtel": agtel,"agent.agpassword": agpassword,"agent.aglevel": aglevel,"agent.agpid": agpid,"agent.agauthorization": agauthorization},
		            dataType: "json",
		            success: function (result) {
		            	if (result.code == 1) {
		                     noty({ text: "添加成功！", type: "success", layout: "topCenter", timeout: 3000 }); $("#InfoForm")[0].reset();
		                     setTimeout(function () { location.href = "Agent/AgentTree.jsp?active=menupage6_1" }, 1000);
		                 }
		                 else {
		                     noty({ text: "添加失败，请重新操作！", type: "warning", layout: "topCenter", timeout: 3000 });
		                 }
		               },
		             error: function () {
		                 console.log("error");
			        }
		        })
			
			}
			
			//清空
		    function Clear() {
		        $("#InfoForm")[0].reset();
		        $("#preview").addClass("hide");
		        $("#InfoForm").find(":input:first").focus();
		        $(".spans").html();
		    }
	</script>
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>