// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "stylesheets/application"


window.scrollToTop = function(duration = 0){
	if (document.scrollingElement.scrollTop === 0) return;

	const totalScrollDistance = document.scrollingElement.scrollTop;
	let scrollY = totalScrollDistance, oldTimestamp = null;

	function step (newTimestamp) {
		if (oldTimestamp !== null) {
			// if duration is 0 scrollY will be -Infinity
			scrollY -= totalScrollDistance * (newTimestamp - oldTimestamp) / duration;
			if (scrollY <= 0) return document.scrollingElement.scrollTop = 0;
			document.scrollingElement.scrollTop = scrollY;
		}
		oldTimestamp = newTimestamp;
		window.requestAnimationFrame(step);
	}
	window.requestAnimationFrame(step);
}


window.addEventListener("ajax:before", () => {
	scrollToTop(100);

	document.getElementById('loading_page').classList.remove('hidden');
	document.getElementById('articles_table').classList.add('hidden');
	document.getElementById('sync-icon').classList.add('animate-spin');
	document.getElementById('btn-next').classList.add('hidden');
	document.getElementById('btn-prev').classList.add('hidden');
});
