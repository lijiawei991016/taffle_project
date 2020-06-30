<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="statics/images/favicon.png" type="image/x-icon">

    <title>Promo</title>

    <!-- Theme -->
    <link rel="stylesheet" href="statics/assets/css/all.min.css">
    <meta name="theme-color" content="#ECECEC">
</head>
<body>
    <div class="head-line"></div>

    <!-- head -->
<%@ include file="ClientCommon/ClientCommon_header.jsp" %>

    <div class="page-wrap">
        <div class="page-content">
            <main class="main-content">
                <section class="promo-hero text-center d-flex flex-column justify-content-center align-items-center" style="background-image: url(statics/images/10_promo_page_001.jpg);">
                    <div class="container">
                        <h1 class="promo-hero__title">Discover unique products, buy it in one place</h1>
                        <div class="promo-hero__text">Our products never go out of style</div>

                        <div class="promo-hero__scroll" id="js-scroll-down">
                            Scroll down<br><i class="flaticon-down-chevron"></i>
                        </div>
                    </div>
                </section>

                <section class="promo-section" id="scroll-to">
                    <div class="container">
                        <div class="row justify-content-end">
                            <div class="col-lg-5 promo-section__img">
                                <img src="statics/images/10_promo_page_002.jpg" alt="">
                            </div>
                            <div class="col-lg-7 promo-section__card">
                                <div class="promo-card">
                                    <a href="single-product.html">
                                        <img src="statics/images/10_promo_page_003.jpg" alt="" class="promo-card__img">
                                    </a>
                                    <div class="promo-card__content">
                                        <h2 class="promo-card__title"><a href="single-product.html">Dutch grey bag</a></h2>
                                        <div class="promo-card__text">Style and functionality go hand in hand</div>
                                        <a href="single-product.html" class="btn btn-primary btn-lg">discover</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="promo-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-7 promo-section__card">
                                <div class="promo-card promo-card-offset-left">
                                    <a href="single-product.html">
                                        <img src="statics/images/10_promo_page_005.jpg" alt="" class="promo-card__img">
                                    </a>
                                    <div class="promo-card__content">
                                        <h2 class="promo-card__title"><a href="single-product.html">PEARL PAPER CLUTCH</a></h2>
                                        <div class="promo-card__text">The bottom is structured by an inside plastic rectangle cut</div>
                                        <a href="single-product.html" class="btn btn-primary btn-lg">discover</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 promo-section__img">
                                <img src="statics/images/10_promo_page_004.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </section>


                <section class="promo-featured">
                    <div class="container">
                        <h3 class="section-title text-center">Featured products</h3>

                        <ul class="products featured-products columns-4">
                            <li class="product">
                                <div class="product-thumb">
                                    <span class="onsale">-30%</span>
                                    <a href="single-product.html" class="product-thumb__link">
                                        <img src="statics/images/01_home_page_005.jpg" alt="">
                                        <span class="btn btn-outline-light shop-link">Shop</span>
                                    </a>
                                </div>
                                <div class="product-title"><a href="single-product.html">Cogen warm lamp</a></div>
                                <div class="price">
                                    <ins><span class="amount">$56.00</span></ins>
                                    <del><span class="amount">$73.00</span></del>
                                </div>
                            </li>
                            <li class="product">
                                <div class="product-thumb">
                                    <a href="single-product.html" class="product-thumb__link">
                                        <img src="statics/images/02_catalogue_page_004.jpg" alt="">
                                        <span class="btn btn-outline-light shop-link">Shop</span>
                                    </a>
                                </div>
                                <div class="product-title"><a href="single-product.html">STONE CARPET</a></div>
                                <div class="price">
                                    <span class="amount">$34.00</span>
                                </div>
                            </li>
                            <li class="product">
                                <div class="product-thumb">
                                    <a href="single-product.html" class="product-thumb__link">
                                        <img src="statics/images/01_home_page_007.jpg" alt="">
                                        <span class="btn btn-outline-light shop-link">Shop</span>
                                    </a>
                                </div>
                                <div class="product-title"><a href="single-product.html">Wood tablet deck</a></div>
                                <div class="price">
                                    <span class="amount">$30.00</span>
                                </div>
                            </li>
                            <li class="product">
                                <div class="product-thumb">
                                    <a href="single-product.html" class="product-thumb__link">
                                        <img src="statics/images/01_home_page_008.jpg" alt="">
                                        <span class="btn btn-outline-light shop-link">Shop</span>
                                    </a>
                                </div>
                                <div class="product-title"><a href="single-product.html">Roniq watch</a></div>
                                <div class="price">
                                    <span class="amount">$128.00</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>


                <section class="promo-section">
                    <div class="container">
                        <div class="row justify-content-end">
                            <div class="col-lg-5 promo-section__img">
                                <img src="statics/images/10_promo_page_006.jpg" alt="">
                            </div>
                            <div class="col-lg-7 promo-section__card">
                                <div class="promo-card">
                                    <a href="single-product.html">
                                        <img src="statics/images/10_promo_page_007.jpg" alt="" class="promo-card__img">
                                    </a>
                                    <div class="promo-card__content">
                                        <h2 class="promo-card__title"><a href="single-product.html">MacBook Folio Sleeve</a></h2>
                                        <div class="promo-card__text">Style and functionality go hand in hand</div>
                                        <a href="single-product.html" class="btn btn-primary btn-lg">discover</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="section-subscribe subscribe-wrap-promo" style="background-image:url(statics/images/10_promo_page_008.jpg)">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-6">
                                <div class="subscribe-form d-flex flex-column justify-content-center align-items-center">
                                    <div class="section-title section-title-w-text text-center">
                                        <h2 class="h3 section-title__heading">Newsletter subscription</h2>
                                        <div class="section-title__text">Newest products, promotions and sales</div>
                                    </div>

                                    <form class="form-inline w-100">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg subscribe-form__input" placeholder="E-mail adress">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-lg subscribe-form__btn">subscribe</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

            </main>
        </div>
    </div>

    <!-- footer -->
<%@ include file="ClientCommon/ClientCommon_footer.jsp" %>

    <div id="js-back-to-top" class="back-to-top"><i class="flaticon-up-arrow-sign"></i> Page top</div>

    <div class="full-search-wrap">
        <div class="full-search container">
            <div class="close-s float-right js-close-search flaticon-cancel-button fi-2x"></div>
            <form action="/" class="search-full-form">
                <div class="position-relative">
                    <i class="search-icon flaticon-magnifying-glass-browser fi-2x"></i>
                    <input type="text" id="s-full" class="search-full-form__input" placeholder="Search">
                    <input type="submit" class="d-none">
                </div>
                <p class="hint">Type in your search and press enter</p>
            </form>
        </div>
    </div>

    <!-- Theme -->
    <script src="statics/assets/js/all.min.js"></script>
</body>
</html>