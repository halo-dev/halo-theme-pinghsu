<#macro header title>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <#if settings.pinghsu_general_dns!false>
    <meta http-equiv="x-dns-prefetch-control" content="on">
    <link rel="dns-prefetch" href="//cdnjs.loli.net" />
    <link rel="dns-prefetch" href="//gravatar.loli.net" />
    </#if>

    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <@global.head />

    <title>${title!}</title>
    <meta name="keywords" content="${meta_keywords!}" />
    <meta name="description" content="${meta_description!}" />

    <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.17.1/build/styles/xcode.min.css">
    <link href="${theme_base!}/source/css/style.min.css" rel="stylesheet">
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
        <a href="${blog_url!}" class="navbar-logo">
            <#if blog_logo?? && blog_logo!=''>
            <img src="${blog_logo!}" title="${blog_title!}" />
            <#else>
            ${blog_title!}
            </#if>
        </a>
        <div class="navbar-menu">

            <@menuTag method="list">
                <#list menus?sort_by('priority') as menu>
                    <a href="${menu.url}" target="${menu.target!}">${menu.name}</a>
                </#list>
            </@menuTag>

        </div>

        <#if settings.search_page??>
        <a href="${settings.search_page!}" class="navbar-search">
            <span class="icon-search"></span>
        </a>
        <#else>
        <div class="navbar-search" onclick="">
            <span class="icon-search"></span>
            <form id="search" method="get" action="${blog_url!}/search" role="search">
                <span class="search-box">
                    <input type="text" id="input" class="input" name="keyword" required="true" placeholder="Search..." maxlength="30" autocomplete="off">
                </span>
            </form>
        </div>
        </#if>

        <div class="navbar-mobile-menu" onclick="">
            <span class="icon-menu cross"><span class="middle"></span></span>
            <ul>
                <@menuTag method="list">
                    <#list menus?sort_by('priority') as menu>
                    <li><a href="${menu.url}" target="${menu.target!}">${menu.name}</a></li>
                    </#list>
                </@menuTag>
            </ul>
        </div>
    </div>
</header>
</#macro>
