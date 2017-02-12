# Common query of SQL
# Installation of `Codeigniator`, `Express JS` and `Zend framework`
# Required server configuration in PHP
# Mongo DB like condition

{Sql Query }

SELECT u.uid,u.emailid 
FROM USER u 
LEFT JOIN (SELECT ul.uid, MAX(ul.login_time) AS login_tm FROM user_log ul GROUP BY ul.uid ) uld ON u.uid = uld.uid 
WHERE uld.login_tm < 1455559472;


{ Insert the value using another table value as input }

Insert into <table_name> (field1, field2, ...)
select (field1, filed2, ...) from <table_name> where <condition>

{ Update the values using another table values as input }

update <table_name> set field1 , field2 ..
select (field1, field2...) from <table_name> where <condition>

{How can you define multiple document root}

If you need to run multiple application in single server and port but need to set the different document roots
Then you need to setup a Virtual Host using httpd.conf file with following code

Listen 81
<VirtualHost *:81>
	DocumentRoot "<doc_root_folder_name>"
	<Directory "<doc_root_folder_name>" ></Directory>
</VirtualHost>
{End}

{ Installation: Zend Framwork }

Zend (1.12.xx)(without composer)::
Zend (1.12.xx)(with composer):: https://www.youtube.com/watch?v=NJVS5yt5fHw 

{ Node JS :: Express JS }

configuration- 
install the express-generator JS
>npm install express-generator -g -save
>express -c -e {to install the css skeleton}

├── app.js
├── bin
│   └── www
├── package.json
├── public
│   ├── images
│   ├── javascripts
│   └── stylesheets
│       └── style.css
├── routes
│   ├── index.js
│   └── users.js
└── views
    ├── error.jade
    ├── index.jade
    └── layout.jade

{ Mongo DB like conditions }

db.<colloection_name>.find({'<field_name>':/^fp/},{'<field_name>':/.*m.*/}).count()
db.<colloection_name>.remove()

{ Multiple Server Configuration in PHP }

1. open apache/config/extra/
2. httpd-vhosts.conf
<VirtualHost *:81>    
    ServerName localhost {recomondad by user}
    DocumentRoot "C:/xampp/htdocs/newit" {main root folder}

    <Directory "C:/xampp/htdocs/newit">
        Options Indexes FollowSymLinks Includes ExecCGI
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
3. Smilarly you need to create many more but while running those remember that you need to mentioned the port value
4. open C:/Windows/System32/drivers/etc
5. Make changes on hosts file
  127.0.0.1    localhost
  127.0.0.1    mysite.localhost.com

Note: if you want run the PHP in command prompt then please type >php -s {server} localhost:81

{ Codeigniator Installation }

https://www.formget.com/insert-data-into-database-using-codeigniter/ 

1. Open the application/config/config.php file with a text editor and set your base URL. If you intend to use encryption or sessions, set your encryption key.
2. Each class of codeigniator controller extends from CI_Controller
3. Display the view $this->load->view('<define_file_name>');
4. Pass the variable Array/ Interget value and display it in form
	$this->load->view('<define_file_name>', $value_array);
	Displaying the variable_array value we need to use the key / index of array.
Note:controller -> view
5. if you need to remove the index.php(mysite/index.php/<controller_name>) in browser and directly want to call controller the 
   create .htaccess file in application root folder and write the below code 
   	RewriteEngine on
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteCond %{REQUEST_FILENAME} !-d
	RewriteRule .* index.php/$0 [PT,L]
6. model for declare the DB archetecture and it must extends from CI_model. Your model name similar to your file name and first latter of model must be capitel.
7. loading the model $this->load->model('<model_name>'); and we can retrive the model values using $this->model_name->method();
8. if you want to autoload the all models then initilize the array variable $autoload['model'] = array('<model_name1>','<model_name2>' ..);
9. helpers, default helpers are in system/helpers. even you can create your own helpers like application/helpers. For loading the helpers you
need to write the code $this->load->helper('<helper_name>')
10. if you want to set the default page value then go to routes.php (application/config/routes.php) and set the variable value $route['default_controller'].
Then once you click ot url in broser it will rediect you the default contoller.
11. if you want to call the model then $this->load->model('<model_name>'); and extends from CI_Model
12. if you wan access the db library then either you need to add the object value in autoload.php file $autoload[‘libraries’] = array(‘database’);
  or else you need to define the "$this->load->database();" in model constuctor

