// JavaScript Document
function _initTag() {
	var tag = $$('._tabs');
	if(!tag[0]) return true;
	var arrLi = tag[0].getElements('li');
	var arrDiv = $$('._info');
	arrLi.each(function(el , index){
		el.addEvent('click' , function(el){
			el.stop();
			arrLi[index].addClass('_selected');
			arrDiv[index].setStyle('display','block');
			for(var i = 0 ; i<arrLi.length ; i++){
				if(i != index ){
					arrLi[i].removeClass('_selected');
					arrDiv[i].setStyle('display','none');
				}
			}
		});
	});
}

function _initNewsDetail() {
	var tag = $$('._news');
	if(!tag[0]) return true;
	var arrLi = tag[0].getElements('li');
	var arrDiv = $$('._news_detail');
	arrLi.each(function(el , index){
		el.addEvent('click' , function(el){
			el.stop();
			arrLi[index].addClass('_selected');
			arrDiv[index].setStyle('display','block');
			for(var i = 0 ; i<arrLi.length ; i++){
				if(i != index ){
					arrLi[i].removeClass('_selected');
					arrDiv[i].setStyle('display','none');
				}
			}
		});
	});
}

function _initNewsDetail_() {
	var tag = $$('._news_');
	if(!tag[0]) return true;
	var arrLi = tag[0].getElements('li');
	var arrDiv = $$('._news_detail_');
	arrLi.each(function(el , index){
		el.addEvent('click' , function(el){
			el.stop();
			arrLi[index].addClass('_selected');
			arrDiv[index].setStyle('display','block');
			for(var i = 0 ; i<arrLi.length ; i++){
				if(i != index ){
					arrLi[i].removeClass('_selected');
					arrDiv[i].setStyle('display','none');
				}
			}
		});
	});
}

