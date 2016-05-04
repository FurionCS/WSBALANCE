/**
 * 
 * ����һ����ϵ�˵� ����֤
 * ��֤������
 * 	   �Ա�
 *     ����
 *     �ʱ�
 *     ����
 *     �绰
 *     ������ַ
 *     ��ͥ��ַ
 *
 */
   $(document).ready(function () {
        $('#Birthday').datetimepicker({
            minView: "month",
            format: 'yyyy-mm-dd',
            language: 'zh-CN'
        });
    });
function checkEmail(email){
	var check=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	return  check.test(email);
}
function checkPhone(phone){
	return !!phone.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
}
$("#email").onblur=function(){
	if(checkEmail(this.value)){
		$("#spanemail").innerHTML="TRUE";
		$("#spanemail").style.color="#fff";
	}
	else if(this.value.trim()!=""&&!checkEmail(this.value)){
		$("#spanemail").innerHTML="�����ʽ����ȷ";
		$("#spanemail").style.color="red";
	}
	else{
		$("#spanemail").innerHTML="";
	}
};
$("#phone").onblur=function(){
	
	if(checkPhone(this.value)){
		$("#spanphone").innerHTML="TRUE";
		$("#spanphone").style.color="#fff";	
	}
	else if(this.value.trim()!="" &&!checkPhone(this.value)){
		$("#spanphone").innerHTML="�ֻ������ʽ����ȷ";
		$("#spanphone").style.color="red";
	}
	else{
		$("#spanphone").innerHTML="";
	}
};
function sumbitCheck(){
	var user=$("#Name").value.trim();
	var sex=$("#sex").value.trim();
	var email=$("#email").value.trim();
	var phone=$("#phone").value.trim();
	var QQ=$("#QQ").value.trim();
	var workAdress=$("#workAdress").value.trim();
	var HomeAdress=$("#HomeAdress").value.trim();
	var Birthday=$("#Birthday").value.trim();
	var Code=$("#Code").value.trim();
	if(user!=""&&user!=null){
		$("#spanName").innerHTML="true";	
		$("#spanName").style.color="#fff";
	}
	else{		
		$("#spanName").innerHTML="�û�������Ϊ��";
		$("#spanName").style.color="red";
		return false;
	}
	if(email!=""&& email!=null&&checkEmail(email)){
		$("#spanemail").innerHTML='TRUE';
		$("#spanemail").style.color="#fff";
	}
	else if(!checkEmail(email)){	
		$("#spanemail").innerHTML="�����ʽ����ȷ";
		$("#spanemail").style.color="#red";
		return false;
	}
	else{
		$("#spanemail").innerHTML="";
	}
	if(phone!=""&&phone!=null&&checkPhone(phone)){
		$("#spanphone").innerHTML="TRUE";
		$("#spanphone").style.color="#fff";
	}
	else if(!checkPhone(phone)){
		$("#spanphone").innerHTML="�绰��ʽ����ȷ";
		$("#spanphone").style.color="#red";
		return false;
	}
	else{
		$("#spanPhone").innerHTML="";
	}
	Clear();
	return true;
	
};
//���
function Clear() {
	$(':input','#myform') 
	.not(':button, :submit, :reset, :hidden') 
	.val('') 
	.removeAttr('checked') 
	.removeAttr('selected');
};