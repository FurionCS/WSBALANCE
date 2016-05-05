
function $(id){
	return document.getElementById(id);
}
$("btnLogin").onclick=function(){
	var user=$("playerID").value.trim();
	var password=$("password").value.trim();	
	if(user!=""&&user!=null){
		$("spanUser").innerHTML="true";	
		$("spanUser").style.color="#fff";
	}
	else{		
		$("spanUser").innerHTML="ÇëÌîĞ´ÕËºÅ";
		$("spanUser").style.color="red";
		return;
	}
	if(password!=""&& password!=null){
		$("spanPassword").innerHTML="true";
		$("spanPassword").style.color="#fff";		
	}
	else{
		$("spanPassword").innerHTML="ÇëÌîĞ´ÃÜÂë";
		$("spanPassword").style.color="red";
		return;
	}
};