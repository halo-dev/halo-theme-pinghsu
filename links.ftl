<#include "header.ftl">
<@header title="友情链接 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_desc!}"></@header>
<article class="main-content page-page">
    <div class="post-header">
        <h1 class="post-title" itemprop="name headline"> Links </h1>
    </div>
    <div id="post-content" class="post-content"><h3>友情链接</h3>
        <ul class="flinks">
            <@commonTag method="links">
                <#if links?? && links?size gt 0>
                    <#list links as link>
                        <li>🔒 <a href="${link.linkUrl}" target="_blank">${link.linkName}</a></li>
                    </#list>
                </#if>
            </@commonTag>
        </ul>
    </div>
</article>
<#include "footer.ftl">
