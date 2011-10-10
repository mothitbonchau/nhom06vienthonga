<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.sun.mail.handlers.image_jpeg"%>
<%@page import="net.tanesha.recaptcha.ReCaptchaResponse"%>
<%@page import="net.tanesha.recaptcha.ReCaptchaImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<%
    if (request.getParameter("tt") != null) {
        String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6Ld03sgSAAAAAGI9a-JBcCtJHNgL4umXwtW0uNW- ");

        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

        if (reCaptchaResponse.isValid()) {
            out.print("Answer was entered correctly!");
        } else {
            out.print("Answer is wrong");
        }
        return;
    }
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="" method="post">
            <%
                ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Ld03sgSAAAAAELYRYbjvhqsILWyj1zxc6DX4cwT ", "6Ld03sgSAAAAAGI9a-JBcCtJHNgL4umXwtW0uNW- ", false);
                out.print(c.createRecaptchaHtml("abc", null));
            %>
            <input type="submit" value="adsfasdf"/>
            <input type="hidden" name="tt" value="asdf">
        </form>
            
        <form action="" method="post">
            <input type="radio" name="k" value="1"/>
            <input type="radio" name="k" value="2"/>
            <input type="submit" value="adsfasdf"/>
            <input type="hidden" name="tt2" value="asdf">
        </form>
            <%= 1 %>
    </body>
</html>



