<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customer/mypage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <!--Font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Sawarabi+Gothic&display=swap" rel="stylesheet">
    <title>旅行はどこ?ここ!　ホテル・航空券・レンタカー</title>
</head>
<body>
<header>
    <div class="hd-menu">
        <div class="logo-con">
            <span><a href="CustomerController?viewPage=index" class="logo-con-link">旅行はここ</a></span>
        </div>
        <div class="func_con">
            <div class="ordersearch-btn"><a href="">予約照会・変更・キャンセル</a></div>
            <div class="notice-btn"><a href="">お知らせ</a></div>
            <div class="account-con">
                <span><button type="button" class="account-btn" onclick="openloginModal()">ログイン</button></span>
                <span><button type="button" class="account-btn" onclick="openregisterModal()">会員登録</button></span>
            </div>
        </div>
    </div>
        <div class="login-modal-con" id="login-modal-con">
            <div class="login-modal">
                <form action="">
                    <button class="close-btn" type="button" onclick="closeloginModal()">X</button>
                    <h2>ログイン</h2>
                    <div class="login-email">
                        <h4>メールアドレス</h4>
                        <input type="email" name="" placeholder="Email">
                    </div>
                    <div class="login-pw">
                        <h4>パスワード</h4>
                        <input type="password" name="" placeholder="Password">
                    </div>
                    <div class="login-etc">
                        <div class="forgot-pw">
                        <button type="button" id="forgot-link" >ID又はPasswordを忘れた場合</button>
                        </div>
                        <div class="register-link">
                            <button type="button" id="register-link">アカウントを作成</button>
                        </div>
                    </div>
                    <div class="login-submit">
                        <input type="submit" value="ログイン">
                    </div>
                </form>
            </div>
        </div>
        <div  class="register-modal-con" id="register-modal-con" >
            <div class="register-modal">
                <form action="">
                    <button type="button" class="close-btn"  onclick="closeregisterModal()">X</button>
                    <h2>アカウント作成</h2>
                    <div class="register-item">
                        <h4>メールアドレス</h4>
                        <input type="email" name="" placeholder="Email">
                    </div>
                    <div class="register-item">
                        <h4>パスワード</h4>
                        <input type="password" name=""placeholder="Password">
                    </div>
                    <div class="register-item">
                        <h4>確認パスワード</h4>
                        <input type="password" name="" placeholder="Re-enter-Password">
                    </div>
                    <div class="login-item">
                        <button type="button" id="login-link">既にアカウントがある方ログイン</button>
                    </div>
                    <div class="register-submit">
                        <input type="submit" value="アカウントを作成">
                    </div>
                </form>
            </div>
        </div>
        <div  class="forgot-modal-con" id="forgot-modal-con" >
            <div class="forgot-modal">
                <form action="">
                    <button type="button" class="close-btn"  onclick="closeforgotModal()">X</button>
                    <h2>パスワードアシスタント</h2>
                    <div class="forgot-item">
                        <h4>メールアドレス</h4>
                        <input type="email" name="" placeholder="Email">
                    </div>
                    <div class="forgot-submit">
                        <input type="submit" value="次に進む">
                    </div>
                </form>
            </div>
        </div>
    <div class="nav-con">
        <ul><!--後でNav押したらActive状態にさせ、bg-colorが適用されるように-->
            <li class="nav-item" id="nav-hotel"><a href="../Hotel/hotel_list.html"  id="hotel-nav"  class="nav-link">ホテル</a></li>
            <li class="nav-item"><a href=""  id="air-nav" class="nav-link">航空券</a></li>
            <li class="nav-item"><a href=""  id="rent-nav" class="nav-link">レンタカー</a></li>
            <li class="nav-item"><a href="" >ツアー</a></li>
            <li class="nav-item"><a href="" >イベント</a></li>
            <li class="nav-item"><a href="" >初めての方へ</a></li>
            <li class="nav-item"><a href="" > クチコミ</a></li>
        </ul>
    </div>
</header>
    <main>
        <div class="container-box">
            <div class="container">
                <div class="main-box">
                    <div class="main-nav">
                        <a href="" class="main-item active"><span>全て</span></a>
                        <a href=""><span>決済待ち</span></a>
                        <a href=""><span>新規予約</span></a>
                        <a href=""><span>レビュー済み</span></a>
                    </div>
                    <div class="search-bar">
                        <form action="">
                            <select name="" id="selecttab" class="selecttab" >
                                <option value="1" selected>予約番号</option>
                                <option value="2">予約日付</option>
                            </select>
                            <div class="search-item" id="search-number">
                                <input type="text" placeholder="予約番号を入力してください">
                            </div>
                            <div class="search-item" id="search-date">
                                <input type="date">
                            </div>
                            <button type="submit">検索</button>
                        </form>
                    </div>
                    <div class="content-box">
                        <form action="">
                            <div class="content-title">
                                <div class="content-title-item">予約番号 : 321543534</div>
                                <div class="content-title-item">KIM-sodsaoda-doadoas</div>
                                <div class="content-title-item">2022-09-12</div>
                                <div class="content-title-item" id="content-submit"><button type="submit">予約キャンセル</button></div>
                            </div>
                            <div class="content-main">
                                <div class="hotel-title"><a href="" target="_blank" title="ホテル情報を見る">新宿ホテル</a></div>
                                <div class="hotel-address"><span>7-10-5 西新宿 新宿区 東京都 160-0023</span></div>
                                <div class="hotel-address"></div>
                                <div class="hotel-booking-date">2022年09月12日 <span>-</span> 2022年09月15日</div>
                                <div class="hotel-checkin-time">
                                    <span>チェックイン：15時から</span>
                                    <div class="booking-price">24,500円</div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="content-box">
                        <form action="">
                            <div class="content-title">
                                <div class="content-title-item">予約番号 : 321543534</div>
                                <div class="content-title-item">KIM-sodsaoda-doadoas</div>
                                <div class="content-title-item">2022-09-12</div>
                                <div class="content-title-item" id="content-submit"><button type="button" onclick="openreviewModal()">レビュー作成</button></div>
                            </div>
                            <div class="content-main">
                                <div class="hotel-title"><a href="" target="_blank" title="ホテル情報を見る">新宿ホテル</a></div>
                                <div class="hotel-address"><span>7-10-5 西新宿 新宿区 東京都 160-0023</span></div>
                                <div class="hotel-address"></div>
                                <div class="hotel-booking-date">2022年09月12日 <span>-</span> 2022年09月15日</div>
                                <div class="hotel-checkin-time">
                                    <span>チェックイン：15時から</span>
                                    <div class="booking-price">24,500円</div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="content-box">
                        <form action="">
                            <div class="content-title">
                                <div class="content-title-item">予約番号 : 321543534</div>
                                <div class="content-title-item">KIM-sodsaoda-doadoas</div>
                                <div class="content-title-item">2022-09-12</div>
                                <div class="content-title-item" id="content-submit"><button type="submit">予約キャンセル</button></div>
                            </div>
                            <div class="content-main">
                                <div class="hotel-title"><a href="" target="_blank" title="ホテル情報を見る">新宿ホテル</a></div>
                                <div class="hotel-address"><span>7-10-5 西新宿 新宿区 東京都 160-0023</span></div>
                                <div class="hotel-address"></div>
                                <div class="hotel-booking-date">2022年09月12日 <span>-</span> 2022年09月15日</div>
                                <div class="hotel-checkin-time">
                                    <span>チェックイン：15時から</span>
                                    <div class="booking-price">24,500円</div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="content-box">
                        <form action="">
                            <div class="content-title">
                                <div class="content-title-item">予約番号 : 321543534</div>
                                <div class="content-title-item">KIM-sodsaoda-doadoas</div>
                                <div class="content-title-item">2022-09-12</div>
                                <div class="content-title-item" id="content-submit"><button type="submit">予約キャンセル</button></div>
                            </div>
                            <div class="content-main">
                                <div class="hotel-title"><a href="" target="_blank" title="ホテル情報を見る">新宿ホテル</a></div>
                                <div class="hotel-address"><span>7-10-5 西新宿 新宿区 東京都 160-0023</span></div>
                                <div class="hotel-address"></div>
                                <div class="hotel-booking-date">2022年09月12日 <span>-</span> 2022年09月15日</div>
                                <div class="hotel-checkin-time">
                                    <span>チェックイン：15時から</span>
                                    <div class="booking-price">24,500円</div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="page-btn-con">
                        <div class="page-btn">
                            <a href="" id="before-btn">≪</a>
                            <a href="" class="page active">1</a>
                            <a href="" class="page">2</a>
                            <a href="" class="page">3</a>
                            <a href="" class="page">4</a>
                            <a href="" class="page">5</a>
                            <a href="" id="after-btn">≫</a>
                        </div>
                    </div>
                </div>
                <div class="side-bar-con">
                    <ul class="side-nav">
                        <li class="side-item"><button type="button">My予約</button>
                            <ul class="submenu">
                                <li class="item active"><a href="">全て</a></li>
                                <li class="item"><a href="">ホテル</a></li>
                                <li class="item"><a href="">航空券</a></li>
                                <li class="item"><a href="">レンタカー</a></li>
                            </ul>
                        </li>
                        <li class="side-item"><button type="button">Myアカウント</button>
                            <ul class="submenu">
                                <li><a href="">登録情報</a></li> <!--password && email can't update-->
                                <li><a href="">アカウント及びパスワード</a></li><!--only can update to password-->
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="review-modal-con" id="review-modal-con">
            <div class="review-modal">
                <form action="">
                    <button type="button" class="close-btn" onclick="closereviewModal()">X</button>
                    <div class="review-title"><span>新宿ホテル</span></div>
                    <div class="review-content"><textarea placeholder="レビュー内容" maxlength="2048"></textarea></div>
                    <div class="review-score-box">
                        <div class="review-item"><label><input type="radio" name="review-item" value="2" >★2</label></div>
                        <div class="review-item" ><label><input type="radio" name="review-item" value="3" >★3</label></div>
                        <div class="review-item"><label><input type="radio" name="review-item" value="4" >★4</label></div>
                        <div class="review-item" ><label><input type="radio" name="review-item" value="5" >★5</label></div>
                    </div>
                    <div class="booking-date">
                        <span>利用日付</span>
                        <span>2021年6月7日</span>
                    </div>
                    <div class="write-review-btn">
                        <input type="submit" value="レビュー作成"></button>
                    </div>
                </form>
            </div>
        </div>
    </main>
<footer>
   <p> &copy; This is Travel Site</p>
</footer>
<div class="top-btn-con">
    <button type="button" class="go-top">↑</button>
</div>
<!--Jquery CDN JqueryがJSより上にする-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common-jquery.js" charset="UTF-8"></script>
<!--このようにするのかわからない。。。-->
<script src="${pageContext.request.contextPath}/js/member/mypage.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/js/common.js" charset="UTF-8"></script>
</body>
</html>