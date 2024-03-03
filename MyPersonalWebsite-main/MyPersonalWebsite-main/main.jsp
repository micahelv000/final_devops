<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Personal Website </title>
    <style>
        body {
            justify-content: center;
            align-items: center;
            display: block;
            text-align: center;
            line-height: 195%;
            font-size: 1.00em;
            background-image: url('download.jpeg');
            font-weight: normal;
        }

        label {
            cursor: pointer;
            color: yellow;
            display: block;
            padding: 10px;
            margin: 3px;
        }

        a {
            color: hotpink;
        }

        h1 {
            color: red;
            justify-content: center;
            align-items: center;
            margin-left: 40px;
            font-size: large;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1><%= "WELCOME TO MY PERSONAL WEBSITE!" %>
</h1>
<marquee bgcolor="green" direction="right"
         loop=""> - !!! WELCOME DEAR GUEST !!! - </marquee>
<form>
    <label> - Welcome To My Personal Website - </label>
    <label> - I am Barış KAPLAN</label>
    <label> - My Linkedin Page - </label><a href="https://www.linkedin.com/in/barış-k-896652175/">My Linkedin Account</a>
    <label> - My Github Page - </label> <a href="https://github.com/Baris000-eng">My Github Account</a>
    <label> - My Medium Page - </label> <a href="https://medium.com/@bkaplan18">My Medium Account</a>
    <label> - My Hackerrank Page - </label> <a href="https://www.hackerrank.com/bkaplan18">My Hackerrank Account</a>
    <label> - My Personal Page - </label>
    <label> - Call Me - </label> <a href="tel:05321597468">Call Me !</a><br>
    <a href="${pageContext.servletContext.contextPath}/biography.jsp"> My Biography</a>
</form>
<%
    synchronized (this) {
        Thread.sleep(3000);
    }

%>
<br/>
<iframe width="200" height="100" src="https://www.youtube.com/embed/KoXxD99BYDw"
        title="YouTube video player" frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
<iframe width="200" height="100" src="https://www.youtube.com/embed/i0GT8swSFos"
        title="YouTube video player" frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
<iframe width="200" height="100" src="https://www.youtube.com/embed/Dst9gZkq1a8?playlist=Dst9gZkq1a8&loop=1"
        title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write;
        encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>

</body>
</html>