<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> - My Biography - </title>
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
            color: orange;
            display: block;
            padding: 10px;
            margin: 3px;
        }

        a {
            color: pink;
            font-weight: bold;
            background-color: yellow;
        }

        h1 {
            color: mediumspringgreen;
            justify-content: center;
            align-items: center;
            margin-left: 40px;
            font-size: large;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1><%= "MY BIOGRAPHY " %>
</h1>
<form>
    <label> My Name - Surname: Barış Kaplan </label>
    <label> My Age: 22 </label>
    <label> My Email Address: bkaplan18@ku.edu.tr  </label> <a href= "mailto:bkaplan18@ku.edu.tr"> Email Me </a>
    <label> My University Name: Koç Üniversitesi  </label>
    <label> My Main Department: Bilgisayar Mühendisliği </label>
    <label> My Second Department: Business Administration </label>
    <label> My GPA: 3.20 </label>
    <label> My Current Grade: 4th grade </label>
    <label> My English Level: Upper-Intermediate (C1)</label>
    <label> My German Level: A2 Level </label>
    <label>My French Level: A1 Level </label>

</form>
<br/>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Go Back</a>
<a href="${pageContext.servletContext.contextPath}/experiences.jsp"> My Experiences</a><br>
<a href="${pageContext.servletContext.contextPath}/tech.jsp"> My Tech Knowledge </a><br>
</body>
</html>