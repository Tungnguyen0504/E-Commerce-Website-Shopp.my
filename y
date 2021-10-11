warning: LF will be replaced by CRLF in build/web/cart.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/change-password.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/checkout.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/designLogin/css/style.css.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/header.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/home.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/login.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/manage-account.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/manage-product.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/my-account.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/order-detail.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/order-history.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/shop-grid.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/single-product.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in build/web/success.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/add-account.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/cart.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/change-password.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/checkout.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/designLogin/css/style.css.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/header.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/home.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/login.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/manage-account.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/manage-order.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/manage-product.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/my-account.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/order-detail.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/order-history.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/shop-grid.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/single-product.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/success.jsp.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in web/update-account.jsp.
The file will have its original line endings in your working directory
[1mdiff --git a/DB.sql b/DB.sql[m
[1mindex b90536b..307824e 100644[m
[1m--- a/DB.sql[m
[1m+++ b/DB.sql[m
[36m@@ -10,6 +10,7 @@[m [mCREATE TABLE [Users] ([m
     [Password] VARCHAR(100) NULL,[m
     [IsAdmin] VARCHAR(100) NULL,[m
     [IsActive] VARCHAR(100) NULL,[m
[32m+[m	[32m[Image] VARCHAR(100) NULL,[m
     [FullName] VARCHAR(100) NULL,[m
     [Email] VARCHAR(100) NULL,[m
     [Address] VARCHAR(100) NULL,[m
[36m@@ -104,91 +105,97 @@[m [mCREATE TABLE [Feedback] ([m
 	[FeedbackDate] DATETIME NULL[m
 )[m
 [m
[32m+[m[32mCREATE TABLE [Coupon] ([m
[32m+[m	[32m[CouID] INTEGER IDENTITY(1,1) PRIMARY KEY,[m
[32m+[m	[32m[CouponName] VARCHAR(150) NULL,[m
[32m+[m	[32m[DiscountPercen] INTEGER NULL[m
[32m+[m[32m)[m
[32m+[m
 --Insert HE141593_Users[m
[31m-INSERT INTO Users VALUES('admin','123','TRUE','TRUE','Admin','ipsum@luctus.edu','P.O. Box 321, 7430 Pellentesque Avenue','Cumberland County','(0171) 082 0892');[m
[31m-INSERT INTO Users VALUES('Admin123','Admin123','TRUE','FALSE','Xander Heath','lorem@auctor.net','397-5632 Ut Avenue','Itterbeek','076 0952 0602');[m
[31m-INSERT INTO Users VALUES('block','123','FALSE','TRUE','Tung Nguyen','rutrum@Seddiamlorem.net','4916 Volutpat Avenue','Le Cannet','(025) 9094 8880');[m
[31m-INSERT INTO Users VALUES('tungnguyen','123','FALSE','TRUE','Kenyon Snow','amet@utnisi.org','Ap #714-7019 Commodo St.','Stewart','(016977) 4744');[m
[31m-INSERT INTO Users VALUES('Plzwu388','Mxxaju1340','TRUE','FALSE','Dennis Jordan','sodales@diameu.com','Ap #968-5991 Viverra. St.','Åkersberga','(027) 5581 6257');[m
[31m-INSERT INTO Users VALUES('Lilrv639','Eygzai5941','FALSE','TRUE','Eagan Stanton','Donec@Fusce.co.uk','Ap #368-7583 Rutrum Avenue','San Pedro','0500 987317');[m
[31m-INSERT INTO Users VALUES('Qanlm875','Vnqtxs5047','FALSE','FALSE','Colton Joseph','molestie@Donecest.org','P.O. Box 901, 4241 Cursus Rd.','Pereto','0800 629318');[m
[31m-INSERT INTO Users VALUES('Cgpjm603','Ylljlg5447','TRUE','TRUE','Griffin Knapp','arcu@arcuMorbi.ca','Ap #242-3189 Vehicula Street','GrivegnŽe','(0113) 604 7733');[m
[31m-INSERT INTO Users VALUES('Kaydq268','Dmjlxf5406','TRUE','FALSE','Lucy Camacho','em@dignissimlacus.com','8789 Et, Street','Markham','(020) 0564 8606');[m
[31m-INSERT INTO Users VALUES('Qjguc206','Xybprw6945','FALSE','TRUE','May Holloway','sem@dolorelit.edu','196-5809 Sociis St.','Pescopagano','0500 008344');[m
[32m+[m[32mINSERT INTO Users VALUES('admin','123','TRUE','TRUE','user1.jpg','Admin','ipsum@luctus.edu','P.O. Box 321, 7430 Pellentesque Avenue','Cumberland County','(0171) 082 0892');[m
[32m+[m[32mINSERT INTO Users VALUES('Admin123','Admin123','TRUE','FALSE','user2.jpg','Xander Heath','lorem@auctor.net','397-5632 Ut Avenue','Itterbeek','076 0952 0602');[m
[32m+[m[32mINSERT INTO Users VALUES('block','123','FALSE','TRUE','user3.jpg','Tung Nguyen','rutrum@Seddiamlorem.net','4916 Volutpat Avenue','Le Cannet','(025) 9094 8880');[m
[32m+[m[32mINSERT INTO Users VALUES('tungnguyen','123','FALSE','TRUE','user4.jpg','Kenyon Snow','amet@utnisi.org','Ap #714-7019 Commodo St.','Stewart','(016977) 4744');[m
[32m+[m[32mINSERT INTO Users VALUES('Plzwu388','Mxxaju1340','TRUE','FALSE','user1.jpg','Dennis Jordan','sodales@diameu.com','Ap #968-5991 Viverra. St.','Åkersberga','(027) 5581 6257');[m
[32m+[m[32mINSERT INTO Users VALUES('Lilrv639','Eygzai5941','FALSE','TRUE','user2.jpg','Eagan Stanton','Donec@Fusce.co.uk','Ap #368-7583 Rutrum Avenue','San Pedro','0500 987317');[m
[32m+[m[32mINSERT INTO Users VALUES('Qanlm875','Vnqtxs5047','FALSE','FALSE','user3.jpg','Colton Joseph','molestie@Donecest.org','P.O. Box 901, 4241 Cursus Rd.','Pereto','0800 629318');[m
[32m+[m[32mINSERT INTO Users 