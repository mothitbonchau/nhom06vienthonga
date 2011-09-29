// Addtional function & object to mootools
// by Nguyen Duc Thuy
// Find all element in a form by name.
function $FS(selector, filter){
	var elArr = new Array();
	var form = filter ? $(filter) : false;
	for (var i = 0; i<document.forms.length; i++){
		if (!form || form == document.forms[i]) {
			for (var j = 0; j < document.forms[i].elements.length; j++) {
				if (selector == document.forms[i].elements[j].name) {
					elArr.push(document.forms[i].elements[j]);
				}
			}
		}
	}
	return elArr;
}

// find the first element in a form
function $F(selector, filter){
	return $FS(selector, filter)[0] || false;
}

// init basic mask frame
function getFrames(){
    var opacity = 0.8;
    var frameColor = "#000000";
	var maskIframe = $("maskIframe");
	var docBody = document.body;
	
    // create mask iframe
    if (!maskIframe) {
        maskIframe = new IFrame({
			"id": "maskIframe",
			"src": "javascript:false;",
			"frameBorder": 0,
			"scrolling": "no",
			"styles": {
				"width": Math.max(window.getWidth(), docBody.offsetWidth) + "px",
				"height": Math.max(window.getHeight(), docBody.offsetHeight) + "px",
				"z-index": 990,
				"display": "none",
				"position": "absolute",
				"margin": 0,
				"padding": 0,
				"top": 0,
				"left": 0,
				"opacity": opacity
			}
		}).inject(docBody);
		
		// color mask Iframe
		var doc = maskIframe.contentDocument;
		if (doc == undefined || doc == null) {
			doc = maskIframe.contentWindow.document;
		}
		doc.open();
		doc.write("<html><body bgColor='" + frameColor + "'></body></html>");
		doc.close();
    }
	
	return maskIframe;
};

// show mask function
function showMask(){
	getFrames().set("styles", {
		"display": "block",
		"z-index": 990
	});
};

// hide mask
function hideMask(){
	getFrames().set("styles", {
		"display": "none"
	});
};

// implements
Element.implement({
	isChildOf: function(el) {
		var e = this;
		while (e && typeof(e.getParent) != "undefined" && e.tagName.toLowerCase() != "body") {
			if (e == el) {
				return true;
			}
			e = e.getParent();
		}
		return false;
	},
	
	isVisible: function(){
		var el = this.getParent();
	    while (el) {
	        if (el.getStyle("display") == "none" || el.getStyle("visibility") == "hidden") { return false; }
	        el = el.getParent();
	    }
	    return true;
	},
	
	ieFixLayerShow: function(){
		if (!Browser.Engine.trident4) {
			return;
		}
		var dim = this.getCoordinates();
		if (!this.iframeFx) {
			this.iframeFx = new IFrame({
				"id": this.id+"iframeFx",
				"src": "javascript:false;",
				"frameBorder": 0,
				"scrolling": "no",
				"styles": {
					"border": "0 none",
					"margin": 0,
					"padding": 0,
					"z-index": 998,
					"display": "none",
					"position": "absolute",
					"filter": "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)"
				}
			}).inject(this, "before");
		}
		//
		this.iframeFx.set("styles", {
			"visibility": "visible",
			"display": "block",
			"top": dim.top,
			"left": dim.left,
			"width": dim.width,
			"height": dim.height,
			"z-index": 998
		});
	},
	
	ieFixLayerHide: function(){
		if (!Browser.Engine.trident4) {
			return;
		}
		if (this.iframeFx) {
			this.iframeFx.set("styles", {
				"visibility": "hidden",
				"display": "none"
			});
		}
	},
	
	dragClone: function(){
		return this.clone().setStyles(this.getCoordinates()).setStyles({
			"opacity": 0.7, 
			"position": "absolute"
		}).store("el", this).inject(document.body);
	},
	
	swapClass: function(oldClass, newClass){
		this.removeClass(oldClass).addClass(newClass);
	}
});

// add more function to event
Event.implement({
	getCharCode: function(){
		return (typeof(this.event.charCode) != "undefined") ? this.event.charCode : this.event.keyCode;
	},
	
	getCharKey: function(){
		var code = this.getCharCode();
		return (code == 0) ? "" : String.fromCharCode(code);
	}
});


// String
String.implement({
	quoteStr: function(s1, s2){
		return this.substring(this.indexOf(s1) + s1.length, this.indexOf(s2));
	},
	
	isBlank: function(){
		return (this.trim() == "");
	},
	
	isEmails: function(){
		var re = new RegExp("[;,]");
	    var arr = this.split(re);
	    for (var i = 0; i < arr.length; i++) {
	        if (!arr[i].trim().isEmail()) {
				return false;
			}
	    }
	    return true;
	},
	
	isEmail: function(){
		var re = new RegExp("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]{2,4}$");
		return (this.search(re) != -1);
	},
	
	isImage: function(){
		var re = new RegExp("\\.(png|gif|bmp|jpg|jpeg|jpe)$", "i");
		return (this.search(re) != -1);
	},
	
	isPhone: function(){
		var re = new RegExp("^[ ()-.0-9]{3,}$");
		return (this.search(re) != -1);
	},
	
	isDate: function(format){
		var re = new RegExp("[.\/-]");
	    var arr = this.split(re);
	    if (arr.length != 3) {
			return false;
		}
	    var y = parseInt(arr[format.indexOf("y")]);
	    var m = parseInt(arr[format.indexOf("m")]);
	    var d = parseInt(arr[format.indexOf("d")]);
	    var date = new Date(y, m - 1, d);
	    return (y == date.getFullYear() && m == date.getMonth() + 1 && d == date.getDate());
	},
	
	compareDate: function(format, otherDate){
		var re = new RegExp("[.\/-]");
	    var a1 = this.split(re);
	    var y1 = parseInt(a1[format.indexOf("y")]);
	    var m1 = parseInt(a1[format.indexOf("m")]);
	    var iDate1 = parseInt(a1[format.indexOf("d")]);
	    if (otherDate) {
	        var a2 = otherDate.split(re);
	        var y2 = parseInt(a2[format.indexOf("y")]);
	        var m2 = parseInt(a2[format.indexOf("m")]);
	        var iDate2 = parseInt(a2[format.indexOf("d")]);
	    }
	    else {
	        var otherDateNext = new Date();
	        var y2 = otherDateNext.getFullYear();
	        var m2 = otherDateNext.getMonth() + 1;
	        var iDate2 = otherDateNext.getDate();
	    }
	    //
	    if (y2 > y1) { return 1; }
	    else if (y2 < y1) { return -1; }
	    else {
	        if (m2 > m1) { return 1; }
	        else if (m2 < m1) { return -1; }
	        else {
	            if (iDate2 > iDate1) { return 1; }
	            else if (iDate2 < iDate1) { return -1; }
	            else { return 0; }
	        }
	    }
	},
	
	isCreditCard: function(cardname){
		// Define the cards we support. You may add addtional card types.
	    // Name:      As in the selection box of the form - must be same as user's
	    // Length:    List of possible valid lengths of the card number for the card
	    // prefixes:  List of possible prefixes for the card
	    // checkdigit Boolean to say whether there is a check digit
	    var cards = new Array({
	        name: "Visa",
	        length: "13,16",
	        prefixes: "4",
	        checkdigit: true
	    }, {
	        name: "MasterCard",
	        length: "16",
	        prefixes: "51,52,53,54,55",
	        checkdigit: true
	    }, {
	        name: "DinersClub",
	        length: "14,16",
	        prefixes: "300,301,302,303,304,305,36,38,55",
	        checkdigit: true
	    }, {
	        name: "CarteBlanche",
	        length: "14",
	        prefixes: "300,301,302,303,304,305,36,38",
	        checkdigit: true
	    }, {
	        name: "AmEx",
	        length: "15",
	        prefixes: "34,37",
	        checkdigit: true
	    }, {
	        name: "Discover",
	        length: "16",
	        prefixes: "6011,650",
	        checkdigit: true
	    }, {
	        name: "JCB",
	        length: "15,16",
	        prefixes: "3,1800,2131",
	        checkdigit: true
	    }, {
	        name: "enRoute",
	        length: "15",
	        prefixes: "2014,2149",
	        checkdigit: true
	    }, {
	        name: "Solo",
	        length: "16,18,19",
	        prefixes: "6334, 6767",
	        checkdigit: true
	    }, {
	        name: "Switch",
	        length: "16,18,19",
	        prefixes: "4903,4905,4911,4936,564182,633110,6333,6759",
	        checkdigit: true
	    }, {
	        name: "Maestro",
	        length: "16,18",
	        prefixes: "5020,6",
	        checkdigit: true
	    }, {
	        name: "VisaElectron",
	        length: "16",
	        prefixes: "417500,4917,4913",
	        checkdigit: true
	    });
	    // Establish card type
		var cardnumber = this;
	    var cardType = -1;
	    for (var i = 0; i < cards.length; i++) {
	        // See if it is this card (ignoring the case of the string)
	        if (cardname.toLowerCase() == cards[i].name.toLowerCase()) {
	            cardType = i;
	            break;
	        }
	    }
	    // If card type not found, report an error
	    if (cardType == -1) { return false; }
	    // Ensure that the user has provided a credit card number
	    if (cardnumber.length == 0) { return false; }
	    // Now remove any spaces from the credit card number
	    var re1 = new RegExp("\\s", "g");
	    cardnumber = cardnumber.replace(re1, "");
	    // Check that the number is numeric
	    var cardNo = cardnumber;
	    var cardexp = new RegExp("^[0-9]{13,19}$");
	    if (!cardexp.exec(cardNo)) { return false; }
	    // Now check the modulus 10 check digit - if required
	    if (cards[cardType].checkdigit) {
	        var checksum = 0; // running checksum total
	        var mychar = ""; // next char to process
	        var j = 1; // takes value of 1 or 2
	        // Process each digit one by one starting at the right
	        var calc;
	        for (i = cardNo.length - 1; i >= 0; i--) {
	            // Extract the next digit and multiply by 1 or 2 on alternative digits.
	            calc = Number(cardNo.charAt(i)) * j;
	            // If the result is in two digits add 1 to the checksum total
	            if (calc > 9) {
	                checksum = checksum + 1;
	                calc = calc - 10;
	            }
	            // Add the units element to the checksum total
	            checksum = checksum + calc;
	            // Switch the value of j
	            if (j == 1) {
	                j = 2;
	            }
	            else {
	                j = 1;
	            }
	                        }
	        // All done - if checksum is divisible by 10, it is a valid modulus 10.
	        // If not, report an error.
	        if (checksum % 10 != 0) { return false; }
	    }
	    // The following are the card-specific checks we undertake.
	    var LengthValid = false;
	    var PrefixValid = false;
	    // We use these for holding the valid lengths and prefixes of a card type
	    var prefix = new Array();
	    var lengths = new Array();
	    // Load an array with the valid prefixes for this card
	    prefix = cards[cardType].prefixes.split(",");
	    // Now see if any of them match what we have in the card number
	    for (i = 0; i < prefix.length; i++) {
	        var exp = new RegExp("^" + prefix[i]);
	        if (exp.test(cardNo)) PrefixValid = true;
	    }
	    // If it isn't a valid prefix there's no point at looking at the length
	    if (!PrefixValid) { return false; }
	    // See if the length is valid for this card
	    lengths = cards[cardType].length.split(",");
	    for (j = 0; j < lengths.length; j++) {
	        if (cardNo.length == lengths[j]) LengthValid = true;
	    }
	    // See if all is OK by seeing if the length was valid. We only check the 
	    // length if all else was hunky dory.
	    if (!LengthValid) { return false; };
	    // The credit card is in the required format.
	    return true;
	}
});