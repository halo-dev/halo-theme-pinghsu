<#-- 随机颜色 -->
<#macro randBgColor>
<#assign bgColor=['blue','purple','green','yellow','red','orange']/>
${bgColor[randomMethod(0,6)]}
</#macro>

<#-- 随机图标 -->
<#macro randBgIco>
<#assign bgColor=['book','game','note','chat','code','image','web','link','design','lock']/>
${bgColor[randomMethod(0,10)]}
</#macro>

<#-- 随机缩略图 -->
<#macro randThumbs>
${randomMethod(0,10)}.jpg
</#macro>

<#-- 最近发布的文章 -->
<#macro getRecentPosts size>
<#assign posts = recentPostsMethod(size) />
<#if posts?? && posts?size gt 0>
    <#list posts as post>
    <li><a href="${options.blog_url!}/archives/${post.postUrl!}">${post.postTitle!}</a></li>
    </#list>
<#else>
    <li><a href="javascript:void(0)">暂无文章</a></li>
</#if>
</#macro>

<#-- 最近发布的评论 -->
<#macro getRecentComments size>
<#assign comments = recentCommentsMethod(size) />
<#if comments?? && comments?size gt 0>
    <#list comments as comment>
        <li><a href="${options.blog_url!}/archives/${comment.post.postUrl!}#comment-id-${comment.commentId?c}">${comment.commentAuthor!} : <#if comment.commentContent?length gt 60>${comment.commentContent?substring(0,60)}...<#else>${comment.commentContent!}</#if></a></li>
    </#list>
<#else>
    <li><a href="javascript:void(0)">暂无评论</a></li>
</#if>
</#macro>
