LetMeDoIt
=========
[Heroku App](http://letmedoit.herokuapp.com/)

Programs
--------

+ [Railsinstaller](http://railsinstaller.org/)
+ [github for Windows](http://windows.github.com/)
	Console Guide:
	http://rogerdudler.github.com/git-guide/index.de.html
+ [Sublime Text](http://sublimetext.com)

Getting started
---------------

1.	Install above mentioned software
2.	Synchronize project with github ("Clone in Windows"-Button)
3.	Open cmd windows (or powershell, supplied with github)
4.	cd to local github dir (C:\Users\xxx\Documents\GitHub\LetMeDoIt)
5.	run following commands

	```bash
	bundle install
	rake db:migrate
	rake db:seed
	rails server
	```
6.	Goto [http://localhost:3000](http://localhost:3000)
7.	Preset admin user
	```
	Mail: admin@admin.de
	Pass: admin5
	```