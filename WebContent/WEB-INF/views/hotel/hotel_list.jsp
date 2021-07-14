<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/hotel/hotel_list.css">
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
            <div class="ordersearch-btn"><a href="CustomerController?viewPage=mypage">予約照会・変更・キャンセル</a></div>
            <div class="notice-btn"><a href="">お知らせ</a></div>
            <c:choose>
	            <c:when test="${sessionScope.customer eq null }">
		            <div class="account-con">
		                <span><button type="button" class="account-btn" onclick="openloginModal()">ログイン</button></span>
		                <span><button type="button" class="account-btn" onclick="openregisterModal()">会員登録</button></span>
		            </div>
	            </c:when>
	            <c:otherwise>
		           <div class="myaccount-con">
			            <ul class="account-drop">
			                <li class="drop-item"><button type="button">ログイン中、ようこそ。</button>
			                    <ul class="dropmenu">
			                        <li class="item"><a href="CustomerController?action=CustomerLogout">ログアウト</a></li>
			                        <li class="item"><a href="">menu2</a></li>
			                        <li class="item"><a href="">menu3</a></li>
			                    </ul>
			                </li>
			            </ul>
		        	</div>
	            </c:otherwise>
            </c:choose>
        </div>
    </div>
    <c:if test="${sessionScope.customer eq null }">
        <div class="login-modal-con" id="login-modal-con">
            <div class="login-modal">
                <form action="CustomerController" method="POST" id="loginForm">
                <input type="hidden" name="action" value="CustomerLogin">
                    <button class="close-btn" type="button" onclick="closeloginModal()">X</button>
                    <h2>ログイン</h2>
                    <div class="login-email">
                        <h4>メールアドレス</h4>
                        <input type="email" name="customerEmail" id="loginEmail" maxlength="30" placeholder="Email" autocomplete="off">
                    </div>
                    <c:if test="${requestScope.loginMsg ne null }">
                    	${requestScope.loginMsg }
                    </c:if>
                    <div class="login-pw">
                        <h4>パスワード</h4>
                        <input type="password" name="customerPw"  id="loginPw" maxlength="20" placeholder="Password">
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
                        <input type="button" value="ログイン" onclick="loginCheck(this.form)">
                    </div>
                </form>
            </div>
        </div>
        </c:if>
        <div  class="register-modal-con" id="register-modal-con" >
            <div class="register-modal">
                <form action="CustomerController" method="POST" id="regForm">
                <input type="hidden" name="action" value="CustomerJoin">
                    <button type="button" class="close-btn"  onclick="closeregisterModal()">X</button>
                    <h2>アカウント作成</h2>
                    <c:if test="${requestScope.joinMsg eq null}">
	                    <div class="register-item">
	                        <h4>メールアドレス</h4>
	                        <input type="email" name="customerEmail" id="regEmail1" maxlength="30" placeholder="Email" autocomplete="off" value="${requestScope.customerPw }">
	                    </div>
	                    <div class="register-item">
	                        <h4>パスワード</h4>
	                        <input type="password" name="customerPw" id="regPw1" maxlength="20"  placeholder="Password" >
	                    </div>
	                    <div class="register-item">
	                        <h4>確認パスワード</h4>
	                        <input type="password" name="reEnter" id="reEnter1" maxlength="20"  placeholder="Re-enter-Password">
	                    </div>
	                    <div class="forgot-pw">
	                        <button type="button" id="login-link">既にアカウントがある方ログイン</button>
	                    </div>
	                    <div>
	                    </div>
	                    <div class="register-submit">
	                        <input type="button" value="アカウントを作成" onclick="checkEmail(this.form)">
	                    </div>
                    </c:if>
                   	<c:if test="${requestScope.joinMsg ne null}">
                   		<div class="register-item">
	                        <h4>メールアドレス</h4>
	                        <input type="email" name="customerEmail" id="regEmail2" placeholder="Email" maxlength="30" autocomplete="off" value="${requestScope.customerEmail }">
	                    </div>
	                    <div class="register-item">
	                        <h4>パスワード</h4>
	                        <input type="password" name="customerPw" id="regPw2" placeholder="Password" maxlength="20" value="${requestScope.customerPw }">
	                    </div>
	                    <div class="register-item">
	                        <h4>確認パスワード</h4>
	                        <input type="password" name="reEnter" id="reEnter2" maxlength="20"  placeholder="Re-enter-Password">
	                    </div>
	                    <div class="forgot-pw">
	                        <button type="button" id="login-link">既にアカウントがある方ログイン</button>
	                    </div>
	                    <div class="register-submit">
	                    	<span class="msg">${requestScope.joinMsg }</span>
	                        <input type="button" value="アカウントを作成" onclick="recheckEmail(this.form)">
	                    </div>
                   	</c:if>
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
                        <input type="email" name="" maxlength="30" placeholder="Email" autocomplete="off">
                    </div>
                    <div class="forgot-submit">
                        <input type="submit" value="次に進む">
                    </div>
                </form>
            </div>
        </div>
    <div class="nav-con">
        <ul><!--後でNav押したらActive状態にさせ、bg-colorが適用されるように-->
            <li class="nav-item"><a href="HotelController?viewPage=hotel_list">ホテル</a></li>
            <li class="nav-item"><a href=""  >航空券</a></li>
            <li class="nav-item"><a href=""  >レンタカー</a></li>
            <li class="nav-item"><a href="" >ツアー</a></li>
            <li class="nav-item"><a href="" >イベント</a></li>
            <li class="nav-item"><a href="" >初めての方へ</a></li>
            <li class="nav-item"><a href="./admin/admin.jsp" > ホテル管理</a></li>
        </ul>
    </div>
    </header>
    <main>
        <div class="home-con">
            <div class="home-img">
            </div>
            <div class="home-search-con">
                <div class="search-con">
                    <div class="search-box">
                        <div class="tab-content" id="hotel-tap" style="display: block;">
                            <div class="search-item-hotel"><label>目的地・ホテル名<input type="text" class="content-input" name="searhc-hotel" placeholder="地域名・空港・都市・ランドマーク" autocomplete="off"></label></div>
                            <div class="search-item-hotel"><label>チェックイン<input type="date" name="start-date" id="start-date" class="content-input" ></label></div>
                            <div class="search-item-hotel"><label>チェックアウト<input type="date" name="end-date" id="end-date" class="content-input"></label> </div>
                            <div class="search-item-hotel">
                                <span class="guest">部屋
                                    <input type="text" name="room" id="guest-room" value="1" class="room-input" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                                    <button type="button" id="removeRoom" onclick="guestCount(this.id)">-</button>
                                    <button type="button" id="addRoom" onclick="guestCount(this.id)">+</button>
                                </span>
                                <span class="guest">大人
                                    <input type="text" name="adult" id="guest-adult" value="2" class="room-input" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                                    <button type="button" id="removeAdult" onclick="guestCount(this.id)">-</button>
                                    <button type="button" id="addAdult" onclick="guestCount(this.id)">+</button>
                                </span>
                                <span class="guest">子供
                                    <input type="text" name="child" id="guest-child" value="0" class="room-input" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                                    <button type="button" id="removeChild" onclick="guestCount(this.id)">-</button>
                                    <button type="button" id="addChild" onclick="guestCount(this.id)">+</button>
                                </span>
                                <button type="submit" class="search-submit" value="airplane">検索</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-con">
            <div class="left-side-con">
                <form action="" method="GET">
                    <div class="review-box">
                        <div class="review-title">レビュー</div>
                        <div class="review-item"><label><input type="checkbox" name="review-item" value="5">★★★★★</label></div>
                        <div class="review-item"><label><input type="checkbox" name="review-item" value="4">★★★★</label></div>
                        <div class="review-item"><label><input type="checkbox" name="review-item" value="3">★★★</label></div>
                        <div class="review-item"><label><input type="checkbox" name="review-item" value="2">★★</label></div>
                    </div>
                    <div class="price-con">
                        <div class="price-item"><p>一泊平均料金</p> ￥<input type="text"> - ￥<input type="text"></div>
                    </div>
                    <div class="submit-btn"><button name="side-submit-btn">条件検索</div>
                </form>
            </div>
            <div class="list-con">
                <div class="search-result"><span>東京：検索結果</span></div>
                <div class="list-link-box">
                    <div class="list-item active"><span><a href="">おすすめ</span></a></div>
                    <div class="list-item"><span><a href="">最安料金</span></a></div>
                    <div class="list-item"><span><a href="">最高料金</span></a></div>
                    <div class="list-item"><span><a href="">利用者評価</span></a></div>
                </div>
            </div>
            <div class="hotel-info-con">
                <div class="info-img-con">
                    <img src="../images/hotel-img/hotel1/hotel-outside-1-01.jpg" alt="" class="info-hotel-img"/>
                </div>
                <div class="hotel-info-box">
                    <div class="hotel-info-title">
                        <span><a href="./hotel_list_info.html">新宿ホテル</a></span>
                    </div>
                    <div class="roomtype">
                        <span>デラックスツインルーム</span>
                    </div>
                    <div class="review-score">
                        <a href="">レビュー100件</a>
                        <a href="" class="review-info">4.6/5</a>
                    </div>
                    <div class="room-msg">msg</div>
                    <div class="room-price"><span>22,500円</span><a href="">予約</a></div>
                </div>
            </div>
            <div class="hotel-info-con">
                <div class="info-img-con">
                    <img src="../images/hotel-img/hotel2/hotel-outside-2-01.jpg" alt="" class="info-hotel-img"/>
                </div>
                <div class="hotel-info-box">
                    <div class="hotel-info-title">
                        <span><a href="">池袋ホテル</a></span>
                    </div>
                    <div class="roomtype">
                        <span>roomtype</span>
                    </div>
                    <div class="review-score">
                        <a href="">レビュー100件</a>
                        <a href="" class="review-info">4.6/5</a>
                    </div>
                    <div class="room-msg">msg</div>
                    <div class="room-price"><span>22,500円</span><a href="">予約</a></div>
                </div>
            </div>
            <div class="hotel-info-con">
                <div class="info-img-con">
                    <img src="../images/hotel-img/hotel3/hotel-outside-3-01.jpg" alt="" class="info-hotel-img"/>
                </div>
                <div class="hotel-info-box">
                    <div class="hotel-info-title">
                        <span><a href="">渋谷ホテル</a></span>
                    </div>
                    <div class="roomtype">
                        <span>roomtype</span>
                    </div>
                    <div class="review-score">
                        <a href="">レビュー100件</a>
                        <a href="" class="review-info">4.6/5</a>
                    </div>
                    <div class="room-msg">msg</div>
                    <div class="room-price"><span>22,500円</span><a href="">予約</a></div>
                </div>
            </div>
            <div class="hotel-info-con">
                <div class="info-img-con">
                    <img src="../images/hotel-img/hotel4/hotel-outside-4-01.jpg" alt="" class="info-hotel-img"/>
                </div>
                <div class="hotel-info-box">
                    <div class="hotel-info-title">
                        <span><a href="">東京ホテル</a></span>
                    </div>
                    <div class="roomtype">
                        <span>roomtype</span>
                    </div>
                    <div class="review-score">
                        <a href="">レビュー100件</a>
                        <a href="" class="review-info">4.6/5</a>
                    </div>
                    <div class="room-msg">msg</div>
                    <div class="room-price"><span>22,500円</span><a href="">予約</a></div>
                </div>
            </div>
            <div class="hotel-info-con">
                <div class="info-img-con">
                    <img src="../images/hotel-img/hotel5/hotel-outside-5-01.jpg" alt="" class="info-hotel-img"/>
                </div>
                <div class="hotel-info-box">
                    <div class="hotel-info-title">
                        <span><a href="">代々木ホテル</a></span>
                    </div>
                    <div class="roomtype">
                        <span>roomtype</span>
                    </div>
                    <div class="review-score">
                        <a href="">レビュー100件</a>
                        <a href="" class="review-info">4.6/5</a>
                    </div>
                    <div class="room-msg">msg</div>
                    <div class="room-price"><span>22,500円</span><a href="">予約</a></div>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; This is Travel Site</p>
    </footer>
    <div class="top-btn-con">
        <button class="go-top">↑</button>
    </div>
<!--Jquery CDN JqueryがJSより上にする-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./js/common-jquery.js"></script>
<!--このようにするのかわからない。。。-->
<script type="text/javascript" src="./js/hotel/hotel_list.js" charset="UTF-8"></script>
<script type="text/javascript" src="./js/common.js" charset="UTF-8"></script>
</body>
</html>