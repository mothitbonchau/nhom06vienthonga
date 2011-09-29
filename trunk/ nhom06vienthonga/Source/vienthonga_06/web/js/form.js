// FORM CLASS VALIDATION
var htmlform = new Class({
	options: {
		alertType: "layer",
		layerWidth: 200,
		layerOffset: "0, 0",
		fadeContent: false,
		hideInterval: 3000,
		
		// variables
		waitInterval: Class.empty,
		errorElement: Class.empty,
		alertLayer:Class.empty,
		
		// events
		onAlertShow: Class.empty,
		onAlertHide: Class.empty,
		onAfterChange: Class.empty,
		onSubmit: Class.empty
	},

	initialize: function(form, data, options){
		var frm = $(form);
		if (!frm) {
			return;
		}
		
		// set options
		this.setOptions(options);
		if (options.onSubmit) {
			this.options.onSubmit = options.onSubmit;
		}
		
		// call functions
		this.initLayer(frm);
		this.initForm(frm, data);
	},
	
	initLayer: function(form){
		var fn = this;
		var layerName = form.id || form.name || "alert";
		
		// check & create for alert layer
		this.options.alertLayer = new Element("div", {
			"id": layerName+"Layer",
			"class": "alertLayer"
		}).inject(document.body);
		
		//
		var closeBtn = new Element("a", {
			"href": "javascript:;",
			"html": "x",
			"events": {
				"click": function(e){
					fn.hideAlertLayer();
				}
			}
		}).inject(this.options.alertLayer);
		
		var display = new Element("p").inject(this.options.alertLayer);
	},
	
	initForm: function(form, data){
		var fn = this;

	    for (var i = 0; i < data.length; i++) {
	        // init elements
	        for (var j = 0; j < form.elements.length; j++) {
	            var el = $(form.elements[j]);
	            if (el.name == data[i].field) {
	                this.initElement(el, data[i]);
	            }
	        }
	    }
	    
	    // valid form on submit
	    form.addEvent("submit", function(e){
			if (!fn.isValidForm(form)) {
				e.stop();
			} else {
				// call back
				if ($type(fn.options.onSubmit) != false) {
					e.stop();
					fn.fireEvent("onSubmit");
				}
			}
	    });
		
		// add reset buttons
		var resetBtn = form.getElement("input.reset");
		if (resetBtn) {
			resetBtn.addEvent("click", function(e){
				e.stop();
				fn.hideAlertLayer();
				fn.resetForm(form);
			});
		}
	},
	
	initElement: function(el, data){
		var fn = this;
		
	    // add new properties
		el.store("data", data);
		el.store("validated", true);
		
	    // init options
	    if (typeof(data.init) != "undefined") {
	    
	        // if the input has its initialized value
			if (el.type == "text" || el.type == "textarea" || el.type == "password") {
				if(el.value.trim()==""){
					el.value = data.init;
					}
					el.addEvents({
						"focus": function(){
			                if (this.value == this.retrieve("data").init) {
			                    this.value = "";
			                }
						},
						"blur": function(){
			                if (this.value.trim() == "") {
			                    this.value = this.retrieve("data").init;
			                }
			            }
					});
				
			}
			
			if (el.type == "select-one" || el.type == "select-multiple") {
				el.selectedIndex = Number(data.init);
			}
			
			if (el.type == "radio") {
				el.form[el.name][Number(data.init)].checked = true;
			}
	    }
		
		// apply maxlength to textarea
		if (typeof(data.maxLength) != "undefined" && (el.type == "textarea" || el.type == "text" || el.type == "password")) {
			// maximum input characters
			if (el.type == "textarea"){
				el.addEvent("keypress", function(e){
		            var evt = new Event(e);
		            var code = evt.getCharCode();
		            if (this.value.length >= this.retrieve("data").maxLength && code != 0) { evt.stop(); }
		        });
			} else {
				el.maxLength = data.maxLength;
			}
		}
	    
		// restrict input characters
	    if (typeof(data.restrict) != "undefined" && (el.type == "textarea" || el.type == "text" || el.type == "password")) { 
			el.addEvent("keypress", function(e){
	            var evt = new Event(e);
				var key = evt.getCharKey();
	            var re = new RegExp(this.retrieve("data").restrict);
	            if (key != "" && !re.test(key)) { evt.stop(); }
	        });
	    }
		
		// hide alert & execute call back functions
		el.addEvents({
			"click": function(e){
				this.store("validated", fn.validFormElement(this));
				fn.onAfterChange(this);
				fn.hideAlertLayer();
			},
			"keyup": function(e){
				this.store("validated", fn.validFormElement(this));
				fn.onAfterChange(this);
				fn.hideAlertLayer();
			},
			"change": function(e){
				this.store("validated", fn.validFormElement(this));
				fn.onAfterChange(this);
				fn.hideAlertLayer();
			}
		});
		
		// add events
		if (data.events) {
			el.addEvents(data.events);
		}
	},
	
	resetForm: function(form){
		form.reset();
	},
	
	isValidForm: function (form){
	    for (var i = 0; i < form.elements.length; i++) {
			var isValid = this.validFormElement(form.elements[i]);
			$(form.elements[i]).store("validated", isValid);
	        if (!isValid) {
	            this.showAlertLayer(form.elements[i]);
	            return false;
	        }
	    }
	    return true;
	},
	
	validFormElement: function(el){
		var fn = this;
		var data = el.retrieve("data");
		var value = el.value ? el.value.trim() : "";
		
		// if not valid
		if ($type(data) == false) {
			return true;
		}
		
		// valid types
	    switch (typeof(data.valid)) {
	        case "function":
	            return data.valid();
	            break;
	            
	        case "string":
	            var validTag = data.valid.trim();
				var optionPass = (validTag.indexOf("[") != -1 && validTag.indexOf("]") != -1 && (el.value.isBlank() || (data.init && value == data.init)));
				
	            // no valid needed
	            if (typeof(data.valid) == "undefined" || data.valid == null || validTag == "" || validTag == "none") {
								return true;
							}
	            
	            // compare to other input's value
	            if (validTag.indexOf("=") != -1 && validTag.indexOf(">") == -1 && validTag.indexOf("<") == -1) {
	                if (el.type == "text" || el.type == "password") {
	                    var target = $F(validTag.replace("=", ""), el.form);
	                    return !target || value == target.value.trim();
	                }
	                
	                // other type
	                return true;
	            }
	            if (validTag.indexOf(">") != -1) {
	                if (el.type == "text" || el.type == "password") {
	                    var target = $F(validTag.replace("=", ""), el.form);
	                    if (validTag.indexOf("=") != -1) { return !target || Number(value) >= Number(target.value.trim()); }
	                    else { return !target || Number(value) > Number(target.value.trim()); }
	                }
	                
	                // other type
	                return true;
	            }
	            if (validTag.indexOf("<") != -1) {
	                if (el.type == "text" || el.type == "password") {
	                    var target = $(validTag.replace("=", ""));
	                    if (validTag.indexOf("=") != -1) { return !target || Number(value) <= Number(target.value.trim()); }
	                    else { return !target || Number(value) < Number(target.value.trim()); }
	                }
	                
	                // other type
	                return true;
	            }
	            
	            // required value
	            if (validTag.indexOf("required") != -1) {
								if (el.type != "text" && el.type != "textarea" && el.type != "password" && el.type != "file") {
									return true;
								}
								if (!data.init || data.init == "") {
									return value.length >= Math.max(Number(validTag.quoteStr("(", ")")), 1);
								} else {
									return value.length >= Math.max(Number(validTag.quoteStr("(", ")")), 1) && value != data.init;
								}	
	                
	                // other type
	                return true;
	            }
	            
	            // range value
	            if (validTag.indexOf("range") != -1) {
	                if (el.type == "text") {
	                    var range = validTag.quoteStr("(", ")").trim().split(";");
						if (range[0].trim() == "" && range[1].trim() == "") return true;
						if (range[0].trim() == "") return Number(value) <= Number(range[1].trim());
						if (range[1].trim() == "") return Number(value) >= Number(range[0].trim());
	                    return Number(value) >= Number(range[0].trim()) && Number(value) <= Number(range[1].trim());
	                }
	                
	                // other type
	                return true;
	            }
	            
	            // email value
	            if (validTag.indexOf("email") != -1) {
	            
	                if (el.type == "text" || el.type == "textarea") {
	                
	                    // if optional input & value is null or value = init value
	                    if (optionPass) {
							return true;
						}
	                    
	                    // validate email(s)
						if (validTag.indexOf("emails") != -1) {
							return value.isEmails();
						}
						return value.isEmail();
	                }
	                
	                // other type
	                return true;
	            }
	            
	            // phone value
	            if (validTag.indexOf("date") != -1) {
	            
	                if (el.type == "text") {
	                	
						var fmt = validTag.trim().quoteStr("(", ")");
						
	                    // if optional input & value is null or value = init value
	                    if (optionPass) {
							return true;
						}
	                    
	                    // validate phone
	                    return value.isDate(fmt);
	                }
	                
	                // other type
	                return true;
	            }
				
				// phone value
	            if (validTag.indexOf("phone") != -1) {
	            
	                if (el.type == "text") {
	                
	                    // if optional input & value is null or value = init value
	                    if (optionPass) {
							return true;
						}
						
	                    // validate phone
	                    return value.isPhone();
	                }
	                
	                // other type
	                return true;
	            }
	            
	            // image value
	            if (validTag.indexOf("image") != -1) {
	            
	                if (el.type == "text" || el.type == "file") {
	                
	                    // if optional input & value is null or value = init value
	                    if (optionPass) {
							return true;
						}
						
	                    // validate image
	                    return value.isImage();
	                }
	                
	                // other type
	                return true;
	            }
	            
	            // "future" compare date
	            if (validTag.indexOf("future") !== -1) {
            
	                if (el.type == "text") {

	                    // if optional input & value is null or value = init value
	                    if (optionPass) {
												return true;
											}
											
						                    var range = validTag.quoteStr("(", ")").split(",");
						                    if (range.length == 0) {
												return true;
											}
											
						                    if (!value.isDate(range[0].trim()) || (range[1] && $F(range[1].trim(), el.form) && !$F(range[1].trim(), el.form).value.trim().isDate(range[0].trim()))) {
												return false;
											}
						                    if (range[1] && $F(range[1].trim(), el.form)) {
												return (value.compareDate(range[0].trim(), $F(range[1].trim(), el.form).value.trim()) == -1);
											} else {
												return (value.compareDate(range[0].trim()) == -1);
											}
	                }
	                
	                // other type
	                return true;
	            }
	            
	            // "checked" for checkbox & radio button
	            if (validTag == "checked") {
	            
	                if (el.type == "checkbox") { 
											var checkGroup = el.form[el.name];
											
											if(checkGroup && !checkGroup.length) { return checkGroup.checked; }
											
											//more than 1 check box
											for(var i=0; i<checkGroup.length; i++){
												if(checkGroup[i].checked) { return true; }
											}
											return false; 									
									}
	                
	                if (el.type == "radio") {
	                    var radioGroup = el.form[el.name];
	                    
	                    // contain 1 radio button
	                    if (radioGroup && !radioGroup.length) { return radioGroup.checked; }
	                    
	                    // more than 1 radio button
	                    for (var i = 0; i < radioGroup.length; i++) {
	                        if (radioGroup[i].checked) { return true; }
	                    }
	                    return false;
	                }
	                
	                // other type
	                return true;
	            }
	            
	            // "selected" for combo box
	            if (validTag == "selected") {
					if(el.hasClass('noActive')) return true;
	                if (el.type == "select-one" || el.type == "select-multiple") {
	                    if (typeof(el.retrieve("data").init) != "undefined") { return el.selectedIndex != Number(el.retrieve("data").init); }
	                    else { return el.selectedIndex != 0; }
	                }
	                
	                // other type
	                return true;
	            }
	            
	            return true;
	            break;
	            
	        default:
	            return true;
	            break;
	    }
		//fixed warnings in ff
		return true;
	},
	showAlertLayer: function(el, msg){
	    try {
	        var fn = this;
			var form = el.form;
			var data = el.retrieve("data");
			var alertLyr = this.options.alertLayer;
	        this.options.errorElement = el;
			// call back functions
			this.onAlertShow(el);
	        // display alert message.
			if (msg) {
				alertLyr.getElement("p").set("html", msg);
			} else {
				alertLyr.getElement("p").set("html", data.alert);
			}
	        // show alert
			var alertType = data.alertType || this.options.alertType;
		    var offset = data.layerOffset ? data.layerOffset.split(",") : ["0", "0"];
			var lyrW = data.layerWidth || this.options.layerWidth;
			
			switch (alertType) {
	            case "layer":
					var coords = el.getCoordinates();
					alertLyr.set("styles", {
						"visibility": "visible",
						"display": "block",
						"top": (coords.top + coords.height + Number(offset[1].trim())) + "px",
						"left": (coords.left + Number(offset[0].trim())) + "px",
						"width": lyrW + "px",
						"z-index": 9999
					}).addClass("layer");

	                // set Iframe to hide combo box in IE
	                alertLyr.ieFixLayerShow();
	                break;
	                
	            case "popup":
					var coords = alertLyr.getCoordinates();
					alertLyr.set("styles", {
						visibility: "visible",
						display: "block",
						top: (window.getScrollTop() + window.getHeight() / 2 - coords.height / 2 + Number(offset[1].trim())) + "px",
						left: (window.getWidth() / 2 - lyrW / 2 + Number(offset[0].trim())) + "px",
						width: lyrW + "px",
						zIndex: 999
					}).addClass("popup");
	                
	                // fade HTML content
	                if (data.fadeContent == true) {
	                    showMask();
	                }
	                
	                break;
	            
				case "classic":
					alert(data.alert);
	                break;
				
	            default:
	                
	                break;
	        }
	        // set focus
	        el.focus();
			
			// autohide alert
			try {
				clearInterval(this.intervalID);
			} catch(e) {};
			
			this.intervalID = setTimeout(function(){
				fn.hideAlertLayer();
			}, fn.options.hideInterval);
	    } catch (err) {
		}
	},
	showAlertLayerCancel: function(el, msg){
	    try {
	        var fn = this;
			var form = el.form;
			var data = el.retrieve("data");
			var alertLyr = this.options.alertLayer;
	        this.options.errorElement = el;
			// call back functions
			this.onAlertShow(el);
	        // display alert message.
			if (msg) {
				alertLyr.getElement("p").set("html", msg);
			} else {
				alertLyr.getElement("p").set("html", data.alert);
			}
	        // show alert
			// var alertType = data.alertType || this.options.alertType;
		    var alertType = this.options.alertType;
			
	        //var offset = data.layerOffset ? data.layerOffset.split(",") : ["0", "0"];
			var offset = ["0", "0"];
		
			//var lyrW = data.layerWidth || this.options.layerWidth;
			var lyrW = this.options.layerWidth;
			switch (alertType) {
	            case "layer":
					var coords = el.getCoordinates();
					//fixed for ff
					if(Browser.Engine.gecko){
						var valueTop=(coords.top + coords.height + Number(offset[1].trim()))+3;
						var valueLeft=(coords.left + Number(offset[0].trim()))+4;
					}
					//fixed for IE
					else if(Browser.Engine.trident){
						var valueTop=(coords.top + coords.height + Number(offset[1].trim()))+2;
						var valueLeft=(coords.left + Number(offset[0].trim()))+2;
					}
					//else browser other
					else{
						var valueTop=(coords.top + coords.height + Number(offset[1].trim()));
						var valueLeft=(coords.left + Number(offset[0].trim()));
					}
					alertLyr.set("styles", {
						"visibility": "visible",
						"display": "block",
						"top": valueTop + "px",
						"left": valueLeft + "px",
						"width": lyrW + "px",
						"z-index": 9999
					}).addClass("layer");

	                // set Iframe to hide combo box in IE
	                alertLyr.ieFixLayerShow();
	                break;
	                
	            case "popup":
					var coords = alertLyr.getCoordinates();
					alertLyr.set("styles", {
						visibility: "visible",
						display: "block",
						top: (window.getScrollTop() + window.getHeight() / 2 - coords.height / 2 + Number(offset[1].trim())) + "px",
						left: (window.getWidth() / 2 - lyrW / 2 + Number(offset[0].trim())) + "px",
						width: lyrW + "px",
						zIndex: 999
					}).addClass("popup");
	                
	                // fade HTML content
	                if (data.fadeContent == true) {
	                    showMask();
	                }
	                
	                break;
	            
				case "classic":
					alert(data.alert);
	                break;
				
	            default:
	                
	                break;
	        }
	        // set focus
	        el.focus();
			
			// autohide alert
			try {
				clearInterval(this.intervalID);
			} catch(e) {};
			
			this.intervalID = setTimeout(function(){
				fn.hideAlertLayer();
			}, fn.options.hideInterval);
	    } catch (err) {
		}
	},
	showAlertLayerCancelChoose: function(el, msg){
	    try {
	        var fn = this;
			var form = el.form;
			var data = el.retrieve("data");
			var alertLyr = this.options.alertLayer;
	        this.options.errorElement = el;
			// call back functions
			this.onAlertShow(el);
	        // display alert message.
			if (msg) {
				alertLyr.getElement("p").set("html", msg);
			} else {
				alertLyr.getElement("p").set("html", data.alert);
			}
	        // show alert
			// var alertType = data.alertType || this.options.alertType;
		    var alertType = this.options.alertType;
			
	        //var offset = data.layerOffset ? data.layerOffset.split(",") : ["0", "0"];
			var offset = ["0", "0"];
		
			//var lyrW = data.layerWidth || this.options.layerWidth;
			var lyrW = this.options.layerWidth;
			switch (alertType) {
	            case "layer":
					var coords = el.getCoordinates();
					//fixed for ff
					if(Browser.Engine.gecko){
						var valueTop=(coords.top + coords.height + Number(offset[1].trim()));
						var valueLeft=(coords.left + Number(offset[0].trim()));
					}
					//fixed for IE
					else if(Browser.Engine.trident){
						var valueTop=(coords.top + coords.height + Number(offset[1].trim()));
						var valueLeft=(coords.left + Number(offset[0].trim()));
					}
					//else browser other
					else{
						var valueTop=(coords.top + coords.height + Number(offset[1].trim()));
						var valueLeft=(coords.left + Number(offset[0].trim()));
					}
					alertLyr.set("styles", {
						"visibility": "visible",
						"display": "block",
						"top": valueTop + "px",
						"left": valueLeft + "px",
						"width": lyrW + "px",
						"z-index": 9999
					}).addClass("layer");

	                // set Iframe to hide combo box in IE
	                alertLyr.ieFixLayerShow();
	                break;
	                
	            case "popup":
					var coords = alertLyr.getCoordinates();
					alertLyr.set("styles", {
						visibility: "visible",
						display: "block",
						top: (window.getScrollTop() + window.getHeight() / 2 - coords.height / 2 + Number(offset[1].trim())) + "px",
						left: (window.getWidth() / 2 - lyrW / 2 + Number(offset[0].trim())) + "px",
						width: lyrW + "px",
						zIndex: 999
					}).addClass("popup");
	                
	                // fade HTML content
	                if (data.fadeContent == true) {
	                    showMask();
	                }
	                
	                break;
	            
				case "classic":
					alert(data.alert);
	                break;
				
	            default:
	                
	                break;
	        }
	        // set focus
	        el.focus();
			
			// autohide alert
			try {
				clearInterval(this.intervalID);
			} catch(e) {};
			
			this.intervalID = setTimeout(function(){
				fn.hideAlertLayer();
			}, fn.options.hideInterval);
	    } catch (err) {
		}
	},
	hideAlertLayer: function(){
		clearInterval(this.options.waitInterval);
	    try {
			var alertLyr = this.options.alertLayer;
			var el = this.options.errorElement;
			if (el) {
				this.onAlertHide(el);
			}
	        
			// hide frame
			alertLyr.setStyle("visibility", "hidden");
			alertLyr.ieFixLayerHide();
			hideMask();
			
	    } catch (err) {
		}
	},
	hideAlertLayerCancel: function(){
		var alertLyr = this.options.alertLayer;
		alert(alertLyr);
		setTimeout(function(alertLyr){
			
			alertLyr.setStyle("visibility", "hidden");
			alertLyr.ieFixLayerHide();
			hideMask();
		},0);
		
	},
	
	onAlertShow: function(el){
		this.fireEvent("onAlertShow", el);
	},
	
	onAlertHide: function(el){
		this.fireEvent("onAlertHide", el);
	},
	
	onAfterChange: function(el){
		this.fireEvent("onAfterChange", el);
	},
	
	onSubmit: function(el){
		this.fireEvent("onSubmit", el);
	}
});

htmlform.implement(new Options, new Events);