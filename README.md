LetMeDoIt
=========
[Heroku App](http://letmedoit.herokuapp.com/)

TODO
----
+ Seed prüfen/erweitern
	```
	1. skills
	2. evtl bilder

	```

+ markierung/anzeige wenn eigenes gebot vorhanden auf task/project übersichten
+ Rspec Tests 
	```
	1. Request spec task,project delete
	2. request spec project edit
	3. div model specs (validates prüfen)
	4. mail specs (in request specs??)
	```
+ ???

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
	before test: rake db:test:prepare
	```
6.	Goto [http://localhost:3000](http://localhost:3000)
7.	Preset admin user
	```
	Mail: admin@admin.de
	Pass: admin5
	```
8.	Gmail Account
	```
	user: letmedoit2013@gmail.com
	pass: wasd1234
	```