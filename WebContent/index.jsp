<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/index.css" type="text/css">
    <link rel="stylesheet" href="./css/common.css" type="text/css">
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
			                    <c:choose>
			                    	<c:when test="${sessionScope.customer ne null }">
				                        <li class="item"><a href="CustomerController?action=CustomerLogout">ログアウト</a></li>
				                        <li class="item"><a href="">menu2</a></li>
				                        <li class="item"><a href="">menu3</a></li>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<li class="item"><a href="ManagerController?action=ManagerLogout">ログアウト</a></li>
				                        <li class="item"><a href="HotelController?viewPage=ManagerPage">マネージャーページ</a></li>
				                        <li class="item"><a href="">menu3</a></li>
			                    	</c:otherwise>
			                    </c:choose>
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
        <div class="notice-con">
            <div class="online-notice">
                <div class="notice-title">最新旅行情報</div>
                <div class="notice-list">
                    <div class="notice-item"><a href="" >新型コロナ対策</a></div>
                    <div class="notice-item"><a href="">安全対策旅行</a></div>
                    <div class="notice-item"><a href="">各航空にてお知らせ</a></div>
                    <div class="notice-item"><a href="">航空にてお知らせ</a></div>
                </div>
            </div>
        </div>
        <div class="home-con">
            <div class="home-img">
            </div>
            <div class="home-search-con">
                <div class="search-tap">
                    <div class="search-list"><button type="button" class="tab-link active" onclick="searchTap(event, 'hotel-tap');">ホテル</button></div>
                    <div class="search-list"><button type="button" class="tab-link" onclick="searchTap(event, 'airplane-tap');setairDate();">航空券</button></div>
                    <div class="search-list"><button type="button" class="tab-link"onclick="searchTap(event, 'rentcar-tap');rentDate();">レンタカー</button></div>
                </div>
                <div class="search-con">
                    <div class="search-box">
                        <div class="tab-content" id="hotel-tap" style="display: block;">
                            <div class="search-item-hotel"><label>目的地・ホテル名<input type="text" class="content-input" name="searhc-hotel" placeholder="地域名・空港・都市・ランドマーク" autocomplete="off"></label></div>
                            <div class="search-item-hotel"><label>チェックイン<input type="date" name="start-date" id="start-date" class="content-input-date" ></label></div>
                            <div class="search-item-hotel"><label>チェックアウト<input type="date" name="end-date" id="end-date" class="content-input-date"></label> </div>
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
                            </div>
                            <div class="review-con">
                                <button type="submit" class="search-submit" value="airplane">検索</button>
                                <div class="review-box">
                                    <div class="review-title">レビュー</div>
                                    <div class="review-item" id="review-item2"><label><input type="checkbox" name="review-item" value="2" onclick="keepChecked(this.value)">★2</label></div>
                                    <div class="review-item" id="review-item3"><label><input type="checkbox" name="review-item" value="3" onclick="keepChecked(this.value)">★3</label></div>
                                    <div class="review-item" id="review-item4"><label><input type="checkbox" name="review-item" value="4" onclick="keepChecked(this.value)">★4</label></div>
                                    <div class="review-item" id="review-item5"><label><input type="checkbox" name="review-item" value="5" onclick="keepChecked(this.value)">★5</label></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content" id="airplane-tap" style="display: none;">
                            <div class="search-item-airplane-2"><span>利用空港</span>
                                <input type="text" class="content-input" autocomplete="off" placeholder="出発空港"><input type="text" class="content-input" autocomplete="off" placeholder="到着空港"></div>
                            <div class="search-item-airplane"><span> 旅行期間<p>1泊</p></span><input type="date" name="start-date" id="start-date-air" class="content-input-date" >
                                <input type="date" name="end-date" id="end-date-air" class="content-input-date" ></div>
                            <div class="review-con">
                                <button type="submit" class="search-submit" value="airplane">検索</button>
                                <div class="review-box">
                                    <div class="review-item"><label><input type="radio" name="review-item" value="1" checked>往復</label></div>
                                    <div class="review-item"><label><input type="radio" name="review-item" value="2" >片道</label></div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-content"id="rentcar-tap" style="display: none;">
                            <div class="search-item-rentcar"><label>出発場所</label><input type="text" class="content-input" autocomplete="off" placeholder="空港・地域名・ホテル名"></div>
                            <div class="search-item-rentcar"><label>出発日時</label><input type="date" name="start-date" id="start-date-rentcar" class="content-input-date" ></div>
                            <div class="search-item-rentcar"><label>返却日時</label><input type="date" name="end-date" id="end-date-rentcar" class="content-input-date"></div>
                            <div class="review-con">
                                <button type="submit" class="search-submit" value="airplane">検索</button>
                                <div class="review-box">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="home-wrapper">
            <div class="recommend-con">
                <div class="recommend-module-title">おすすめ ホテル</div>
                    <div class="recommend-module">
                        <div class="recommend-tab-con">
                            <div class="hotel-tab-title">
                            <span class="hotel-tab-item"><button type="button" class="hotel-tab-link active" onclick="hotelTap(event, 'kantou-tap');">関東</button></span>
                            <span class="hotel-tab-item"><button type="button" class="hotel-tab-link" onclick="hotelTap(event, 'okinawa-tap');">沖縄</button></span>
                            <span class="hotel-tab-item"><button type="button" class="hotel-tab-link" onclick="hotelTap(event, 'hokkaido-tap');">北海道</button></span>
                            <span class="hotel-tab-item"><button type="button" class="hotel-tab-link" onclick="hotelTap(event, 'fukuoka-tap');">福岡</button></span>
                            </div>
                        </div>
                   <div>
                            <div class="hotel-tab-content" id="kantou-tap" style="display: block;">
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link-1" href="#" title="新宿ホテル" target="_blank"></a></div>
                                            <div class="item-title">新宿ホテル</div>
                                            <div class="item-review">レビュー</div>
                                            <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link-2" href="#" title="池袋ホテル" target="_blank"></a></div>
                                            <div class="item-title">池袋ホテル</div>
                                            <div class="item-review">レビュー</div>
                                            <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link-3" href="#" title="渋谷ホテル" target="_blank"></a></div>
                                            <div class="item-title">渋谷ホテル</div>
                                            <div class="item-review">レビュー</div>
                                            <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link-4" href="#" title="東京ホテル" target="_blank"></a></div>
                                            <div class="item-title">東京ホテル</div>
                                            <div class="item-review">レビュー</div>
                                            <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="link-more"><a href="./Hotel/hotel_list.html">もっと見る</a></div>
                        
                            <div class="hotel-tab-content" id="okinawa-tap" style="display: none;">
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link" href="#" title="ホテル" target="_blank" ></a></div>
                                            <div class="item-title">ホテル</div>
                                                <div class="item-review">レビュー</div>
                                                <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link" href="#" title="新宿ホテル" target="_blank"></a></div>
                                            <div class="item-title">ホテル</div>
                                                <div class="item-review">レビュー</div>
                                                <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link" href="#" title="新宿ホテル" target="_blank"></a></div>
                                            <div class="item-title">ホテル</div>
                                            <div class="item-review">レビュー</div>
                                            <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="hotel-tab-content" id="hokkaido-tap" style="display: none;">
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link" href="#" title="新宿ホテル" target="_blank"></a></div>
                                            <div class="item-title">ホテル</div>
                                            <div class="item-review">レビュー</div>
                                            <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                           		</div>
                                <div class="content-box">
                                    <div class="recommend-content">
                                        <div class="content-item">
                                            <div class="item-img"><a class="item-img-link" href="#" title="新宿ホテル" target="_blank"></a></div>
                                            <div class="item-title">ホテル</div>
                                            <div class="item-review">レビュー</div>
                                            <div class="item-price">安値<p>22.500円</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                	</div>
            	</div>
        	</div>
    	</div>
    </main>
<footer>
   <p>&copy; This is Travel Site</p>
</footer>
<div class="top-btn-con">
    <button type="button" class="go-top" >↑</button>
</div>
<!--Jquery CDN JqueryがJSより上にする-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./js/common-jquery.js"></script>
<!--このようにするのかわからない。。。-->
<script type="text/javascript" src="./js/index.js" charset="UTF-8"></script>
<script type="text/javascript" src="./js/common.js" charset="UTF-8"></script>
</body>
</html>