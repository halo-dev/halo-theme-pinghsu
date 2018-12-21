<#import "/common/macro/theme_option_marco.ftl" as option>
<@option.head />
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 themeImg">
            <img src="/${themeDir}/screenshot.png" style="width: 100%;">
        </div>
        <div class="col-md-6 themeSetting">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#general" data-toggle="tab">基本设置</a>
                    </li>
                    <li>
                        <a href="#style" data-toggle="tab">样式设置</a>
                    </li>
                    <li>
                        <a href="#sns" data-toggle="tab">社交资料</a>
                    </li>
                    <li>
                        <a href="#about" data-toggle="tab">关于</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- 基本设置 -->
                    <div class="tab-pane active" id="general">
                        <form method="post" class="form-horizontal" id="pinghsuGeneralOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pinghsuGeneralFooterLogo" class="col-sm-4 control-label">页尾 logo 地址：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="pinghsuGeneralFooterLogo" name="pinghsu_general_footer_logo" value="${options.pinghsu_general_footer_logo!}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('pinghsuGeneralFooterLogo')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuGeneralSearchPage" class="col-sm-4 control-label">搜索页地址 ：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="pinghsuGeneralSearchPage" name="pinghsu_general_search_page" value="${options.pinghsu_general_search_page!}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuGeneralPjax" class="col-sm-4 control-label">PJAX 加速设置：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_general_pjax" id="pinghsuGeneralPjax" value="true" ${((options.pinghsu_general_pjax!)=='true')?string('checked','')}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_general_pjax" id="pinghsuGeneralPjax" value="false" ${((options.pinghsu_general_pjax!'false')=='false')?string('checked','')}> 禁止
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuGeneralDns" class="col-sm-4 control-label">DNS 预解析加速：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_general_dns" id="pinghsuGeneralDns" value="true" ${((options.pinghsu_general_dns!)=='true')?string('checked','')}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_general_dns" id="pinghsuGeneralDns" value="false" ${((options.pinghsu_general_dns!'false')=='false')?string('checked','')}> 禁止
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuGeneralFastClick" class="col-sm-4 control-label">移动端点击延迟消除设置：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_general_fast_click" id="pinghsuGeneralFastClick" value="true" ${((options.pinghsu_general_fast_click!)=='true')?string('checked','')}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_general_fast_click" id="pinghsuGeneralFastClick" value="false" ${((options.pinghsu_general_fast_click!'false')=='false')?string('checked','')}> 禁止
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('pinghsuGeneralOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>
                    <!--样式设置-->
                    <div class="tab-pane" id="style">
                        <form method="post" class="form-horizontal" id="pinghsuStyleOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pinghsuStylePostList" class="col-sm-4 control-label">首页文章列表设置：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_list" id="pinghsuStylePostList" value="three" ${((options.pinghsu_style_post_list!)=='three')?string('checked','')}> 三栏
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_list" id="pinghsuStylePostList" value="one" ${((options.pinghsu_style_post_list!'one')=='one')?string('checked','')}> 单栏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuStylePostColor" class="col-sm-4 control-label">文章色块设置：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_color" id="pinghsuStylePostColor" value="true" ${((options.pinghsu_style_post_color!)=='true')?string('checked','')}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_color" id="pinghsuStylePostColor" value="false" ${((options.pinghsu_style_post_color!'false')=='false')?string('checked','')}> 禁用
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuStylePostPicture" class="col-sm-4 control-label">文章题图设置：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_picture" id="pinghsuStylePostPicture" value="true" ${((options.pinghsu_style_post_picture!)=='true')?string('checked','')}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_picture" id="pinghsuStylePostPicture" value="false" ${((options.pinghsu_style_post_picture!'false')=='false')?string('checked','')}> 禁用
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuStylePostToc" class="col-sm-4 control-label">文章目录设置：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_toc" id="pinghsuStylePostToc" value="true" ${((options.pinghsu_style_post_toc!)=='true')?string('checked','')}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_toc" id="pinghsuStylePostToc" value="false" ${((options.pinghsu_style_post_toc!'false')=='false')?string('checked','')}> 禁用
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuStylePostHighlight" class="col-sm-4 control-label">代码高亮设置：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_highlight" id="pinghsuStylePostHighlight" value="true" ${((options.pinghsu_style_post_highlight!)=='true')?string('checked','')}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_highlight" id="pinghsuStylePostHighlight" value="false" ${((options.pinghsu_style_post_highlight!'false')=='false')?string('checked','')}> 禁用
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pinghsuStylePostMathJax" class="col-sm-4 control-label">文章 Mathjax 设置：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_mathjax" id="pinghsuStylePostMathJax" value="true" ${((options.pinghsu_style_post_mathjax!)=='true')?string('checked','')}> 启用
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="pinghsu_style_post_mathjax" id="pinghsuStylePostMathJax" value="false" ${((options.pinghsu_style_post_mathjax!'false')=='false')?string('checked','')}> 禁用
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('pinghsuStyleOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>

                    <!-- 社交资料 -->
                    <div class="tab-pane" id="sns">
                        <form method="post" class="form-horizontal" id="pinghsuSnsOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pinghsuSnsWeibo" class="col-sm-4 control-label">输入微博链接：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="pinghsuSnsWeibo" name="pinghsu_sns_weibo" value="${options.pinghsu_sns_weibo!}" >
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pinghsuSnsZhihu" class="col-sm-4 control-label">输入知乎链接：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="pinghsuSnsZhihu" name="pinghsu_sns_zhihu" value="${options.pinghsu_sns_zhihu!}" >
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pinghsuSnsGithub" class="col-sm-4 control-label">输入 GitHub 链接：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="pinghsuSnsGithub" name="pinghsu_sns_github" value="${options.pinghsu_sns_github!}" >
                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="pinghsuSnsTwitter" class="col-sm-4 control-label">输入 Twitter 链接：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="pinghsuSnsTwitter" name="pinghsu_sns_twitter" value="${options.pinghsu_sns_twitter!}" >
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('pinghsuSnsOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>

                    <!-- 关于该主题 -->
                    <div class="tab-pane" id="about">
                        <div class="box box-widget widget-user-2">
                            <div class="widget-user-header bg-blue">
                                <div class="widget-user-image">
                                    <img class="img-circle" src="https://avatars2.githubusercontent.com/u/4998018?s=460&v=4" alt="User Avatar">
                                </div>
                                <h3 class="widget-user-username">Chakhsu.Lau</h3>
                                <h5 class="widget-user-desc">Coding for fun</h5>
                            </div>
                            <div class="box-footer no-padding">
                                <ul class="nav nav-stacked">
                                    <li><a target="_blank" href="https://www.linpx.com/">作者主页</a></li>
                                    <li><a target="_blank" href="https://github.com/chakhsu/pinghsu">原主题地址</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<@option.import_js />
