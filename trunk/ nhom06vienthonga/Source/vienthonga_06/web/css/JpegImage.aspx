 var a = new general();
 var obj = new general(); 
function ChangeImageCode() 
{ 
	try { 
		XmlHttp=obj.CreateXmlHttpRequestObject();
			 if(XmlHttp != null) 
			 { 
				 var requestUrl = "../JpegImage.aspx?changed=1" XmlHttp.onreadystatechange =CallBack_ChangeImageCode;
				 XmlHttp.open("GET", requestUrl, true);
				 XmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				 //include this for post or it won't work!!!!
				 XmlHttp.send(null);
			 } 
		} catch(ex) { } 
} 
function CallBack_ChangeImageCode() 
{ 
	var Load=obj.FIND("loading");
	if(XmlHttp.readyState == 1) 
	{ 
		Load.style.display="block";
	} 
	if(XmlHttp.readyState == 4 && XmlHttp.status == 200) 
	{ 
		Load.style.display="none"; 
		var imgCode=obj.FIND("imgCode"); 
		//document.getElementById("response").innerHTML=XmlHttp.responseText; 
		debugger; 
		var img = document.createElement('img');
		img.onload = function (e) 
		{ 
			imgCode.width=this.width; 
			imgCode.height=this.height;
			imgCode.src=this.src; 
		} img.onerror = function(e){ alert("Error processing Image. Please try again.") } img.src = XmlHttp.responseText; //imgCode.innerHTML = unescape(XmlHttp.responseText); //imgCode.innerHTML = decode(XmlHttp.responseText); } }