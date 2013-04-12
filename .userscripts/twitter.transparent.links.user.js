// ==UserScript==
// @name Transparent Links for Twitter
// @description Replace URLs shortened by Twitter with those originally specified by the author.
// @version 1.0
// @author Mike Pennisi
// @match http://*.twitter.com/*
// @match https://*.twitter.com/*
// ==/UserScript==

(function(window, undefined) {
	"use strict";

	// getTweetedLink
	// Return the anchor element that contains a given DOM node. If there is no
	// such anchor element (or it is not contained within a tweet), return
	// `undefined`.
	var getTweetLink = function(target) {
		var anchor, inTweet, realUrl;

		do {
			// Skip non-element nodes (such as the document)
			if (!("tagName" in target && "className" in target)) {
				continue;
			}

			if (!anchor) {
				if (target.tagName.toLowerCase() === "a") {
					anchor = target;
				}
			} else {
				if (target.className.split(" ").indexOf("js-tweet-text") > -1) {
					inTweet = true;
				}
			}
		} while(target = target.parentNode);

		return inTweet && anchor;
	};

	// restoreUrl
	// Replace the shortened URL of a given anchor element with the value
	// originally specified by the author.
	var restoreUrl = function(anchorElem) {
		var originalUrl = anchorElem.getAttribute("data-expanded-url");
		if (originalUrl) {
			anchorElem.setAttribute("href", originalUrl);
		}
	};

	window.document.addEventListener("click", function(event) {
		var anchorElem = getTweetLink(event.target);

		if (anchorElem) {
			restoreUrl(anchorElem);
		}
	}, true);

}(this));
