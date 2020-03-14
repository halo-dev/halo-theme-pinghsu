<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="归档 | ${blog_title!}"></@header>
<div class="main-content archive-page clearfix">
    <div class="categorys-item">
        <#list archives as archive>
            <div class="categorys-item">
                <div class="categorys-title">${archive.year?c}</div>
                <#if archive.posts?? && archive.posts?size gt 0>
                    <div class="post-lists">
                        <div class="post-lists-body">
                            <#list archive.posts as post>
                                <div class="post-list-item">
                                    <div class="post-list-item-container">
                                        <div class="item-label">
                                            <div class="item-title"><a href="${post.fullPath!}">${post.title!}</a></div>
                                            <div class="item-meta clearfix">
                                                <div class="item-meta-date"> ${post.createTime?string('MMM d,yyyy')} </div>
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
    </div>

    <div class="lists-navigator clearfix">
        <#if posts.totalPages gt 1>
            <ol class="page-navigator">
                <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="3">
                    <#if pagination.hasPrev>
                        <li class="pre">
                            <a href="${pagination.prevPageFullPath!}">←</a>
                        </li>
                    </#if>
                    <#list pagination.rainbowPages as number>
                        <#if number.isCurrent>
                            <li class="current">
                                <a href="${number.fullPath!}">${number.page!}</a>
                            </li>
                        <#else>
                            <li>
                                <a href="${number.fullPath!}">${number.page!}</a>
                            </li>
                        </#if>
                    </#list>
                    <#if pagination.hasNext>
                        <li class="next">
                            <a href="${pagination.nextPageFullPath!}">→</a>
                        </li>
                    </#if>
                </@paginationTag>
            </ol>
        </#if>
    </div>
</div>
<#include "footer.ftl">
