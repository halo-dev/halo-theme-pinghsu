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
<@header title="${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_desc!}"></@header>

<div class="main-content index-page clearfix <#if (options.pinghsu_style_post_list!'one') == 'one'>onelist-page</#if>">
	<div class="post-lists">
		<div class="post-lists-body">
			<#list posts.content as post>
                <#if (options.pinghsu_style_post_list!'one') == 'three'>
                <div class="post-list-item">
                    <div class="post-list-item-container">
                        <#if post.postThumbnail?? && post.postThumbnail!=''>
                            <div class="item-thumb <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor /></#if>" style="background-image:url(${post.postThumbnail!});"></div>
                        <#else>
                            <div class="item-thumb <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor /></#if>" style="background-image:url(/${themeName}/source/images/thumbs/<@fun.randThumbs/>);"></div>
                        </#if>
                        <a href="${options.blog_url!}/archives/${post.postUrl!}">
                            <div class="item-desc">
                                <p>${post.postSummary!}</p>
                            </div>
                        </a>
                        <div class="item-slant reverse-slant <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor /></#if>"></div>
                        <div class="item-slant"></div>
                        <div class="item-label">
                            <div class="item-title">
                                <a href="${options.blog_url!}/archives/${post.postUrl!}">${post.postTitle!}</a>
                            </div>
                            <div class="item-meta clearfix">
                                <div class="item-meta-ico bg-ico-<@fun.randBgIco />"
                                     style="background: url(/${themeName}/source/images/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
                                <div class="item-meta-cat">
                                    <#if post.categories?? && post.categories?size gt 0>
                                        <a href="${options.blog_url!}/categories/${post.categories[0].cateUrl}">${post.categories[0].cateName}</a>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </#if>
                <#if (options.pinghsu_style_post_list!'one') == 'one'>
                    <div class="post-onelist-item">
                        <div class="post-onelist-item-container">
                            <a href="${options.blog_url!}/archives/${post.postUrl}">
                                <#if post.postThumbnail?? && post.postThumbnail!=''>
                                    <div class="onelist-item-thumb <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>" style="background-image:url(${post.postThumbnail!});"></div>
                                <#else>
                                    <div class="onelist-item-thumb <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>" style="background-image:url(/${themeName}/source/images/thumbs/<@fun.randThumbs/>);"></div>
                                </#if>
                            </a>
                            <div class="onelist-item-info">
                                <div class="item-title">
                                    <a href="${options.blog_url!}/archives/${post.postUrl}">${post.postTitle!}</a>
                                </div>
                                <div class="item-meta">
                                    <time datetime="${post.postDate}" itemprop="datePublished">
                                        发布于 ${post.postDate?string('MMM d,yyyy')}
                                    </time>in
                                    <#if post.categories?? && post.categories?size gt 0>
                                        <a href="${options.blog_url!}/categories/${post.categories[0].cateUrl}">${post.categories[0].cateName}</a>
                                    </#if>
                                    </a>
                                </div>
                                <div class="item-meta-hr <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>"></div>
                                <div class="item-content">
                                    <p>${post.postSummary!}</p>
                                </div>
                                <div class="item-readmore">
                                    <a href="${options.blog_url!}/archives/${post.postUrl!}"> 继续阅读 → </a>
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
                <#if posts.hasPrevious()>
                    <#if posts.number == 1>
                        <li class="pre">
                            <a href="${options.blog_url!}/">←</a>
                        </li>
                    <#else>
                        <li class="pre">
                            <a href="${options.blog_url!}/page/${posts.number}">←</a>
                        </li>
                    </#if>
                </#if>
                <#list rainbow as r>
                    <#if r == posts.number+1>
                        <li class="current">
                            <a href="${options.blog_url!}/page/${r}">${r}</a>
                        </li>
                    <#else>
                        <li>
                            <a href="${options.blog_url!}/page/${r}">${r}</a>
                        </li>
                    </#if>
                </#list>
                <#if posts.hasNext()>
                    <li class="next">
                        <a href="${options.blog_url!}/page/${posts.number+2}/">→</a>
                    </li>
                </#if>
            </ol>
        </#if>
    </div>
</div>

<#include "footer.ftl">
