<%--
  Created by IntelliJ IDEA.
  User: barissss
  Date: 29.07.2022
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Tech Knowledge</title>
    <style>
        body {
            justify-content: center;
            align-items: center;
            display: block;
            text-align: center;
            line-height: 195%;
            font-size: 1.00em;
            font-weight: normal;
        }

        label {
            cursor: pointer;
            color: deepskyblue;
            background-color: darkred;
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
<label>Programming Languages & Technologies & DB Languages I know</label>
<label for ="pLSkills">Programming Languages: Java,C,Python,PHP,Scheme,Lisp</label>
<label>Degree:</label><progress id="pLSkills" value="75" max="100"></progress>
<label for = "dbSkills">Database Languages: PostgreSQL, SQL, NoSQL</label>
<label>Degree:</label><progress id="dbSkills" value="65" max="100"></progress>
<label for = "versionControlSkills">Version Control Systems: Git, Github, Gitlab, Bitbucket</label>
<label>Degree:</label><progress id="versionControlSkills" value="75" max="100"></progress>
<label for = "ideSkills">IDEs: Eclipse, Intellij, XCode, VSCode</label>
<label>Degree:</label><progress id="ideSkills" value="75" max="100"></progress>
<label for = "otherTech1">Other Tech 1: HTML, CSS, Java JUnit Testing, Java J2EE, Apache Maven</label>
<label>Degree:</label><progress id="otherTech1" value="60" max="100"></progress>
<label for = "otherTech2">Other Tech 2: OOP, Design Patterns, WordPress</label>
<label>Degree:</label><progress id="otherTech2" value="80" max="100"></progress>
<label for = "otherTech3">Other Tech 3: Microsoft Office Stack </label>
<label>Degree:</label><progress id="otherTech3" value="90" max="100"></progress><br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Go Back</a>
</body>
</html>
