<#include "header.ftl">
<@header title="${post.title!} | ${blog_title!}"></@header>
<article class="main-content page-page">
    <div class="post-header"><h1 class="post-title" itemprop="name headline"> Links </h1>
        <div class="post-data">
            <time datetime="${post.createTime!}" itemprop="datePublished">Published on ${post.createTime?string('MMM d,yyyy')}</time>
        </div>
    </div>
    <div id="post-content" class="post-content"><h3>友情链接</h3>
        <ul class="flinks">
            <@linkTag method="list">
                <#if links?? && links?size gt 0>
                    <#list links as link>
                        <li>🔒 <a href="${link.url}" target="_blank">${link.name}</a></li>
                    </#list>
                </#if>
            </@linkTag>
        </ul>
        ${post.formatContent!}
    </div>
</article>
<#include "comment.ftl">
<@comment post=sheet type="sheet" />
<#include "footer.ftl">
