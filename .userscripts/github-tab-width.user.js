// ==UserScript==
// @name GitHub Tab Width Correction
// @description Set custom tab width for code viewing on GitHub
// @version 1.0
// @author Mike Pennisi
// @match http://*.github.com/*
// @match https://*.github.com/*
// ==/UserScript==

(function(window, undefined) {
	var text = [];
	var styleNode;
	// Set tab size for normal views and blame views
	text.push(".file .line-data, .file .line { -moz-tab-size: 4; tab-size: 4; }");
	styleNode = document.createElement("style");
	styleNode.innerText = text;
	document.body.appendChild(styleNode);
}(this));
