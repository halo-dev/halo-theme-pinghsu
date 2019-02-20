<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="搜索 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_desc!}"></@header>
<div class="main-content page-page">
    <div class="search-page">
        <form id="search" class="search-form" method="get" action="${options.blog_url!}/search" role="search">
            <span class="search-box clearfix">
                <input type="text" id="input" class="input" name="keyword" required="true" placeholder="Search..." maxlength="30" autocomplete="off">
                <button type="submit" class="spsubmit"><i class="icon-search"></i></button>
            </span>
        </form>
        <div class="search-tags">
        <@commonTag method="tags">
            <#if tags?? && tags?size gt 0>
                <#list tags as tag>
                    <a href="${options.blog_url!}/tags/${tag.tagUrl}" class="<#if (options.pinghsu_style_post_color!'false') == 'false'> bg-white<#else >text-white bg-<@fun.randBgColor/></#if>"># ${tag.tagName!}(${tag.posts?size})</a>
                </#list>
            <#else>
            <p> Nothing here ! </p>
            </#if>
        </@commonTag>
        <div class="search-tags-hr <#if (options.pinghsu_style_post_color!'false') == 'false'>bg-deepgrey<#else>bg-<@fun.randBgColor/></#if>"></div>
        </div>
    </div>
</div>

<#include "footer.ftl">
