<#include "/common/macro/common_macro.ftl">
<#import "functions.ftl" as fun>
<footer id="footer" class="footer bg-white">
	<div class="footer-social">
		<div class="footer-container clearfix">
			<div class="social-list">
                <#if options.pinghsu_sns_weibo??>
                    <a class="social weibo" target="blank" href="${options.pinghsu_sns_weibo!}">WEIBO</a>
                </#if>
                <#if options.pinghsu_sns_zhihu??>
                    <a class="social zhihu" target="blank" href="${options.pinghsu_sns_zhihu!}">ZHIHU</a>
                </#if>
                    <a class="social rss" target="blank" href="${options.blog_url!}/feed/">RSS</a>
                <#if options.pinghsu_sns_github??>
				    <a class="social github" target="blank" href="${options.pinghsu_sns_github!}">GITHUB</a>
                </#if>
                <#if options.pinghsu_sns_twitter??>
                    <a class="social twitter" target="blank" href="${options.pinghsu_sns_twitter!}">TWITTER</a>
                </#if>
			</div>
		</div>
	</div>
	<div class="footer-meta">
		<div class="footer-container">
			<div class="meta-item meta-copyright">
				<div class="meta-copyright-info">
                    <a href="${options.blog_url!}" class="info-logo">
                        <#if options.pinghsu_general_footer_logo??>
                        <img src="${options.pinghsu_general_footer_logo}" alt="${options.blog_title!}" />
                        <#else>
                        ${options.blog_title!}
                        </#if>
                    </a>
					<div class="info-text">
                    	<p>Theme is <a href="https://github.com/chakhsu/pinghsu" target="_blank">Pinghsu</a> by <a href="https://www.linpx.com/" target="_blank">Chakhsu</a></p>
						<p>Powered by <a href="https://github.com/ruibaby/halo" target="_blank" rel="nofollow">Halo</a></p>
						<p>&copy; ${.now?string["yyyy"]} <a href="${options.blog_url!}">${options.blog_title!}</a></p>
                        <p><@footer_info></@footer_info></p>
					</div>
				</div>
			</div>
			<div class="meta-item meta-posts">
				<h3 class="meta-title">RECENT POSTS</h3>
                <@fun.getRecentPosts 8/>
			</div>
            <div class="meta-item meta-comments">
                <h3 class="meta-title">RECENT COMMENTS</h3>
                <@fun.getRecentComments 8 />
            </div>
		</div>
	</div>
</footer>

<#if (options.pinghsu_style_post_toc!'false') == 'true' && post??>
<div id="directory-content" class="directory-content">
    <div id="directory"></div>
</div>
<script>
var postDirectoryBuild = function() {
    var postChildren = function children(childNodes, reg) {
        var result = [],
            isReg = typeof reg === 'object',
            isStr = typeof reg === 'string',
            node, i, len;
        for (i = 0, len = childNodes.length; i < len; i++) {
            node = childNodes[i];
            if ((node.nodeType === 1 || node.nodeType === 9) &&
                (!reg ||
                isReg && reg.test(node.tagName.toLowerCase()) ||
                isStr && node.tagName.toLowerCase() === reg)) {
                result.push(node);
            }
        }
        return result;
    },
    createPostDirectory = function(article, directory, isDirNum) {
        var contentArr = [],
            titleId = [],
            levelArr, root, level,
            currentList, list, li, link, i, len;
        levelArr = (function(article, contentArr, titleId) {
            var titleElem = postChildren(article.childNodes, /^h\d$/),
                levelArr = [],
                lastNum = 1,
                lastRevNum = 1,
                count = 0,
                guid = 1,
                id = 'directory' + (Math.random() + '').replace(/\D/, ''),
                lastRevNum, num, elem;
            while (titleElem.length) {
                elem = titleElem.shift();
                contentArr.push(elem.innerHTML);
                num = +elem.tagName.match(/\d/)[0];
                if (num > lastNum) {
                    levelArr.push(1);
                    lastRevNum += 1;
                } else if (num === lastRevNum ||
                    num > lastRevNum && num <= lastNum) {
                    levelArr.push(0);
                    lastRevNum = lastRevNum;
                } else if (num < lastRevNum) {
                    levelArr.push(num - lastRevNum);
                    lastRevNum = num;
                }
                count += levelArr[levelArr.length - 1];
                lastNum = num;
                elem.id = elem.id || (id + guid++);
                titleId.push(elem.id);
            }
            if (count !== 0 && levelArr[0] === 1) levelArr[0] = 0;

            return levelArr;
        })(article, contentArr, titleId);
        currentList = root = document.createElement('ul');
        dirNum = [0];
        for (i = 0, len = levelArr.length; i < len; i++) {
            level = levelArr[i];
            if (level === 1) {
                list = document.createElement('ul');
                if (!currentList.lastElementChild) {
                    currentList.appendChild(document.createElement('li'));
                }
                currentList.lastElementChild.appendChild(list);
                currentList = list;
                dirNum.push(0);
            } else if (level < 0) {
                level *= 2;
                while (level++) {
                    if (level % 2) dirNum.pop();
                    currentList = currentList.parentNode;
                }
            }
            dirNum[dirNum.length - 1]++;
            li = document.createElement('li');
            link = document.createElement('a');
            link.href = '#' + titleId[i];
            link.innerHTML = !isDirNum ? contentArr[i] :
                dirNum.join('.') + ' ' + contentArr[i] ;
            li.appendChild(link);
            currentList.appendChild(li);
        }
        directory.appendChild(root);
    };
    createPostDirectory(document.getElementById('post-content'),document.getElementById('directory'), true);
};
postDirectoryBuild();
</script>
</#if>

<#--<?php $this->footer(); ?>-->
<script src="//cdnjs.loli.net/ajax/libs/headroom/0.9.1/headroom.min.js"></script>

<#if (options.pinghsu_style_post_highlight!'false') == 'true'>
<script src="//cdnjs.loli.net/ajax/libs/highlight.js/9.10.0/highlight.min.js"></script>
</#if>


<#if (options.pinghsu_general_pjax!'false') == 'true'>
<script src="/${themeName}/source/js/instantclick.min.js?v20140319"></script>
</#if>

<#if (options.pinghsu_general_fast_click!'false') == 'true'>
<script src="//cdnjs.loli.net/ajax/libs/fastclick/1.0.6/fastclick.min.js"></script>
</#if>

<script>

<#if (options.pinghsu_style_post_toc!'false') == 'true' && post??>
var postDirectory = new Headroom(document.getElementById("directory-content"), {
    tolerance: 0,
    <#if (options.pinghsu_style_post_picture!'false') == 'true'>
    offset : 280,
    <#else>
    offset : 90,
    </#if>
    classes: {
        initial: "initial",
        pinned: "pinned",
        unpinned: "unpinned"
    }
});
postDirectory.init();
</#if>

<#if post??>
var postSharer = new Headroom(document.getElementById("post-bottom-bar"), {
    tolerance: 0,
    offset : 70,
    classes: {
        initial: "animated",
        pinned: "pinned",
        unpinned: "unpinned"
    }
});
postSharer.init();
</#if>

var header = new Headroom(document.getElementById("header"), {
    tolerance: 0,
    offset : 70,
    classes: {
      initial: "animated",
      pinned: "slideDown",
      unpinned: "slideUp"
    }
});
header.init();

<#if ((options.pinghsu_general_pjax!'false') == 'true') && ((options.pinghsu_style_post_highlight!'false') == 'true') && post??>
hljs.initHighlightingOnLoad();
</#if>

<#if (options.pinghsu_general_fast_click!'false') == 'true'>
if ('addEventListener' in document) {
    document.addEventListener('DOMContentLoaded', function() {
        FastClick.attach(document.body);
    }, false);
}
</#if>
</script>

<#if (options.pinghsu_style_post_mathjax!'false') == 'true'>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
    showProcessingMessages: false,
    messageStyle: "none",
    extensions: ["tex2jax.js"],
    jax: ["input/TeX", "output/HTML-CSS"],
    tex2jax: {
        inlineMath: [ ['$','$'], ["\\(","\\)"] ],
        displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
        skipTags: ['script', 'noscript', 'style', 'textarea', 'pre','code','a'],
        ignoreClass:"comment-content"
    },
    "HTML-CSS": {
        availableFonts: ["STIX","TeX"],
        showMathMenu: false
    }
});
MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
</script>
<script src="//cdnjs.loli.net/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
</#if>

<#-- 统计代码 -->
<@statistics />

<#if (options.pinghsu_general_pjax!'false')=='true'>
<script data-no-instant>
InstantClick.on('change', function(isInitialLoad){
    <#if (options.pinghsu_style_post_highlight!'false') == 'true'>
    var blocks = document.querySelectorAll('pre code');
    for (var i = 0; i < blocks.length; i++) {
        hljs.highlightBlock(blocks[i]);
    }
    </#if>

    if (isInitialLoad === false) {
    <#if (options.pinghsu_style_post_mathjax!'false') == 'true'>
        if (typeof MathJax !== 'undefined'){MathJax.Hub.Queue(["Typeset",MathJax.Hub]);}
    </#if>
    }
});
InstantClick.init('mousedown');
</script>
</#if>
</body>
</html>
