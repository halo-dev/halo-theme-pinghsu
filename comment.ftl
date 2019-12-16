<style>
    .comment-container{
        z-index: 3!important;
    }
</style>
<#macro comment post,type>
    <#if !post.disallowComment!false>
        <div class="comment-container">
            <div id="comments" class="clearfix" style="padding: 20px;">
                <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
                <script src="${options.comment_internal_plugin_js!'//cdn.jsdelivr.net/gh/halo-dev/halo-comment@latest/dist/halo-comment.min.js'}"></script>
                <halo-comment id="${post.id?c}" type="${type}"/>
            </div>
        </div>
    </#if>
</#macro>