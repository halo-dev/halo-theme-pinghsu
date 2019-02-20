<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="分类：${category.cateName!} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_desc!}"></@header>
<div class="main-content common-page clearfix">
    <div class="common-item">
        <div class="common-title">
            Category : ${category.cateName!}
        </div>
        <div class="post-lists">
			<div class="post-lists-body">
				<#if posts?? && posts.content?size gt 0>
					<#list posts.content as post>
						<div class="post-list-item">
							<div class="post-list-item-container <#if (options.pinghsu_style_post_color!'false') == 'true'>bg-<@fun.randBgColor/></#if>">
								<div class="item-label <#if (options.pinghsu_style_post_color!'false') == 'true'>bg-<@fun.randBgColor/></#if>">
                                    <div class="item-title"><a href="${options.blog_url!}/archives/${post.postUrl!}">${post.postTitle!}</a></div>
									<div class="item-meta clearfix">
										<div class="item-meta-ico bg-ico-<@fun.randBgIco/>" style="background: url(/${themeName}/source/images/bg-ico.png) no-repeat;background-size: 40px auto;"></div>
										<div class="item-meta-date"> ${post.postDate?string('MMM d,yyyy')} </div>
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
                <#if posts.hasPrevious()>
					<#if posts.number == 1>
                        <li class="prev">
                            <a href="${options.blog_url!}/categories/${category.cateUrl!}">←</a>
                        </li>
					<#else>
                        <li class="prev">
                            <a href="${options.blog_url!}/categories/${category.cateUrl!}/page/${posts.number}">←</a>
                        </li>
					</#if>
				</#if>
                <#list rainbow as r>
					<#if r == posts.number+1>
                        <li class="current">
                            <a href="${options.blog_url!}/categories/${category.cateUrl!}/page/${r}">${r}</a>
                        </li>
					<#else>
                        <li>
                            <a href="${options.blog_url!}/categories/${category.cateUrl!}/page/${r}">${r}</a>
                        </li>
					</#if>
				</#list>
                <#if posts.hasNext()>
                    <li class="next">
                        <a href="${options.blog_url!}/categories/${category.cateUrl!}/page/${posts.number+2}">→</a>
                    </li>
				</#if>
            </ol>
		</#if>
    </div>
</div>

<#include "footer.ftl">
