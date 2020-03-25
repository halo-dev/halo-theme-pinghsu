<#--
/**
 * Pinghsu是一款以前端性能优化为出发点而制作的Typecho主题，同时又兼顾设计美学和视觉传达。主题命名取自作者姓名和其女朋友姓名的最后一个字的港式英文，挣扎于Hsuping还是Pinghsu，最后取为Pinghsu，意为一切都是Ping先Hsu后，即系要听女朋友的话。
 *
 * @package Pinghsu Theme
 * @author Chakhsu Lau
 * @version 1.5.4
 * @link https://www.linpx.com/
 */
-->
<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="${blog_title!}"></@header>

<div class="main-content index-page clearfix <#if (settings.post_list!'one') == 'one'>onelist-page</#if>">
	<div class="post-lists">
		<div class="post-lists-body">
			<#list posts.content as post>
                <#if (settings.post_list!'one') == 'three'>
                <div class="post-list-item">
                    <div class="post-list-item-container">
                        <#if post.thumbnail?? && post.thumbnail!=''>
                            <div class="item-thumb <#if !settings.post_color!false> bg-deepgrey<#else >bg-<@fun.randBgColor /></#if>" style="background-image:url(${post.thumbnail!});"></div>
                        <#else>
                            <div class="item-thumb <#if !settings.post_color!false> bg-deepgrey<#else >bg-<@fun.randBgColor /></#if>" style="background-image:url(${theme_base!}/source/images/thumbs/<@fun.randThumbs/>);"></div>
                        </#if>
                        <a href="${post.fullPath!}">
                            <div class="item-desc">
                                <p>${post.summary!}</p>
                            </div>
                        </a>
                        <div class="item-slant reverse-slant <#if !settings.post_color!false> bg-deepgrey<#else >bg-<@fun.randBgColor /></#if>"></div>
                        <div class="item-slant"></div>
                        <div class="item-label">
                            <div class="item-title">
                                <a href="${post.fullPath!}">${post.title!}</a>
                            </div>
                            <div class="item-meta clearfix">
                                <div class="item-meta-ico bg-ico-<@fun.showBgIco post.id />"
                                     style="background: url(${theme_base!}/source/images/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                                <div class="item-meta-cat">
                                    <#if post.categories?? && post.categories?size gt 0>
                                        <a href="${post.categories[0].fullPath!}">${post.categories[0].name}</a>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </#if>
                <#if (settings.post_list!'one') == 'one'>
                    <div class="post-onelist-item">
                        <div class="post-onelist-item-container">
                            <a href="${post.fullPath!}">
                                <#if post.thumbnail?? && post.thumbnail!=''>
                                    <div class="onelist-item-thumb <#if !settings.post_color!false> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>" style="background-image:url(${post.thumbnail!});"></div>
                                <#else>
                                    <div class="onelist-item-thumb <#if !settings.post_color!false> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>" style="background-image:url(${theme_base!}/source/images/thumbs/<@fun.randThumbs/>);"></div>
                                </#if>
                            </a>
                            <div class="onelist-item-info">
                                <div class="item-title">
                                    <a href="${post.fullPath!}">${post.title!}</a>
                                </div>
                                <div class="item-meta">
                                    <time datetime="${post.createTime}" itemprop="datePublished">
                                        发布于 ${post.createTime?string('MMM d,yyyy')}
                                    </time>in
                                    <#if post.categories?? && post.categories?size gt 0>
                                        <a href="${post.categories[0].fullPath!}">${post.categories[0].name}</a>
                                    </#if>
                                    </a>
                                </div>
                                <div class="item-meta-hr <#if !settings.post_color!false> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>"></div>
                                <div class="item-content">
                                    <p>${post.summary!}</p>
                                </div>
                                <div class="item-readmore">
                                    <a href="${post.fullPath!}"> 继续阅读 → </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
			</#list>
		</div>
	</div>
	<div class="lists-navigator clearfix">
        <#if posts.totalPages gt 1>
            <ol class="page-navigator">
                <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
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
