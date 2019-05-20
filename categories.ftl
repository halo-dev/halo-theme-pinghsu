<#--
* Template Page of Categorys Archives
*
* @package custom
-->
<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="分类 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}"></@header>
<div class="main-content archive-page clearfix">
	<@categoryTag method="list">
		<#if categories?? && categories?size gt 0>
			<#list categories as cate>
				<div class="categorys-item">
					<div class="categorys-title">
						<a href="${context!}/categories/${cate.slugName!}">${cate.name!}</a><span> ：${cate.postCount!0}</span>
					</div>
					<@postTag method="listByCategoryId" categoryId="${cate.id!}">
						<#if posts?? && posts?size gt 0>
							<div class="post-lists">
								<div class="post-lists-body">
									<#list posts as post>
										<div class="post-list-item">
											<div class="post-list-item-container">
												<div class="item-label">
													<div class="item-title"><a href="${context!}/archives/${post.url!}">${post.title!}</a></div>
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
					</@postTag>
				</div>
			</#list>
		</#if>
	</@categoryTag>
</div>

<#include "footer.ftl">
