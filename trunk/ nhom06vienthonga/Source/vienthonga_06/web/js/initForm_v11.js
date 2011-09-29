window.addEvent("load", function(){
	initFormContact();
	initFormSearch();
});

function initFormSearch(){
	var frmLogin=$('frmSearch');
	if(!frmLogin)
		return true;
	var slType = $("type");
	slType.addEvent("change",function (){
			slCat = $("brand");
			if(this.value ==1)
			{
				loadCategories(slCat,1);
				slCat.setStyle('display','block');
				
			}else if(this.value ==2)
			{
				loadCategories(slCat,2);
				slCat.setStyle('display','block');
				
			}else if(this.value ==3)
			{
				slCat.setStyle('display','none');
			}		
	});
	var formValidate = [{
		field: "keywords",
		//valid: "required",
		alert: "Vui lòng nhập từ khóa"
	}];
	var formObj = new htmlform(frmLogin, formValidate, {
		alertType: "layer",
		layerWidth: 188,
		hideInterval: 2000,
		onSubmit: function(){
			if($("priceFrom").value == 0 && $("keywords").value=="" && $("brand").value == "0" && $("3g").checked == false && $("wifi").checked == false && $("gps").checked == false && $("touch").checked == false && $("qwerty").checked == false && $("sim").checked == false)
			{
				formObj.showAlertLayerCancel($('keywords'),"Vui lòng nhập từ khóa");
				$("keywords").focus();
			}
			else
			{
				$("option").value = "com_search";
				$("task").value="search";
				frmLogin.submit();
			}
		}
	});
	//fixed warnings in ff
	return true;
	
}
function initFormContact(){
	var frmLogin=$('frmContact');
	var formValidate = [{
		field: "email",
		valid: "email",
		alert: "Vui lòng nhập email"
	}, {
		field: "yourname",
		valid: "required",
		alert: "Vui lòng nhập tên bạn"
	}, {
		field: "phone",
		valid: "required",
		alert: "Vui lòng nhập số điện thoại liên hệ"
	}, {
		field: "subject",
		valid: "required",
		alert: "Vui lòng nhập tiêu đề"
	},{
		field: "request",
		valid: "required",
		alert: "Vui lòng nhập thông tin liên hệ"
	},{
		field: "code",
		valid: "required",
		alert: "Vui lòng nhập mã bảo vệ"
		
	}];
	var formObj = new htmlform(frmLogin, formValidate, {
		alertType: "layer",
		layerWidth: 188,
		hideInterval: 2000,
		onSubmit: function(){
			frmLogin.submit();
		}
	});
	//fixed warnings in ff
	return true;
}
//end ----------