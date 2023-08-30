# Mobile-Marketplace

# Software
- MySQL Server >= 8.0.32
- MySQL Workbench >= 8.0.29
- Python >= 3.9
- (Optional) VScode == latest version
  
# Dependency Packages
(make sure your version of python3 running this app has following library installed)
- Pymysql == latest version (python3 -m pip install pymysql)
- Numpy == latest version (python3 -m pip install numpy)
- Matplotlib == latest version (python3 -m pip install matplotlib)
  
# Database Setup
1. Download and unzip the zip file “YanYZhuZ_project.zip”
2. Open MySQL Workbench > connect to localhost
3. Import dump file by using the tool bar: Server > Data Import > Select “Import from
Self-Contained File” > Start Import (Make sure the name of the imported schema is “online_phone_sales_db”)

# Using Application
4. Use VScode or system terminal, direct to the folder
“YanYZhuZ_project/phone_store_app”
5. Use the following cmd line to start this application: “python3 main.py” (make sure your
version of python3 running this app has Pymysql, Numpy, Matplotlib installed)
6. You will be prompted to input your username and password to log into MySQL server
7. Once successfully logged in and connected to the database server, you will find the
“HOME PAGE” with the following options:
a. Create New Account (register new account for this app)
b. Login (log into the app with username and password)
c. Exit (terminate application)
