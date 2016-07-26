(function($){

	$.fn.alphanumeric = function(p) { 
		p = $.extend({
			ichars: "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`.-_ ", 
			nchars: "",
			allow: ""
		  }, p);	

		return this.each
			(
				function() 
				{

					if (p.nocaps) p.nchars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
					if (p.allcaps) p.nchars += "abcdefghijklmnopqrstuvwxyz";
					
					s = p.allow.split('');
					for ( i=0;i<s.length;i++) if (p.ichars.indexOf(s[i]) != -1) s[i] = "\\" + s[i];
					p.allow = s.join('|');
					
					var reg = new RegExp(p.allow,'gi');
					var ch = p.ichars + p.nchars;
					
					var ch = ch.replace(reg,'');
					
					$(this).keydown(function(e){
						if (!e.charCode) kc = e.which;
						else kc = e.charCode;
						if(	navigator.userAgent.split(' ').join('').toLowerCase().indexOf('chrome')>-1) if (kc==229) e.preventDefault();
					});
					
					$(this).keypress(function(e){
						if (!e.charCode) k = String.fromCharCode(e.which);
						else k = String.fromCharCode(e.charCode);
						if ((ch.indexOf(k)!=-1)&&!(e.ctrlKey&&k=='v')) e.preventDefault();
					});

					$(this).keyup(function(e){
						var spChar = "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`.-_ ";
						var allowedChar = "1234567890abcdefghijklmnopqrstuvwxyz!@#$%^&*()+=[]\\\';,/{}|\":<>?~`.-_ ";
						s = ch.split('');
						for ( i=0;i<s.length;i++) if(spChar.indexOf(s[i])>-1) s[i] = "\\" + s[i];
						preventChar = s.join('');
						preventChar = '['+preventChar+']';
						var preventCharReg = new RegExp(preventChar,'gi');
						allowedChar = allowedChar.replace(preventCharReg,"");
						s = allowedChar.split('');
						for ( i=0;i<s.length;i++) if(spChar.indexOf(s[i])>-1) s[i] = "\\" + s[i];
						allowedChar = s.join('');
						allowedChar = '[^'+allowedChar+']';
						var filter = new RegExp(allowedChar,'gi');
						var targetString = $(this).val();
						if(filter.test(targetString)) $(this).val(targetString.replace(filter,""))
					});
					
					$(this).css('ime-mode', 'disabled'); 						
					$(this).bind('contextmenu',function () {return false});
								
				}
			);
	};

	$.fn.numeric = function(p) {
	
		var az = "abcdefghijklmnopqrstuvwxyz";
		az += az.toUpperCase();

		p = $.extend({
			nchars: az
		  }, p);	
		  	
		return this.each (function()
			{
				$(this).alphanumeric(p);
			}
		);
			
	};
	
	$.fn.alpha = function(p) {

		var nm = "1234567890";

		p = $.extend({
			nchars: nm
		  }, p);	

		return this.each (function()
			{
				$(this).alphanumeric(p);
			}
		);
	};	

})(jQuery);
