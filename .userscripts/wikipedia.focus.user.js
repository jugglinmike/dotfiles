// ==UserScript==
// @name Wikipedia Focus
// @description Improve readability of Wikipedia articles by removing styling from citations and internal links. Press 'l' to activate.
// @version 1.0
// @author Mike Pennisi
// @match http://*.wikipedia.org/*
// @match https://*.wikipedia.org/*
// ==/UserScript==

(function(window, undefined) {
	"use strict";

	var text = [
		// Render internal hyperlinks as normal text
		"#bodyContent [href^='/wiki/'] { color: inherit; }",
		// Render references to non-existing articles as normal text
		"#bodyContent a.new { color: inherit; }",
		// Do not display in-line reference links
		"#bodyContent sup.reference { display: none; }"
	];
	var styleNode;

	text = text.join(" ").replace(/\s*;/g, " !important;");
	styleNode = document.createElement("style");
	styleNode.innerText = text;

	// When the 'l' key is pressed, toggle this user script's presentation
	// changes.
	document.addEventListener("keydown", function(event) {

		var parentNode = styleNode.parentNode;
		var activeElem = document.activeElement;

		// Ignore all key presses except 'l'
		if (event.which !== 76 ||
			// Ignore all key presses while a form element is active
			activeElem.tagName.toLowerCase() === 'input') {
			return;
		}

		if (parentNode) {
			parentNode.removeChild(styleNode);
		} else {
			document.body.appendChild(styleNode);
		}
	}, true);
}(this));
