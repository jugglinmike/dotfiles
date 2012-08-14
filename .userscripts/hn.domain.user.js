// ==UserScript==
// @name         Show Full Domain on Hacker News Posts
// @description  Expands domain on displayed Hacker News posts to include subdomains
// @namespace    http://userscripts.org/users/119115
// @include      http://news.ycombinator.com/*
// @include      https://news.ycombinator.com/*
// @match        https://news.ycombinator.com/*
// @match        http://news.ycombinator.com/*
// @author       unknown
// ==/UserScript==

(function() {

	var stories = document.getElementsByClassName("title");
	var idx, len, domain, url, fullDomain;

	len = stories.length;

	for (idx=0; idx < len; ++idx) {

		url = stories[idx].getElementsByTagName("a");
		domain = stories[idx].getElementsByClassName("comhead")[0];

		if (domain && domain.className === "comhead"){

			fullDomain = " (" + url[0].hostname.replace(/^www\./,"") + ") ";

			if(fullDomain !== domain.innerHTML) {

				domain.innerHTML = fullDomain; 
			}
		}
	}
}());
