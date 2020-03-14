<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="搜索 | ${blog_title!}"></@header>
<div class="main-content page-page">
    <div class="search-page">
        <form id="search" class="search-form" method="get" action="${blog_url!}/search" role="search">
            <span class="search-box clearfix">
                <input type="text" id="input" class="input" name="keyword" required="true" placeholder="Search..." maxlength="30" autocomplete="off">
                <button type="submit" class="spsubmit"><i class="icon-search"></i></button>
            </span>
        </form>
        <div class="search-tags">
        <@tagTag method="list">
            <#if tags?? && tags?size gt 0>
                <#list tags as tag>
                    <a href="${tag.fullPath!}" class="<#if !settings.post_color!false> bg-white<#else >text-white bg-<@fun.randBgColor/></#if>"># ${tag.name!}(${tag.postCount!0})</a>
                </#list>
            <#else>
            <p> Nothing here ! </p>
            </#if>
        </@tagTag>
        <div class="search-tags-hr <#if !settings.post_color!false>bg-deepgrey<#else>bg-<@fun.randBgColor/></#if>"></div>
        </div>
    </div>
</div>

<#include "footer.ftl">
