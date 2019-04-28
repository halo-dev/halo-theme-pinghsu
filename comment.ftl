<style>
    .comment-wrap{
        background-color: #fff;
    }
</style>
<div class="comment-container">
    <div id="comments" class="clearfix">
        <#if !post.disallowComment>
            <#include "/common/comment/comment.ftl">
        </#if>
    </div>
</div>
