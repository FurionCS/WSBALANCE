
function $(id){
	return document.getElementById(id);
}
function changePic(){
	$("ValidatePic").src="HomeServlet/VaildateServlet?"+Math.random();
}
$("btnLogin").onclick=function(){
	var user=$("playerID").value.trim();
	var password=$("password").value.trim();	
	if(user!=""&&user!=null){
		$("spanUser").innerHTML="true";	
		$("spanUser").style.color="#fff";
	}
	else{		
		$("spanUser").innerHTML="����д�˺�";
		$("spanUser").style.color="red";
		return;
	}
	if(password!=""&& password!=null){
		$("spanPassword").innerHTML="true";
		$("spanPassword").style.color="#fff";		
	}
	else{
		$("spanPassword").innerHTML="����д����";
		$("spanPassword").style.color="red";
		return;
	}
//	if(user=="jason"&&password=="123"){
//		location.href="Home.jsp";
//	}
//	else if(user!="jason"){
//		$("spanUser").innerHTML="�û�������";
//		$("spanUser").style.color="red";
//	}
//	else{
//		$("spanPassword").innerHTML="�������";
//		$("spanPassword").style.color="red";
//	}
};