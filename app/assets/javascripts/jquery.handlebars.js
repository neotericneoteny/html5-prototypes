/* jQuery Plugin for Handlebars.js */
(function ($) {
	var compiled = {};

	$.fn.handlebars = function (template, data) {
		if (this.length > 0 && template.length > 0) {
			if (template instanceof jQuery) {
				template = $(template).html();
			}

			compiled[template] = Handlebars.compile(template);
			this.html(compiled[template](data));
		}
	};

})(jQuery); 
