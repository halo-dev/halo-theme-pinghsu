<#include "/common/macro/common_macro.ftl">
<#macro header title,keywords,description>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <#if (options.pinghsu_general_dns!'false') == 'true'>
    <meta http-equiv="x-dns-prefetch-control" content="on">
    <link rel="dns-prefetch" href="//cdnjs.loli.net" />
    <link rel="dns-prefetch" href="//gravatar.loli.net" />
    </#if>

    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <@verification></@verification>
    <@favicon></@favicon>

    <title>${title!}</title>
    <meta name="keywords" content="${keywords!}" />
    <meta name="description" content="${description!}" />

    <link href="//cdnjs.loli.net/ajax/libs/highlight.js/9.10.0/styles/xcode.min.css" rel="stylesheet">
    <link href="/${themeName}/source/css/style.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="//cdnjs.loli.net/ajax/libs/html5shiv/r29/html5.min.js"></script>
    <script src="//cdnjs.loli.net/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="<#if is_index??>bg-grey</#if>" gtools_scp_screen_capture_injected="true">
<!--[if lt IE 8]>
<div class="browsehappy" role="dialog">
    当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/" target="_blank">升级你的浏览器</a>。
</div>
<![endif]-->
<header id="header" class="header bg-white">
    <div class="navbar-container">
        <a href="${options.blog_url!}" class="navbar-logo">
            <#if options.blog_logo??>
            <img src="${options.blog_logo!}" alt="${options.blog_title!}" />
            <#else>
            ${options.blog_title!}
            </#if>
        </a>
        <div class="navbar-menu">

            <@commonTag method="menus">
                <#list menus?sort_by('menuSort') as menu>
                    <a href="${menu.menuUrl}" target="${menu.menuTarget!}">${menu.menuName}</a>
                </#list>
            </@commonTag>

        </div>

        <#if options.pinghsu_general_search_page??>
        <a href="${options.pinghsu_general_search_page!}" class="navbar-search">
            <span class="icon-search"></span>
        </a>
        <#else>
        <div class="navbar-search" onclick="">
            <span class="icon-search"></span>
            <form id="search" method="get" action="${options.blog_url!}/search" role="search">
                <span class="search-box">
                    <input type="text" id="input" class="input" name="keyword" required="true" placeholder="Search..." maxlength="30" autocomplete="off">
                </span>
            </form>
        </div>
        </#if>

        <div class="navbar-mobile-menu" onclick="">
            <span class="icon-menu cross"><span class="middle"></span></span>
            <ul>
                <@commonTag method="menus">
                    <#list menus?sort_by('menuSort') as menu>
                    <li><a href="${menu.menuUrl}" target="${menu.menuTarget!}">${menu.menuName}</a></li>
                    </#list>
                </@commonTag>
            </ul>
        </div>
    </div>
</header>
</#macro>
