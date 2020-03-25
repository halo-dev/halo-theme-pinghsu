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

<#-- 显示图标 -->
<#macro showBgIco postId>
<#assign bgColor=['book','game','note','chat','code','image','web','link','design','lock']/>
${bgColor[postId % 10]}
</#macro>

<#-- 随机缩略图 -->
<#macro randThumbs>
${randomMethod(0,10)}.jpg
</#macro>

<#-- 最近发布的文章 -->
<#macro getRecentPosts size>
<@postTag method="latest" top="${size}">
    <#if posts?? && posts?size gt 0>
        <#list posts as post>
        <li><a href="${post.fullPath!}">${post.title!}</a></li>
        </#list>
    <#else>
        <li><a href="javascript:void(0)">暂无文章</a></li>
    </#if>
</@postTag>
</#macro>

<#-- 最近发布的评论 -->
<#macro getRecentComments size>
<@commentTag method="latest" top="${size}">
    <#if comments?? && comments.getTotalElements() gt 0>
        <#list comments.content as comment>
            <#if comment.post??>
                <li><a href="${comment.post.fullPath!}#${comment.id}">${comment.author!} : ${comment.content!}</a></li>
            <#else>
                <li><a href="javascript:void(0);">${comment.author!} : ${comment.content!}</a></li>
            </#if>
        </#list>
    <#else>
        <li><a href="javascript:void(0)">暂无评论</a></li>
    </#if>
</@commentTag>
</#macro>

