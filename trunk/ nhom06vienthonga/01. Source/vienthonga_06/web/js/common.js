window.addEvent("load", function(){
	initSlide('div.blocList' ,'li' , 0);
	initSlide('div.blocListLast' , 'div' , 3);
	initTag();
	showImageForLayer();
});
function initTag() {
	var tag = $$('.tabs');
	if(!tag[0]) return true;
	var arrLi = tag[0].getElements('li');
	var arrDiv = $$('.saleOff');
	arrLi.each(function(el , index){
		el.addEvent('click' , function(el){
			el.stop();
			arrLi[index].addClass('selected');
			arrDiv[index].addClass('active');
			for(var i = 0 ; i<arrLi.length ; i++){
				if(i != index ){
					arrLi[i].removeClass('selected');
					arrDiv[i].removeClass('active');
				}
			}
		});
	});
}
function initSlide(el, target , number) {
	var div = $$(el);
	if(!div[0]) return true;
	var ul = div[0].getElements('ul')[0];
	var lis = ul.getElements(target);
	var scrollIndex = 0;
	var totalWidth = 0;
	lis.each(function(el) {
		totalWidth += el.getCoordinates().width+2;
	});
	ul.set("styles", {"width": totalWidth});
	var scrollFx = new Fx.Scroll(ul.getParent());
	scrollFx.set(0, 0);
	var totalLis = lis.length-number;
	
	var btnBack = div[0].getElements('p')[0];
	var btnNext = div[0].getElements('p')[1];
	
	if(scrollIndex == 0) {
		btnBack.setStyle('opacity','0.4');
	}
	var intervalID;
	var flag = true;
	btnBack.addEvent('click',function(event) {
		new Event(event).stop();
		if(scrollIndex != 0) {
			scrollIndex--;
			flag =false;
			btnNext.setStyle('opacity','1');
			scrollFx.cancel().toElement(lis[scrollIndex]);
			setTimeout(function() {
				intervalID = $clear(intervalID);
				intervalID = myFunction.periodical(3000);
			},3000);
		}	
		if(scrollIndex == 0) {
			btnBack.setStyle('opacity','0.4');
		}
	});	
	btnNext.addEvent('click' , function(event) {
		new Event(event).stop();
		if(scrollIndex != totalLis-1) {
			scrollIndex++;
			flag=true;
			btnBack.setStyle('opacity','1');
			scrollFx.cancel().toElement(lis[scrollIndex]);
			setTimeout(function(){
				intervalID = $clear(intervalID);
				intervalID = myFunction.periodical(3000);
			},3000);
		}
		if(scrollIndex == totalLis-1) {
			btnNext.setStyle('opacity','0.4');
		}
	});
	var myFunction = function() {
		if(flag) {
			if(scrollIndex != totalLis-1) {
				scrollIndex++;
				btnBack.setStyle('opacity','1');
				scrollFx.cancel().toElement(lis[scrollIndex]);
			} else {
				flag = false;
			}
		}else{
			if(scrollIndex != 0) {
				scrollIndex--;
				btnBack.setStyle('opacity','1');
				scrollFx.cancel().toElement(lis[scrollIndex]);
			} else {
				flag = true;
			}
		}	
	}
	intervalID = myFunction.periodical(3000);
}
function setMask(opaceTo){
	try {
		var mask = $("mask") || 
		new Element("iframe").setProperties({
			id: "mask",
			frameborder: 'no'
		}).setStyles({
			width: "100%", 
			height: window.getScrollHeight(), 
			position: "absolute",
			top: "0", 
			left: "0",
			zIndex:998
		}).injectBefore($$(".popup", ".layerNews")[0]);
		mask.setOpacity(0.5);
		
	} catch (e) {}
}
function opaceIt(thisObj, opaceTo) {
	if (!thisObj) return;
	if (opaceIt.mask == null){
		opaceIt.mask = new Element("iframe").setProperties({
			frameborder: "no"
		}).setStyles({
			filter:'alpha(opacity=0)',
			overflow: "hidden",
			position: "absolute",
			top: "0", 
			left: "0",
			"z-index": "998"
		});
		opaceIt.div = new Element("div").setStyles({
			backgroundColor:"#FCFCFC", 
			overflow: "hidden",
			position: "absolute", 
			top: "0", 
			left: "0",
			"z-index": "998"
		}).setOpacity(0.8);
	}
	if (opaceTo != 0) {
		opaceIt.mask.injectInside($$('body')[0]);
		opaceIt.div.injectInside($$('body')[0]);		
		thisObj.injectInside($$('body')[0]);
		adjustPosition(thisObj);
		thisObj.setOpacity(0);
	}
	var myEffects = new Fx.Style(thisObj, "opacity", {
		duration:600, 
		onComplete: onCompleteHandler
	});
	myEffects.start(opaceTo);
	function onCompleteHandler() {
		if (opaceTo == 0) {
			try {
				opaceIt.mask.remove();
				opaceIt.div.remove();
				thisObj.setStyle('top', -1500);
			} catch (e) {};
		}
	}
	function adjustPosition(thisObj){
		thisObj.setStyles({
			display:'block',
			top: window.getScrollTop() + 90,
			left: (window.getWidth()-thisObj.getCoordinates().width)/2,
			zIndex: 999
		});
		if(Browser.Engine.trident){
			opaceIt.mask.setStyles({
				width: window.getWidth(), 
				height: window.getScrollHeight()
			});
		}
		opaceIt.div.setStyles({
			width: window.getWidth(), 
			height: window.getScrollHeight()
		});
	}
}
function showImageForLayer(){
	var layerReject = $('layerReject');
	if(!layerReject) return;
	var content = $$('.content')[0];
	var arrA = content.getElements('a');
	var imgContent = content.getElements('img')[0];
	var click = false;
	arrA.each(function(el , index){
		el.addEvent('click' , function(e){
			e.stop();
			var srcImg = el.getElements('img')[0].getProperty('src');
			click = false;
			var myEffects = new Fx.Style(imgContent, "opacity", {duration:300,
				onComplete: onCompleteHandler
			});
			myEffects.start(0.5);
			function onCompleteHandler(){
				if(click) return;
				imgContent.setProperty('src' , srcImg);
				myEffects.start(1);
				click = true;
			}
		})
	});
	
}