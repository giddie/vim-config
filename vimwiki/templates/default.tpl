$--| GitHub HTML5 Pandoc Template" v2.1 | 2018/02/28 | pandoc v2.1.1
<!DOCTYPE html>
<!--
==============================================================================
           "GitHub HTML5 Pandoc Template" v2.1 — by Tristano Ajmone
==============================================================================
Copyright © Tristano Ajmone, 2017, MIT License (MIT). Project's home:

- https://github.com/tajmone/pandoc-goodies

The CSS in this template reuses source code taken from the following projects:

- GitHub Markdown CSS: Copyright © Sindre Sorhus, MIT License (MIT):
  https://github.com/sindresorhus/github-markdown-css

- Primer CSS: Copyright © 2016-2017 GitHub Inc., MIT License (MIT):
  http://primercss.io/

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The MIT License

Copyright (c) Tristano Ajmone, 2017 (github.com/tajmone/pandoc-goodies)
Copyright (c) Sindre Sorhus <sindresorhus@gmail.com> (sindresorhus.com)
Copyright (c) 2017 GitHub Inc.

"GitHub Pandoc HTML5 Template" is Copyright (c) Tristano Ajmone, 2017, released
under the MIT License (MIT); it contains readaptations of substantial portions
of the following third party softwares:

(1) "GitHub Markdown CSS", Copyright (c) Sindre Sorhus, MIT License (MIT).
(2) "Primer CSS", Copyright (c) 2016 GitHub Inc., MIT License (MIT).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
==============================================================================-->
$-------------------------------------------------------------------------> lang
<html$if(lang)$ lang="$lang$"$endif$$if(dir)$ dir="$dir$"$endif$>
<head>
$--=============================================================================
$--                                METADATA
$--=============================================================================
  <meta charset="$if(charset)$$charset$$else$utf-8$endif$" />
  <meta name="generator" content="pandoc" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
$-----------------------------------------------------------------------> author
$for(author-meta)$
  <meta name="author" content="$author-meta$" />
$endfor$
$-------------------------------------------------------------------------> date
$if(date-meta)$
  <meta name="dcterms.date" content="$date-meta$" />
$endif$
$---------------------------------------------------------------------> keywords
$if(keywords)$
  <meta name="keywords" content="$for(keywords)$$keywords$$sep$, $endfor$" />
$endif$
$------------------------------------------------------------------> description
$if(description)$
  <meta name="description" content="$description$">
$endif$
$------------------------------------------------------------------------> title
  <title>$if(title-prefix)$$title-prefix$ – $endif$$pagetitle$</title>
$--===========================================================================
$--                            CSS STYLESHEETS
$--===========================================================================
$-- Here comes the placeholder (within double braces) that will be replaced
$-- by the CSS file in the finalized template:
  <style type="text/css">
@charset "UTF-8";.markdown-body{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;color:#24292e;font-family:-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";font-size:16px;line-height:1.5;word-wrap:break-word;box-sizing:border-box;min-width:200px;max-width:980px;margin:0 auto;padding:45px}.markdown-body a{color:#0366d6;background-color:transparent;text-decoration:none;-webkit-text-decoration-skip:objects}.markdown-body a:active,.markdown-body a:hover{outline-width:0}.markdown-body a:hover{text-decoration:underline}.markdown-body a:not([href]){color:inherit;text-decoration:none}.markdown-body strong{font-weight:600}.markdown-body h1,.markdown-body h2,.markdown-body h3,.markdown-body h4,.markdown-body h5,.markdown-body h6{margin-top:24px;margin-bottom:16px;font-weight:600;line-height:1.25}.markdown-body h1{font-size:2em;margin:.67em 0;padding-bottom:.3em;border-bottom:1px solid #eaecef}.markdown-body h2{padding-bottom:.3em;font-size:1.5em;border-bottom:1px solid #eaecef}.markdown-body h3{font-size:1.25em}.markdown-body h4{font-size:1em}.markdown-body h5{font-size:.875em}.markdown-body h6{font-size:.85em;color:#6a737d}.markdown-body img{border-style:none}.markdown-body svg:not(:root){overflow:hidden}.markdown-body hr{box-sizing:content-box;height:.25em;margin:24px 0;padding:0;overflow:hidden;background-color:#e1e4e8;border:0}.markdown-body hr::before{display:table;content:""}.markdown-body hr::after{display:table;clear:both;content:""}.markdown-body input{margin:0;overflow:visible;font:inherit;font-family:inherit;font-size:inherit;line-height:inherit}.markdown-body [type=checkbox]{box-sizing:border-box;padding:0}.markdown-body *{box-sizing:border-box}.markdown-body blockquote{margin:0}.markdown-body ol,.markdown-body ul{padding-left:2em}.markdown-body ol ol,.markdown-body ul ol{list-style-type:lower-roman}.markdown-body ol ol,.markdown-body ol ul,.markdown-body ul ol,.markdown-body ul ul{margin-top:0;margin-bottom:0}.markdown-body ol ol ol,.markdown-body ol ul ol,.markdown-body ul ol ol,.markdown-body ul ul ol{list-style-type:lower-alpha}.markdown-body li>p{margin-top:16px}.markdown-body li+li{margin-top:.25em}.markdown-body dd{margin-left:0}.markdown-body dl{padding:0}.markdown-body dl dt{padding:0;margin-top:16px;font-size:1em;font-style:italic;font-weight:600}.markdown-body dl dd{padding:0 16px;margin-bottom:16px}.markdown-body code{font-family:SFMono-Regular,Consolas,"Liberation Mono",Menlo,Courier,monospace}.markdown-body pre{font:12px SFMono-Regular,Consolas,"Liberation Mono",Menlo,Courier,monospace;word-wrap:normal}.markdown-body blockquote,.markdown-body dl,.markdown-body ol,.markdown-body p,.markdown-body pre,.markdown-body table,.markdown-body ul{margin-top:0;margin-bottom:16px}.markdown-body blockquote{padding:0 1em;color:#6a737d;border-left:.25em solid #dfe2e5}.markdown-body blockquote>:first-child{margin-top:0}.markdown-body blockquote>:last-child{margin-bottom:0}.markdown-body table{display:block;width:100%;overflow:auto;border-spacing:0;border-collapse:collapse}.markdown-body table th{font-weight:600}.markdown-body table td,.markdown-body table th{padding:6px 13px;border:1px solid #dfe2e5}.markdown-body table tr{background-color:#fff;border-top:1px solid #c6cbd1}.markdown-body table tr:nth-child(2n){background-color:#f6f8fa}.markdown-body img{max-width:100%;box-sizing:content-box;background-color:#fff}.markdown-body code{padding:.2em 0;margin:0;font-size:85%;background-color:rgba(27,31,35,.05);border-radius:3px}.markdown-body code::after,.markdown-body code::before{letter-spacing:-.2em;content:" "}.markdown-body pre>code{padding:0;margin:0;font-size:100%;word-break:normal;white-space:pre;background:0 0;border:0}.markdown-body .highlight{margin-bottom:16px}.markdown-body .highlight pre{margin-bottom:0;word-break:normal}.markdown-body .highlight pre,.markdown-body pre{padding:16px;overflow:auto;font-size:85%;line-height:1.45;background-color:#f6f8fa;border-radius:3px}.markdown-body pre code{display:inline;max-width:auto;padding:0;margin:0;overflow:visible;line-height:inherit;word-wrap:normal;background-color:transparent;border:0}.markdown-body pre code::after,.markdown-body pre code::before{content:normal}.markdown-body .full-commit .btn-outline:not(:disabled):hover{color:#005cc5;border-color:#005cc5}.markdown-body kbd{box-shadow:inset 0 -1px 0 #959da5;display:inline-block;padding:3px 5px;font:11px/10px SFMono-Regular,Consolas,"Liberation Mono",Menlo,Courier,monospace;color:#444d56;vertical-align:middle;background-color:#fcfcfc;border:1px solid #c6cbd1;border-bottom-color:#959da5;border-radius:3px;box-shadow:inset 0 -1px 0 #959da5}.markdown-body :checked+.radio-label{position:relative;z-index:1;border-color:#0366d6}.markdown-body .task-list-item{list-style-type:none}.markdown-body .task-list-item+.task-list-item{margin-top:3px}.markdown-body .task-list-item input{margin:0 .2em .25em -1.6em;vertical-align:middle}.markdown-body::before{display:table;content:""}.markdown-body::after{display:table;clear:both;content:""}.markdown-body>:first-child{margin-top:0!important}.markdown-body>:last-child{margin-bottom:0!important}.Alert,.Error,.Note,.Success,.Warning{padding:11px;margin-bottom:24px;border-style:solid;border-width:1px;border-radius:4px}.Alert p,.Error p,.Note p,.Success p,.Warning p{margin-top:0}.Alert p:last-child,.Error p:last-child,.Note p:last-child,.Success p:last-child,.Warning p:last-child{margin-bottom:0}.Alert{color:#246;background-color:#e2eef9;border-color:#bac6d3}.Warning{color:#4c4a42;background-color:#fff9ea;border-color:#dfd8c2}.Error{color:#911;background-color:#fcdede;border-color:#d2b2b2}.Success{color:#22662c;background-color:#e2f9e5;border-color:#bad3be}.Note{color:#2f363d;background-color:#f6f8fa;border-color:#d5d8da}.Alert h1,.Alert h2,.Alert h3,.Alert h4,.Alert h5,.Alert h6{color:#246;margin-bottom:0}.Warning h1,.Warning h2,.Warning h3,.Warning h4,.Warning h5,.Warning h6{color:#4c4a42;margin-bottom:0}.Error h1,.Error h2,.Error h3,.Error h4,.Error h5,.Error h6{color:#911;margin-bottom:0}.Success h1,.Success h2,.Success h3,.Success h4,.Success h5,.Success h6{color:#22662c;margin-bottom:0}.Note h1,.Note h2,.Note h3,.Note h4,.Note h5,.Note h6{color:#2f363d;margin-bottom:0}.Alert h1:first-child,.Alert h2:first-child,.Alert h3:first-child,.Alert h4:first-child,.Alert h5:first-child,.Alert h6:first-child,.Error h1:first-child,.Error h2:first-child,.Error h3:first-child,.Error h4:first-child,.Error h5:first-child,.Error h6:first-child,.Note h1:first-child,.Note h2:first-child,.Note h3:first-child,.Note h4:first-child,.Note h5:first-child,.Note h6:first-child,.Success h1:first-child,.Success h2:first-child,.Success h3:first-child,.Success h4:first-child,.Success h5:first-child,.Success h6:first-child,.Warning h1:first-child,.Warning h2:first-child,.Warning h3:first-child,.Warning h4:first-child,.Warning h5:first-child,.Warning h6:first-child{margin-top:0}h1.title,p.subtitle{text-align:center}h1.title.followed-by-subtitle{margin-bottom:0}p.subtitle{font-size:1.5em;font-weight:600;line-height:1.25;margin-top:0;margin-bottom:16px;padding-bottom:.3em}div.line-block{white-space:pre-line}
  </style>
$-------------------------------------------------------------------------------
  <style type="text/css">code{white-space: pre;}</style>
$-------------------------------------------------------------------------------
$if(quotes)$
  <style type="text/css">q { quotes: "“" "”" "‘" "’"; }</style>
$endif$
$-------------------------------------------------------------> highlighting-css
$if(highlighting-css)$
  <style type="text/css">
$highlighting-css$
  </style>
$endif$
$--------------------------------------------------------------------------> css
$for(css)$
  <link rel="stylesheet" href="$css$">
$endfor$
$-------------------------------------------------------------------------> math
$if(math)$
  $math$
$endif$
$-------------------------------------------------------------------------------
  <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv-printshiv.min.js"></script>
  <![endif]-->
$--------------------------------------------------------------> header-includes
$for(header-includes)$
  $header-includes$
$endfor$
$-------------------------------------------------------------------------------
</head>
<body>
<article class="markdown-body">
$---------------------------------------------------------------> include-before
$for(include-before)$
$include-before$
$endfor$
$-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> IF: title
$if(title)$
<header>
<h1 class="title$if(subtitle)$ followed-by-subtitle$endif$">$title$</h1>
$---------------------------------------------------------------------> subtitle
$if(subtitle)$
<p class="subtitle">$subtitle$</p>
$endif$
$-----------------------------------------------------------------------> author
$for(author)$
<p class="author">$author$</p>
$endfor$
$-------------------------------------------------------------------------> date
$if(date)$
<p class="date">$date$</p>
$endif$
$----------------------------------------------------------------------> summary
$if(summary)$
<div class="summary">
$summary$
</div>
$endif$
$-------------------------------------------------------------------------------
</header>
$endif$
$--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< END IF: title
$--------------------------------------------------------------------------> toc
$if(toc)$
<hr>
<nav id="$idprefix$TOC">
<h1 class="toc-title">$if(toc-title)$$toc-title$$else$Contents$endif$</h1>
$table-of-contents$
</nav>
<hr>
$endif$
$-------------------------------------------------------------------------> body
$body$
$----------------------------------------------------------------> include-after
$for(include-after)$
$include-after$
$endfor$
$-------------------------------------------------------------------------------
</article>
</body>
</html>
