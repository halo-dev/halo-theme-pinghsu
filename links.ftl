<#include "header.ftl">
<@header title="友情链接 | ${blog_title!}"></@header>
<article class="main-content page-page">
    <div class="post-header">
        <h1 class="post-title" itemprop="name headline"> Links </h1>
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
    </div>
</article>
<#include "footer.ftl">
