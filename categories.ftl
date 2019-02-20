<#--
* Template Page of Categorys Archives
*
* @package custom
-->
<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="分类 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_desc!}"></@header>
<div class="main-content archive-page clearfix">
	<#if categories?? && categories?size gt 0>
		<#list categories as cate>
            <div class="categorys-item">
                <div class="categorys-title">
                    <a href="${options.blog_url!}/categories/${cate.cateUrl!}">${cate.cateName!}</a><span> ：${cate.posts?size}</span>
                </div>
                <#if cate.posts?? && cate.posts?size gt 0>
            		<div class="post-lists">
						<div class="post-lists-body">
							<#list cate.posts as post>
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
	</#if>
</div>

<#include "footer.ftl">
