<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="搜索：${keyword} | ${blog_title!}"></@header>
<div class="main-content common-page clearfix">
    <div class="common-item">
        <div class="common-title">
            Search : ${keyword}
		</div>
        <div class="post-lists">
			<div class="post-lists-body">
				<#if posts?? && posts.content?size gt 0>
                    <#list posts.content as post>
                        <div class="post-list-item">
                            <div class="post-list-item-container <#if settings.post_color!false>bg-<@fun.randBgColor/></#if>">
                                <div class="item-label <#if settings.post_color!false>bg-<@fun.randBgColor/></#if>">
                                    <div class="item-title"><a href="${post.fullPath!}">${post.title!}</a></div>
                                    <div class="item-meta clearfix">
                                        <div class="item-meta-ico bg-ico-<@fun.randBgIco/>" style="background: url(${theme_base!}/source/images/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                                        <div class="item-meta-date"> ${post.createTime?string('MMM d,yyyy')} </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                <#else>
                <div class="post-list-item">没有找到内容,请换别的关键字进行检索</div>
                </#if>
			</div>
		</div>
	</div>
	<div class="lists-navigator clearfix">
        <#if posts.totalPages gt 1>
            <ol class="page-navigator">
                <@paginationTag method="search" page="${posts.number}" total="${posts.totalPages}" display="3" keyword="${keyword!}">
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
