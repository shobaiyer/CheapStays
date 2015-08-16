(function(window, document, undefined) {
	 var spaceinterval = 1;
	 var timeinterval = 10; // `speed`
	 var max;
	 var firstrun = true;
	 // Interval function:
	 var gallery = function() {
	  var elem = document.getElementById("marquee-container");
	  if (elem) {
	   if (firstrun) {
	    max = elem.scrollWidth;
	    // Clone the children of the container until the
	    // scrollWidth is at least twice as large as max.
	    while (elem.scrollWidth < max * 2) {
	     var length = elem.children.length;
	     for (var i = 0; i < length; ++i) {
	      elem.appendChild(elem.children[i].cloneNode(true));
	     }				
	     break;
	    }
	    firstrun = false;
	   }
	   if (elem.scrollLeft >= max) {
	    elem.scrollLeft -= max;
	   } else {
	    elem.scrollLeft += spaceinterval;
	   }
	  }
	 };
	 window.setInterval(gallery, timeinterval);
	})(window, document);
