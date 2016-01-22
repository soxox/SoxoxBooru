<div id="header">
    <div id="userbox">
        % if not 'user' in session:
            <form action="/doLogin" method="post"></input>
                <table id=logintable>
                    <input name=page type=hidden value=${page}></input>
                    <tr><td colspan=3><input name=user type=text placeholder=Username></input></td></tr>
                    <tr><td colspan=3><input name=pword type=password placeholder=Password></input></td></tr>
                    <tr>
                        <td><input type=submit name=submit value=Login></input></td>
                        <td><input type=submit name=submit value=Register></input></td>
                    </tr>
                </table>
            </form>
        % else:
            logoot
        % endif
    </div> 
    <div style="clear:both;"></div>
    <ul id="navbar" class="flat-list">
            <li>
                <a href="/">Home</a>
            </li>
        </ul>
</div>
