<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/statics/images/favicon.png" type="image/x-icon">

    <title>Shortcodes</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/fonts/Lato/Lato.css">

    <!-- Icons -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/fonts/flaticon/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/fonts/webfont/css/materialdesignicons.min.css">

    <!-- Libs -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/libs/bootstrap-4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/libs/select2/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/libs/slick/slick.css">

    <!-- Theme -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/assets/css/style.css">
    <meta name="theme-color" content="#ECECEC">
</head>
<body>
    <div class="head-line"></div>

    <!-- head -->
<%@ include file="ClientCommon/ClientCommon_header.jsp" %>

    <div class="page-wrap single blog">

        <!-- Breadcrumbs -->
        <nav aria-label="breadcrumb" class="page-breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item"><a href="blog.html">Blog</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Advertising and Internet a Long Term Relationship</li>
                </ol>
            </div>
        </nav>

        <!-- Page content -->
        <div class="page-content">
            <div class="container">
                <div class="row justify-content-between">
                    <main id="main" class="main-content col-lg-8">
                        <article class="post-content">
                            <div class="post-thumb">
                                <img src="${pageContext.request.contextPath}/statics/file/${blogs.blogPhoto }" alt="">
                            </div>

                            <h1 class="h3 post-title">${blogs.blogTitle }</h1>

                            <div class="post-date">
                            <fmt:formatDate value="${blogs.blogCreateDate }" pattern="yyyy-MM-dd"/>
							</div>

                            <div class="post-text">
                                <p>${blogs.blogMessage }</p>

                            </div>
                        </article> <!-- /.post-content -->

                        <section class="comments">
                            <h3 class="mb-40">3 comments</h3>
                            <ul class="comment-list">
                                <li class="comment">
                                    <div class="comment-body">
                                        <div class="comment-avatar">
                                            <img src="${pageContext.request.contextPath}/statics/images/13_blog_details_page_005.jpg" alt="">
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-author">Leo Daniels</div>
                                            <div class="comment-date">14 Oct 2016 at 16:41am</div>
                                            <div class="comment-text">Increasing prosperity in our lives can be accomplished
                                                by having the right frame of mind. The truth is, our thoughts are very
                                                powerful.</div>
                                            <div class="comment-reply">
                                                <button type="button" class="btn btn-outline-primary btn-sm">Reply</button>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="children">
                                        <li class="comment">
                                            <div class="comment-body">
                                                <div class="comment-avatar">
                                                    <img src="${pageContext.request.contextPath}/statics/images/13_blog_details_page_006.jpg" alt="">
                                                </div>
                                                <div class="comment-content">
                                                    <div class="comment-author">Florence Curry</div>
                                                    <div class="comment-date">07 Feb 2016 at 14:11am</div>
                                                    <div class="comment-text">Notes are very powerful. </div>
                                                    <div class="comment-reply">
                                                        <button type="button" class="btn btn-outline-primary btn-sm">Reply</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="comment">
                                    <div class="comment-body">
                                        <div class="comment-avatar">
                                            <img src="${pageContext.request.contextPath}/statics/images/13_blog_details_page_007.jpg" alt="">
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-author">Paul Gutierrez</div>
                                            <div class="comment-date">21 Jul 2015 at 15:34 am</div>
                                            <div class="comment-text">It is never too late to become what you might have
                                                been.</div>
                                            <div class="comment-reply">
                                                <button type="button" class="btn btn-outline-primary btn-sm">Reply</button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <div class="comment-respond">
                                <h3 class="mb-4">Post a comment</h3>

                                <form class="comment-form">
                                    <div class="form-row">
                                        <div class="form-group col-lg-6">
                                            <input type="text" class="form-control" placeholder="Name">
                                        </div>
                                        <div class="form-group col-lg-6">
                                            <input type="text" class="form-control" placeholder="Last name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <textarea rows="4" class="form-control" placeholder="Your message"></textarea>
                                    </div>
                                    <div class="form-submit mt-3">
                                        <input type="submit" class="btn btn-primary btn-lg" value="Post comment"/>
                                    </div>
                                </form>
                            </div>
                        </section>
                    </main>

                    <aside class="sidebar col-lg-3">
                        <div class="sidebar-widget">
                            <h4 class="widget-title">Categories</h4>
                            <ul>
                                <li><a href="shop.html">Art</a></li>
                                <li><a href="shop.html">Clocks</a></li>
                                <li><a href="shop.html">Furniture</a></li>
                                <li><a href="shop.html">Gadgets</a></li>
                                <li><a href="shop.html">Lighting</a></li>
                                <li><a href="shop.html">Placemats</a></li>
                                <li><a href="shop.html">Workspace</a></li>
                                <li><a href="shop.html">Sale</a></li>
                            </ul>
                        </div>
                        
                    </aside> <!-- /.sidebar -->
                </div> <!-- /.row-->
            </div> <!-- /.container-->
        </div> <!-- /.page-content-->

    </div> <!-- /.page-wrap-->

    <!-- footer -->
<%@ include file="ClientCommon/ClientCommon_footer.jsp" %>

    <div id="js-back-to-top" class="back-to-top"><i class="flaticon-up-arrow-sign"></i> Page top</div>

    <div class="full-search-wrap">
        <div class="full-search container">
            <div class="close-s float-right js-close-search flaticon-cancel-button fi-2x"></div>
            <form action="/" class=" search-full-form">
                <div class="position-relative">
                    <i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
                    <input type="text" id="s-full" class="search-full-form__input" placeholder="Search">
                    <input type="submit" class="d-none">
                </div>
                <p class="hint">Type in your search and press enter</p>
            </form>
        </div>
    </div>


    <!-- Libs -->
    <script src="${pageContext.request.contextPath}/statics/libs/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/libs/bootstrap-4.3.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/libs/select2/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/libs/slick/slick.min.js"></script>

    <!-- Theme -->
    <script src="${pageContext.request.contextPath}/statics/assets/js/custom.js"></script>
</body>
</html>