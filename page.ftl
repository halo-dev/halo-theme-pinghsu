<#include "header.ftl">
<@header title="${post.title!} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_desc!}"></@header>

<article class="main-content page-page">
	<div class="post-header">
		<h1 class="post-title" itemprop="name headline">
			${post.title}
		</h1>
		<div class="post-data">
			<time datetime="${post.createTime!}" itemprop="datePublished">Published on ${post.createTime?string('MMM d,yyyy')}</time>
		</div>
	</div>
	<div id="post-content" class="post-content">
		${post.formatContent!}
	</div>
</article>

<#include "comment.ftl">

<#include "footer.ftl">
