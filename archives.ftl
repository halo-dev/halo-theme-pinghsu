<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="归档 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_desc!}"></@header>
<div class="main-content archive-page clearfix">
    <div class="categorys-item">
        <@articleTag method="archives">
            <#list archives as archive>
                <div class="categorys-item">
                    <div class="categorys-title">${archive.month!}月 ${archive.year!}</div>
                    <#if archive.posts?? && archive.posts?size gt 0>
                        <div class="post-lists">
                            <div class="post-lists-body">
                                <#list archive.posts as post>
                                    <div class="post-list-item">
                                        <div class="post-list-item-container">
                                            <div class="item-label">
                                                <div class="item-title"><a href="${options.blog_url!}/archives/${post.postUrl!}">${post.postTitle!}</a></div>
                                                <div class="item-meta clearfix">
                                                    <div class="item-meta-date"> ${post.postDate?string('MMM d,yyyy')} </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </#list>
                            </div>
                        </div>
                    </#if>
                </div>
            </#list>
        </@articleTag>
    </div>
</div>
<#include "footer.ftl">
