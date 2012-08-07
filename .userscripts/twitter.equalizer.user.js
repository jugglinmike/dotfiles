// ==UserScript==
// @name Twitter Status Equalizer
// @description Remove status information (retweet count, follower count) from Twitter.com UI
// @version 1.0
// @author Mike Pennisi
// @match http://*.twitter.com/*
// @match https://*.twitter.com/*
// ==/UserScript==

(function(window, undefined) {
	var text = [];
	var styleNode;
	text.push(".stats { color: transparent;border: dashed 1px #555; }");
	text.push(".stats * { color: transparent; }");
	text.push(".stats img { display: none; }");
	text = text.join(" ").replace(/\s*;/g, " !important;");
	styleNode = document.createElement("style");
	styleNode.innerText = text;
	document.body.appendChild(styleNode);
}(this));
