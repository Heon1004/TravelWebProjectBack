<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/admin_hotel.css">
    <!--Font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Sawarabi+Gothic&display=swap" rel="stylesheet">
    <title>旅行はどこ?ここ!　ホテル・航空券・レンタカー</title>
</head>
<body>
<header>
    <div class="hd-menu">
        <div class="logo-con">
            <span><a href="ManagerController?viewPage=index" class="logo-con-link">旅行はここ</a></span>
        </div>
        <div class="nav-title">ホテル管理システム</div>
        <div class="myaccount-con">
            <ul class="account-drop">
                <li class="drop-item"><button type="button">admin様</button>
                    <ul class="dropmenu">
                        <li class="item"><a href="HotelManagerController?action=ManagerLogout">ログアウト</a></li>
                        <li class="item"><a href="">menu2</a></li>
                        <li class="item"><a href="">menu3</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>
<main>
    <div class="container">
        <div class="home-con">
            <div class="side-bar-con">
                <ul class="side-nav">
                    <li class="side-item"><button type="button" id="side-item-title">ホテル</button>
                        <ul class="submenu">
                            <li class="item"><button type="button" class="tab-link active" onclick="openTap(event,'hotel-list')">ホテルリスト</button></li>
                            <li class="item"><button type="button" class="tab-link" onclick="openTap(event,'hotel-add')">ホテル登録</button></li>
                        </ul>
                    </li>
                    <li class="side-item"><button type="button" id="side-item-title">管理システム</button>
                        <ul class="submenu">
                            <li><button type="button" class="tab-link" onclick="openTap(event,'customer-list')">予約リスト</button></li> 
                            <li><button type="button" class="tab-link" onclick="openTap(event,'booking-count')">集計</button></li>
                        </ul>
                    </li>
                </ul>
            </div>
        <div class="main-con">
            <div class="content-con">
                <div class="tap-content" id="hotel-list">
                    <form action="">
                    <div class="content-title">ホテルリスト
                        <div class="search-hotel">
                            <select name="search-type">
                                <option value="hotelCode">ホテルコード</option>
                                <option value="hotelName">ホテル支店名</option>
                            </select>
                            <input type="text">
                            <input type="submit" value="検索">
                        </div>
                    </div>
                    </form>
                    <div class="list-content">
                        <form action="">
                            <div class="hotel-list-item">
                                <div class="company-item">登録日
                                    <span>2021年06月05日</span>
                                </div>
                            </div>
                            <div class="hotel-list-item">
                                <div class="company-item">ホテルコード
                                    <span>5</span>
                                </div>
                            </div>
                            <div class="hotel-list-item">
                                <div class="company-item">ホテル名
                                    <span>新宿ホテル</span>
                                </div>
                            </div>
                            <div class="hotel-list-item">
                                <div class="company-item">住所
                                    <span>7-10-5 西新宿 新宿区 東京都 160-0023</span>
                                </div>
                            </div>
                            <div class="hotel-list-item">
                                <div class="company-item">レビュー
                                    <span>3.5/4.5</span>
                                </div>
                            </div>
                            <div class="img-item">
                                <div class="img-view">
                                    <img src="../images/hotel-img/hotel1/hotel-outside-1-01.jpg" alt="">
                                </div>
                                <div class="img-view">
                                    <img src="../images/hotel-img/hotel1/hotel-room-1-01.jpg" alt="">
                                </div>
                                <div class="img-view">
                                    <img src="../images/hotel-img/hotel1/hotel-room-1-03.jpg" alt="">
                                </div>
                                <div class="img-view">
                                    <img src="../images/hotel-img/hotel1/hotel-room-1-02.jpg" alt="">
                                </div>
                                <div class="img-view">
                                    <img src="../images/hotel-img/hotel1/hotel-room-1-04.jpg" alt="">
                                </div>
                                <div class="img-view">
                                    <img src="../images/hotel-img/hotel1/hotel-room-1-05.jpg" alt="">
                                </div>
                                <div class="img-view">
                                    <img src="../images/hotel-img/hotel1/hotel-room-1-06.jpg" alt="">
                                </div>
                                <div class="img-view">
                                    <img src="../images/hotel-img/hotel1/hotel-room-1-07.jpg" alt="">
                                </div>
                            </div>
                            <div class="list-item-btn">
                                <input type="submit" class="delete-btn" value="削除">
                                <input type="submit" value="変更">
                            </div>
                        </form>
                    </div>
                    <div class="page-con">
                        <a href="" class="before-btn">≪</a>
                        <a href="" class="page-btn active">1</a>
                        <a href="" class="page-btn">2</a>
                        <a href="" class="page-btn">3</a>
                        <a href="" class="page-btn">4</a>
                        <a href="" class="page-btn">5</a>
                        <a href="" class="next-btn">≫</a>
                    </div>
                </div>
                <div class="tap-content" id="hotel-add">
                    <div class="add-content-box">
                        <div class="content-title">ホテル登録</div>
                        <div class="add-content">
                            <form action="" method="">
                                <div class="add-content-item">
                                    <span>ホテル名</span>
                                    <input type="text" name="add-manager-company" placeholder="支店名・ホテル名" autocomplete="off">
                                </div>
                                <div class="add-content-item">
                                    <span>ホテル住所</span>
                                    <input type="text" name="add-manager-address" placeholder="住所" autocomplete="off">
                                </div>
                                <div class="add-content-item">
                                    <span>支店電話番号</span>
                                    <input type="text" name="add-manager-tel" placeholder="Telephone" autocomplete="off" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
                                </div>
                                
                                <div class="img-con" id="img-con">
                                    <div class="img-box" id="img-box">
                                        <div class="img-preview" id="img-preview">
                                            
                                        </div>
                                        <button type="button" class="btn-imgdelete" id="btn-imgdelete">削除</button>
                                        <input type="file" class="inp-img" id="imgfile" onchange="filecheck();" accept="image/jpeg, image/jpg, image/png" multiple />
                                    </div>
                                </div>
                                <div class="system-msg">
                                    msg
                                </div>
                                <div class="submit-btn">
                                    <button type="submit">登録</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="tap-content" id="customer-list">
                    <form action="">
                    <div class="content-title">予約リスト
                        <div class="search-hotel">
                            <select name="search-type">
                                <option value="bookingNum">予約番号</option>
                                <option value="hotelName">ホテル名</option>
                                <option value="userName">氏名</option>
                                <option value="userEmail">メールアドレス</option>
                            </select>
                            <input type="text">
                            <button type="submit">検索</button>
                        </div>
                        <div class="list-tap-nav">
                            <a href="" class="list-nav-item active">本日予約</a>
                            <a href="" class="list-nav-item">全部</a>
                            <div class="select-date">
                                <form action="">
                                    <span>期間選択</span>
                                    <input type="date" id="start-date" name="start-date">
                                    <span>~</span>
                                    <input type="date" id="end-date" name="end-date">
                                    <button type="submit">検索</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    </form>
                    <div class="search-result">検索結果 : 100件</div>
                    <div class="booking-list">
                        <table>
                            <tr>
                                <th>予約番号</th>
                                <th>ホテル名</th>
                                <th>氏名</th>
                                <th>メールアドレス</th>
                                <th>決済日</th>
                                <th colspan="2">予約日</th>
                            </tr>
                            <tr>
                                <td>31285234</td>
                                <td>新宿ホテル</td>
                                <td>watanabe</td>
                                <td>dsagfjfkdsdf@ffdslds.com</td>
                                <td>2021/5/30</td>
                                <td>2021/6/21</td>
                                <td><button><a href="./admin_hotel_info.html">詳細</a></button></td>
                            </tr>
                        </table>
                    </div>
                    <div class="page-con">
                        <a href="" class="before-btn">≪</a>
                        <a href="" class="page-btn active">1</a>
                        <a href="" class="page-btn">2</a>
                        <a href="" class="page-btn">3</a>
                        <a href="" class="page-btn">4</a>
                        <a href="" class="page-btn">5</a>
                        <a href="" class="next-btn">≫</a>
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
    <button type="button" class="go-top" onclick="goTop()" >↑</button>
</div>
<!--Jquery CDN JqueryがJSより上にする-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../js/common-jquery.js"></script>
<!--このようにするのかわからない。。。-->
<script type="text/javascript" src="../js/admin_hotel.js" charset="UTF-8"></script>
<script type="text/javascript" src="../js/common.js" charset="UTF-8"></script>
</body>
</html>