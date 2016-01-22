import cherrypy
import sqlite3
from mako.template import Template
from mako.lookup import TemplateLookup
import hashlib

lookup = TemplateLookup(directories=['html'])

class HelloWorld(object):
    
    @cherrypy.expose
    def index(self):
        tmpl = lookup.get_template("index.mako")
        return tmpl.render(salutation="Hello", target="World", session=cherrypy.session, page='/')
    
    @cherrypy.expose
    def register(self, page='/', user='', pword='', submit=''):
        tmpl = lookup.get_template("register.mako")
        return tmpl.render(salutation="Hello", target="World", session=cherrypy.session, formdata=[user,pword,page], page='/register')
    
    @cherrypy.expose
    def doRegister(self, user, email, pword, page):
        conn = sqlite3.connect('data.db')
        c=conn.cursor()
        c.execute('SELECT * FROM users WHERE name=?',(user,))
        if c.fetchone() is not None:
            return "ERROR: User already exists"
        with open("/dev/random", 'rb') as f: salt=hashlib.sha256(f.read(32)).hexdigest()
        s=hashlib.sha256()
        s.update(pword)
        s.update(salt)
        passhash=s.hexdigest()
        c.execute('INSERT INTO users(name,email,password_hash,password_salt,created) VALUES (?,?,?,?,DATETIME(\'now\'))',(user,email,passhash,salt))
        conn.commit()
        conn.close()
        raise cherrypy.HTTPRedirect(page)
    
    @cherrypy.expose
    def doLogin(self, user, pword, page, submit):
        if submit=='Register':
            raise cherrypy.HTTPRedirect('/register', status=307)
        conn = sqlite3.connect('data.db')
        c=conn.cursor()
        c.execute('SELECT * FROM users WHERE name=?',(user,))
        user=c.fetchone()
        s=hashlib.sha256()
        s.update(pword)
        s.update(user[4])
        if s.hexdigest()!=user[3]:
            return "ERROR: Incorrect password"
        cherrypy.session['user']=user
        raise cherrypy.HTTPRedirect(page)
if __name__ == '__main__':
    cherrypy.server.socket_host = '0.0.0.0'
    cherrypy.quickstart(HelloWorld(),'/','booru.conf')
