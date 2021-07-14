<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/admin_hotel_info.css">
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
                        <li class="item"><a href="">ログアウト</a></li>
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
            <div class="content">
                <h2>予約詳細</h2>
                <div class="content-title">
                    <span>予約番号</span>
                    <div class="content-item">
                        3213123131
                    </div>
                </div>
                <div class="content-title">
                    <span>ホテル名</span>
                    <div class="content-item">
                        4849322345
                    </div>
                </div>
                <div class="content-title">
                    <span>氏名</span>
                    <div class="content-item">
                        4849322345
                    </div>
                </div>
                <div class="content-title">
                    <span>メールアドレス</span>
                    <div class="content-item">
                        4849322345dsadsadasdasd
                    </div>
                </div>
                <div class="content-title">
                    <span>電話番号</span>
                    <div class="content-item">
                        4849322345
                    </div>
                </div>
                <div class="content-title">
                    <span>ゲスト数</span>
                    <div class="content-item">
                        大人2 / 子供1
                    </div>
                </div>
                <div class="content-title">
                    <span>予約日</span>
                    <div class="content-item">
                        4849322345
                    </div>
                </div>
                <div class="content-title">
                    <span>決済日</span>
                    <div class="content-item">
                        4849322345
                    </div>
                </div>
                <div class="content-title">
                    <span>金額</span>
                    <div class="content-item">
                        4849322345
                    </div>
                </div>
                <button type="button" onclick="history.back()">戻る</button>
                <div class="content-btn">
                    <button type="submit">削除</button>
                    <button tpye="button" onclick="location.href='./admin_hotel_info_update.html'">変更</button>
                </div>
            </div>
    </div>
</main>
<footer>
   <p>&copy; This is Travel Site</p>
</footer>
<!--Jquery CDN JqueryがJSより上にする-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../js/common-jquery.js"></script>
<!--このようにするのかわからない。。。-->
<script type="text/javascript" src="../js/admin_hotel_info.js" charset="UTF-8"></script>
<script type="text/javascript" src="../js/common.js" charset="UTF-8"></script>
</body>
</html>