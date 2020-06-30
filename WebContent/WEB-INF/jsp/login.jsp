<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<title>登录注册页面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/login/css/style.css">

<script src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
<script type="text/javascript">
   function changeImg(){
     var img = document.getElementById("codeImg");
     // 当src每次的路径方式变化时，就会去重新请求一次后台
     // new Date().getTime()？它是JavaScript的Date对象的方法，此处的作用是为了避免
     //  浏览器不会去执行后台代码(因为浏览器缓存原因)
     img.src="${pageContext.request.contextPath}/code_img?"+new Date().getTime();
   }
 </script>


</head>

<body>
   <div class="content">
 <form:form action="" cssClass="form" modelAttribute="user">

        <div class="form sign-in">
        
        	 <center>
 				<span style="color:red;">${error }</span>
 			 </center>
 					<br/>
            <h2>欢迎回来</h2>
            
              	<label for="userId">账户:
                    <input type="text" name="userId" id="userId" />
                    <form:errors path="userId" cssStyle="color:red;"/>
           		</label>
           
                <label for="userPsw"> &nbsp;&nbsp;密码：
                    
                    <form:password path="userPsw" cssClass="validate[required]"/>
                    <form:errors path="userPsw" cssStyle="color:red;"/>
                </label>
                
                <label for="code"> &nbsp;&nbsp;验证码：
                    <input type="text" name="code" />
                   <img id="codeImg" 
						src="${pageContext.request.contextPath}/code_img" />
			<a href="javascript:changeImg();" rel="external nofollow">看不清</a><br />
                    
                </label>
                
                
                
                
             
            		<p class="forgot-pass"><a href="${pageContext.request.contextPath}/user_reset_password">忘记密码？</a></p>
           		 <br>
              		<input type="submit" value="登录" class="submit" />
              
          
        </div>
        </form:form>
        
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>还未注册？</h2>
                    <p>立即注册，发现大量机会！</p>
                </div>
                <div class="img__text m--in">
                    <h2>已有帐号？</h2>
                    <p  >有帐号就登录吧，好久不见了！</p>
                </div>
                <div class="img__btn" id="dd">
                    <span class="m--up">注 册</span>
                     
                    <span class="m--in">登 录</span>
                </div>
            </div>
             <form:form action="${pageContext.request.contextPath}/regist"  method="post"
             cssClass="form" modelAttribute="user">
            <div class="form sign-up">
            
                <h2>立即注册</h2>
                
                <label for="userId">&nbsp;账户:
                    <input type="text" name="userId" id="userId" />
                    <form:errors path="userId" cssStyle="color:red;"/>
           		</label>
           
                <label for="userPsw"> &nbsp; &nbsp;&nbsp;密码：
                    
                    <form:password path="userPsw" cssClass="validate[required]"/>
                    <form:errors path="userPsw" cssStyle="color:red;"/>
                </label>
                
                   <label for="ruserPsw">&nbsp; &nbsp;&nbsp;确认密码：
                    
                   <input type="password" name="ruserPsw" id="ruserPsw" />
                  
                </label>
                
                    <label for="userAlice">&nbsp; &nbsp;&nbsp;昵称：
                    
                    <form:input path="userAlice" cssClass="validate[required]"/>
                  
                </label>
                    <label for="userEmail">&nbsp; &nbsp;&nbsp;邮箱：
                      <input type="text" name="userEmail" id="userEmail" />
                    
                  
                </label>
                
        		
               <br/>
               <input type="submit" value="注册" class="submit" />
             
            </div>
            </form:form>
        </div>
       
    </div>

    <script src="${pageContext.request.contextPath}/statics/login/js/script.js"></script>
   
</body>

</html>

