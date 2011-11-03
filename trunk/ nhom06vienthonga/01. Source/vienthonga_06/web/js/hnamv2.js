// JavaScript Document
window.addEvent("load", function(){
	//initFormCompare();
	initAccesoriesLink();
});
function compare()
{
	$('formcompare').submit();
}
function initFormCompare()
{
    var frmLogin=$('formcompare');
    if(!frmLogin)
        return true;
    for(k=1;k<=3;k++)
    {
        var slCat = $("cid"+k);
        slCat.addEvent("change",function (){
			loadProductByCat(slCat.value,"pid"+k);       
        });      
    }
}
function loadProductByCat(cid,pid)
{
    var request = new Request({
        url: "index.php?option=com_product&task=loadbycat&cid="+cid+"", //url of the page
        method: 'get', //method get or post
        headers: {'X-Request': 'JSON'},
        onSuccess: function(responseText, responseXML){
            //load success
            removeOption($(pid));
            var data = responseText;
            var jsondata = eval(data);
            for(i=0;i<jsondata.length;i++)
            {
                addOption(select,jsondata[i].id,jsondata[i].name);
            }
        },
        onFailure:function(instance){
        //load return fasle
        }
    });    
    request.send();
}
function initAccesoriesLink()
{
	var accesories = $("accesories");
	var items = $$(".lchild");
	items.each(function(item){
		item.style.display = "none";
	});
	//accesories.addEvent("click",function(){
		/*var display = "";
		if(this.className=="noactive")
		{
			this.className="active";
			display = "block";
		}
		else
		{
			this.className="noactive";
			display = "none";
		}
		var items = $$(".lchild");
		items.each(function(item){
		item.style.display = display;
		
		});*/
		
	//}); 
}
function removeOption(sl)
{
	for(i=sl.length -1;i>0;i--)
		sl.remove(i);
}
function addOption(sl,value,text)
{
	var elOptNew = document.createElement('option');
	elOptNew.text = text;
	elOptNew.value = value;
	try {
		sl.add(elOptNew, null); // standards compliant; doesn't work in IE
	}
	catch(ex) {
		
		sl.add(elOptNew); // IE only
	}
}
function loadCategories(select,type)
{
	var request = new Request({
					url: "index.php?option=com_search&task=loadcategories&type="+type+"", //url of the page
					method: 'get', //method get or post
					headers: {'X-Request': 'JSON'},
					onSuccess: function(responseText, responseXML){
						//load success
						removeOption(select);
						var data = responseText;
						var jsondata = eval(data);
						for(i=0;i<jsondata.length;i++)
						{
							addOption(select,jsondata[i].id,jsondata[i].name);
						}
					},
					onFailure:function(instance){
					//load return fasle
					}
				});	
	request.send();
}
function vote(id,pos)
{
    var opt = document.getElementsByName(pos + "voteid");
	var checked = null;
	for(i=0; i<opt.length; i++)
	{
		if(opt[i].checked==true)
		{
			checked = opt[i].value;
		}
	}
	if(checked == null)
	{
		alert("Vui lòng lựa chọn bình chọn");
        return false;
	}
	var request = new Request({
					url: "index.php?option=com_poll&task=vote", //url of the page
					method: 'post', //method get or post
					headers: {'X-Request': 'JSON'},
					data : {"id":id,"voteid":checked},
					onSuccess: function(responseText, responseXML){
						//load success
						var data = responseText;
						if(data !="true")
							alert(data);
						else
							viewVote(id);
					},
					onFailure:function(instance){
					//load return fasle
					}
				});	
	request.send();
    
}
function viewVote(id)
{
	var request = new Request({
					url: "index.php", //url of the page
					method: 'post', //method get or post
					headers: {'X-Request': 'JSON'},
					data : {"option":"com_poll","id":id},
					onSuccess: function(responseText, responseXML){
						//load success
						var data = responseText;
						$("layerVote").innerHTML = data;
						opaceIt($('layerVote'),1);
					},
					onFailure:function(instance){
					//load return fasle
					}
				});	
	request.send();
}