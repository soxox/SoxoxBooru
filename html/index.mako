<head>
<%include file="head_common.mako"/>
</head>
<body>
<%include file="header.mako"/>
<div id="content">
${salutation}, ${target}!
${session.items()}
</div>
</body>
