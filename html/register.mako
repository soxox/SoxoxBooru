<head>
<%include file="head_common.mako"/>
</head>
<body>
<%include file="header.mako"/>
<div id="content">
<h2>Register</h2>
<form action="doRegister" method="post">
<table id=logintable>
                    <input name=page type=hidden value=${formdata[2]}></input>
                    <tr><td><input name=user type=text placeholder=Username value=${formdata[0]} required></input></td></tr>
                    <tr><td><input name=email type=email placeholder=Email required></input></td></tr>
                    <tr><td><input id="pword" name="pword" type="password" value=${formdata[1]} pattern="^\S{4,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.pword2.pattern = this.value;" placeholder="Password" required></input></td></tr>

                    <tr><td><input id="pword2" type="password" pattern="^\S{4,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');" placeholder="Verify Password" required></input></td></tr>
                    <tr><td><input type=submit value=Register></input></td></tr>
                </table>
</div>
</body>
