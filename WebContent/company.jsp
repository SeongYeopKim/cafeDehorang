<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style>
         body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset,
    legend, textarea, p, blockquote, th, td, input, select, textarea, button {
        margin: 0;
        padding: 0
    } 
       
        body{
            font-family:"Hiragino Kaku Gothic ProN","Meiryo","Nanum Gothic","Malgun Gothic","맑은 고딕",dotum,"돋움","sans-serif";
            margin: 0px;
            width: 100%;
            
        }
        header{
            width:100%;
            height:70px;
            position:fixed;
            z-index:100;
            background:#FFF;
            
        }
        section{ 
            margin: 0 auto;
        } 
        .contents{
            position: relative; 
            width: 100%;
            height:3000px;
            top:70px; 
            background: url(img/bg_banner1) no-repeat center center fixed;
            background-size: 100%
        }
        .contents .contents1{
            position: relative;
            top:200px;
            color: #FFF;
            font-size: 150px;
        }
        .contents .contents1 img{
            width: 100%;
        }
        .contents .contents2{
            position: relative;
            top:770px;
            color: #FFF;
        }
        .contents .contents2 .box_contents{
            width: 100%;
            height: 100%;
            background: #FFF;
        }
      
        .contents .contents2 .btn_plus{
            width: 50px;
            height:  50px;
            border-radius: 50%;
            box-shadow: 0 -2px 4px 0 rgba(0, 0, 0, 0.2), inset 0 0 0 3px white, inset 0 0 0 4px rgba(0, 0, 0, 0.09);
            position: absolute;
            left: 50%;
            margin: -25px 0 0 -25px;
            background: white;
            text-align: center;
            
        }
        .contents .contents2 .btn_plus img{
            padding: 14px 0 0;
        }
        .contents .contents2 .btn_plus a{
            opacity: 0.2;
            transition: opacity .7s ease-in-out;
        }
        .contents .contents2 .btn_plus a:hover{
              opacity: 0.8;
              transition: opacity .7s ease-in-out;
              -moz-transition: opacity .7s ease-in-out;
              -webkit-transition: opacity .7s ease-in-out;
              -o-transition: opacity .7s ease-in-out;
        }
        
        
      
         @media (max-width:960px){
            .contents .text2{
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
   <!-- 헤더 시작 -->
	<header> <a href="index.jsp"><img src="img/logo.png"></a>
	<a href="company.jsp"><img src="img/company.png" class="menu"></a>
	<!-- <img src="img/startup.png" class="menu"> 창업문의는 제외--> 
	</header>
	<!-- 헤더 끝 -->
	
    <section>
        <div class="contents">
            <div class="contents1">
                 <img src="img/banner_main_text.png" >
            </div>
            <div class="contents2">
                <div class="box_contents">
                    <div class="btn_plus">
                        <a href="#">
                            <img src="img/plus.svg">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>