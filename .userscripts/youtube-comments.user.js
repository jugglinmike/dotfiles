// ==UserScript==
// @name           RemoveYouTubeComments
// @description    Remove bullshit YouTube comments.
// @match          http://www.youtube.com/*
// @author         Tim Branyen
// @version        1.0
// ==/UserScript==

// Find the comments view element.
var commentsView = document.getElementById("comments-view");

// Make sure it exists, otherwise an error will be thrown.
if (commentsView) {
  // Remove this shit from the DOM.
  commentsView.parentNode.removeChild(commentsView);
}
