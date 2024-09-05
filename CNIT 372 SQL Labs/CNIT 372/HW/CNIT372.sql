Drop table HW1_Q1_CONTACT;
Drop table Shipment;

CREATE TABLE HW1_Q1_CONTACT (
  user_id int,
  username varchar(255) ,
  first_name varchar(50) ,
  last_name varchar(50) ,
  City varchar(10) ,
  password varchar(50) ,
  status varchar (10) ,
  PRIMARY KEY (user_id));


Insert into HW1_Q1_CONTACT values ('C-300001', 'Baker and Company', 'Gregory', 'Abbott', 'Mr.', '7837 Busse Rd.', 'Terre Haute', 'IN', '47813', '812-447-3621', '812-447-4602', 'greggie@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300002', 'Cole Sales and Associates', 'Tommy', 'McFerren', 'Dr.', '3817 Farrell Rd.', 'Bend', 'OR', '97709', '503-767-7054', '503-767-3394', 'mcferren@cole.com');	
Insert into HW1_Q1_CONTACT values ('C-300003', 'Tippe Inn', 'Cecil', 'Scheetz', 'Ms.', '391 Weber Rd.', 'Waterville', 'ME', '04903', '207-679-9822', '207-679-6367', 'cecil@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300004', 'Franklin Trinkets', 'Frank', 'Aamodt', 'Mr.', '3304 Leredo Ave.', 'New Milford', 'CT', '06776', '898-762-8741', '898-762-9493', 'fa@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300005', 'Needle Center', 'Kathleen', 'Plyman', 'Ms.', '7627 Belmont Ave', 'New York City', 'NY', '10131', '507-543-2052', '507-543-1845', 'needles@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300006', 'BMA Advertising Design', 'George', 'Purcell', 'Mr.', '4281 Jefferson Rd.', 'Scranton', 'PA', '18522', '432-320-6905', '432-320-5741', 'design@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300007', 'Regency Hospital', 'Eugene', 'Gasper', 'Mr.', '7022 Ward Lake Rd.', 'Barre', 'VT', '05641', '705-580-6124', '705-580-4250', 'medcare@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300008', 'South Street Rehabilitation', 'Jared', 'Meers', 'Mr.', '4271 Airport Rd.', 'Grand Forks', 'ND', '58026', '701-371-1701', '701-371-1372', 'rehabsouth@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300009', 'Dixon Pharmacy', 'Tracy', 'Cicholski', 'Mrs.', '1920 Albion St.', 'Crystal Springs', 'MS', '39059', '601-959-1315', '601-959-4277', 'dixpharm@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300010', 'Photography Niche', 'Bruce', 'Fogarty', 'Mr.', '1012 Island Ave.', 'Ellenboro', 'WV', '26346', '598-791-1420', '598-791-8582', 'photoniche@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300011', 'Family Medical Center', 'Susan', 'Strong', 'Mrs.', '5883 Sudbury Rd.', 'Adel', 'GA', '31620', '912-760-7840', '912-760-8489', 'fammed@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300012', 'Bryant Accounting', 'Ginger', 'Xiao', 'Mrs.', '6636 Walnut St.', 'Rapid City', 'SD', '57703', '605-846-0451', '605-846-5219', 'acctsbryant@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300013', 'Recreation Supply', 'Karen', 'Burns', 'Dr.', '2850 Farm St.', 'Modesto', 'CA', '95354', '707-598-2670', '707-598-3072', 'burnskaren@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300014', 'R and R Air', 'Cathy', 'Bending', 'Mrs.', '9573 Chestnut St.', 'Evansville', 'IN', '47732', '765-617-2811', '765-617-5319', 'rrair@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300015', 'Vets Inc.', 'Evelyn', 'Cassens', 'Ms.', '6094 Pearson St.', 'Newark', 'DE', '19726', '302-762-9526', '302-762-3338', 'dr.animal@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300016', 'Goodwork Corporation', 'Angie', 'Hoover', 'Ms.', '6427 Genesee St.', 'Casper', 'WY', '82638', '307-459-4165', '307-459-2606', 'ahoover@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300017', 'Powerful Employment', 'Jim', 'Sokeland', 'Mr.', '6671 Pearl Rd.', 'Reisterstown', 'MD', '21136', '723-366-1117', '723-366-0896', 'employment@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300018', 'Wadake Critters', 'Hugo', 'Gillespie', 'Mr.', '4194 Northfield Rd.', 'Salina', 'KS', '67402', '785-981-0669', '785-981-6634', 'critters@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300019', 'Conner National', 'Wade', 'Jacobs', 'Ms.', '2610 E. Lake Rd.', 'Scranton', 'ND', '58653', '803-477-5347', '803-477-5487', 'connernat@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300020', 'Cottingham Plastics', 'Brittany', 'Cottingham', 'Ms.', '4234 Taylor Rd.', 'Lima', 'OH', '45819', '419-464-5273', '419-464-7239', 'plastic@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300021', 'Realty Specialties', 'David', 'Tarter', 'Mr.', '6274 Blue Rock Rd.', 'Syracuse', 'NY', '13261', '518-500-0570', '518-500-6159', 'estate@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300022', 'Reflexions Manufacturing', 'Heather', 'Wallpe', 'Ms.', '4128 Hulen St.', 'Park Hills', 'MO', '63653', '816-433-9799', '816-433-3621', 'flex@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300023', 'TAS', 'Robert', 'Dalury', 'Mr.', '4718 Pleasant Valley Rd.', 'Bay City', 'MI', '48708', '906-278-6446', '906-278-4345', 'tas@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300024', 'Bankruptcy Help', 'Jim', 'Lichty', 'Mr.', '5991 Kenwood Rd.', 'Chicago', 'IL', '60624', '618-847-1904', '618-847-6439', 'bankrupt@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300025', 'Railroad Express', 'Dusty', 'Jones', 'Dr.', '1390 Clearview Pkwy.', 'Eastport', 'ID', '83826', '674-727-0511', '674-727-1560', 'rr@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300026', 'City Bus Transport', 'Larry', 'Osmanova', 'Mr.', '256 Royal Ln.', 'Salem', 'OR', '97311', '541-905-4819', '541-905-8042', 'citybus@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300027', 'Vacation Car Rentals', 'Richard', 'Strehle', 'Mr.', '9862 Rock Island Rd.', 'Walla Walla', 'WA', '99362', '206-434-7305', '206-434-1892', 'vacation@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300028', 'Cheesman Corporation', 'Brenda', 'Kitchel', 'Mrs.', '6482 Thomasen Rd.', 'Roanoke', 'VA', '24011', '804-214-8732', '804-214-1253', 'cheesman@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300029', 'Down Deep Drilling Inc.', 'Don', 'Torres', 'Mr.', '1979 Illinois Ave.', 'Elberton', 'GA', '30635', '706-649-6375', '706-649-0420', 'drill@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300030', 'Main St. Bar and Grill', 'Richard', 'Kluth', 'Dr.', '7901 Peach Tree Dr.', 'Middletown', 'DE', '19709', '302-296-8012', '302-296-5060', 'rickkluth@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300031', 'Copy Center', 'Allen', 'Robles', 'Mr.', '1228 Bailey Rd.', 'Haxtun', 'CO', '80761', '644-730-8090', '644-730-3557', 'copy@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300032', 'Greenpart Steet Metal', 'Archie', 'Doremski', 'Mr.', '6580 Midway Rd.', 'Cody', 'WY', '82414', '307-944-8959', '307-944-3950', 'sheetz@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300033', 'Pools For You', 'Daniel', 'Ezra', 'Mr.', '7393 Lake June Rd.', 'Auburn', 'ME', '04212', '207-744-1997', '207-744-8795', 'swim@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300034', 'Phone Corporation', 'Dean', 'Katpally', 'Mr.', '1179 38th St.', 'Kapaa', 'HI', '96746', '808-799-3727', '808-7991677', 'phonecorp@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300035', 'Store It Here', 'Randall', 'Neely', 'Mr.', '1132 Madison St.', 'Rutland', 'VT', '05701', '802-319-9805', '802-319-1266', 'storage@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300036', 'Kids Recreation Inc.', 'Mike', 'Condie', 'Mr.', '449 Troy Ave.', 'Wilson', 'NC', '27895', '336-211-1238', '336-211-3812', 'kidrec@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300037', 'Trailor Rentals', 'Tim', 'Leffert', 'Mr.', '2765 Independence Ave.', 'Rome', 'NY', '13442', '315-486-4777', '315-486-0683', 'trailrent@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300038', 'Water Analysts', 'Carl', 'Dallas', 'Mr.', '2530 Lakewood Blvd.', 'Sumter', 'SC', '29153', '864-541-5114', '864-541-9632', 'analyzeh20@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300039', 'Gards Auto Repair', 'Dennis', 'Sammons', 'Mr.', '581 Sahara Blvd.', 'Saginaw', 'MI', '48609', '616-544-1969', '616-544-3365', 'repairit@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300040', 'Computer Consultants', 'Mildred', 'Jones', 'Ms.', '2278 Flamingo Rd.', 'Allentown', 'PA', '18195', '610-437-6687', '610-437-6210', 'compconsul@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300041', 'Laser Graphics Associates', 'Paul', 'Kaakeh', 'Mr.', '3616 Jones Blvd.', 'Gunnison', 'CO', '81247', '719-750-4539', '719-750-9842', 'graphit@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300042', 'Signs Signs Signs', 'Kevin', 'Zubarev', 'Mr.', '5933 Valley St.', 'Blackfoot', 'ID', '83221', '208-364-3785', '208-364-5230', 'sign3@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300043', 'Flowers by Mickey', 'Mary', 'Uhl', 'Ms.', '6936 Citrus Blvd.', 'Charleston', 'SC', '29413', '803-974-2809', '803-974-6131', 'mouse@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300044', 'Kelly Dance Studio', 'Jennifer', 'Kmec', 'Mrs.', '9413 E. Broadway St.', 'Taneytown', 'MD', '21787', '443-542-1386', '443-542-0474', 'dancingk@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300045', 'National Art Museum', 'Marjorie', 'Vandermay', 'Ms.', '5384 Raymond Ave.', 'Beatrice', 'NE', '68310', '308-489-1137', '308-489-9640', 'nam@fast com');	
Insert into HW1_Q1_CONTACT values ('C-300046', 'Tuckers Jewels', 'Stephanie', 'Yeinick', 'Ms.', '2596 S. Fairview Rd.', 'Moberly', 'MO', '65270', '573-455-4278', '573-455-3163', 'jewels@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300047', 'The Employment Agency', 'Cathy', 'Harvey', 'Mrs.', '9481 Town Line Rd.', 'Asheville', 'NC', '28810', '336-477-0249', '336-477-7464', 'findwork@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300048', 'Cleaning Supply', 'Geo', 'Schofield', 'Mr.', '4931 Talbot Blvd.', 'Winona', 'MS', '38967', '228-480-9751', '228-480-4037', 'cleanit@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300049', 'Appliances Inc.', 'Kara', 'Orze', 'Ms.', '2666 Stillwater Rd.', 'Wausau', 'WI', '54401', '414-773-1017', '414-773-2842', 'appinc@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300050', 'Quality Equipment Corp.', 'Jeff', 'Kowaiski', 'Mr.', '3323 Mission Pkwy.', 'Wellsville', 'NY', '14895', '212-492-5644', '212-492-9525', 'equipit@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300051', 'Sharons Shamrock', 'Sharon', 'Rouls', 'Mrs.', '1274 Weaver Rd.', 'Dothan', 'AL', '36303', '205-246-3224', '205-246-5699', 'irish@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300052', 'Manufactured Homes Corp.', 'Sherry', 'Garling', 'Ms.', '4350 Concord Blvd.', 'Millinockets', 'ME', '04462', '353-822-7623', '353-822-9722', 'homely@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300053', 'Camping Supplies', 'Mary', 'Deets', 'Mrs.', '4534 South Acres Rd.', 'Pearl City', 'HI', '96782', '808-562-4081', '808-562-0004', 'camphere@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300054', 'Financial Planning Consul', 'Dennis', 'Drazer', 'Dr.', '4799 Silverstar Rd.', 'Seattle', 'WA', '98115', '253-315-4247', '253-315-7522', 'dollarplan@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300055', 'Fire Alarm Systems', 'Robert', 'Lister', 'Mr.', '3016 Dunlap Ave.', 'Provo', 'UT', '84603', '801-404-1240', '801-404-8056', 'fines@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300056', 'Happytime Escort Service', 'Heather', 'Waters', 'Mrs.', '805 Cactus Rd.', 'Lake City', 'SC', '29560', '869-741-7817', '869-741-0539', 'dates@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300057', 'Industrail Contracting Co', 'Anita', 'Pastron', 'Ms.', '2817 Northern Ave.', 'McMinnville', 'TN', '37111', '901-796-4654', '901-796-3276', 'contracts@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300058', 'Outlets', 'Amy', 'Heide', 'Ms.', '9119 Camelback Rd.', 'Brattleboro', 'VT', '05304', '802-894-1024', '802-894-1135', 'letout@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300059', 'Rydell High School', 'Charlene', 'Franks', 'Mrs.', '1627 Thomas Rd.', 'Douglas', 'WY', '82633', '307-892-2938', '307-892-1477', 'learn@rydell.edu');	
Insert into HW1_Q1_CONTACT values ('C-300060', 'Collectibles Inc.', 'Doug', 'Blizzard', 'Mr.', '856 Van Buren St.', 'Mars Hill', 'MS', '39666', '228-646-5114', '228-646-2170', 'collectit@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300061', 'Karate Made Easy', 'Richard', 'Scott', 'Mr.', '1489 Dobbins Rd.', 'Fairmont', 'WV', '26555', '304-774-2226', '304-774-8150', 'kick@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300062', 'Security Installation', 'Scott', 'Gray', 'Mr.', '115 Shea Blvd.', 'York', 'PA', '17406', '484-453-7105', '484-453-6614', 'keepsafe@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300063', 'Ceramic Supply', 'Randy', 'Talauage', 'Mr.', '6364 Brown St.', 'Northport', 'WA', '99157', '347-671-2022', '347-671-9116', 'paintit@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300064', 'Bobs Repair Service', 'Daniel', 'Hundnall', 'Mr.', '909 Reams Rd.', 'Enid', 'OK', '73705', '918-830-9731', '918-830-3898', 'fixit@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300065', 'Investment Specialties', 'Sally', 'Valle', 'Dr.', '6298 Killingsworth St.', 'Denton', 'TX', '76208', '972-234-2044', '972-234-1543', 'roi@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300066', 'North Street Church', 'Noemi', 'Elston', 'Mr.', '3024 28th St.', 'Rock Springs', 'WY', '82902', '307-359-9514', '307-359-8090', 'closetoheaven@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300067', 'Supplying Crafts', 'Kelly', 'Jordan', 'Ms.', '168 Division St.', 'Jacksonville', 'FL', '32205', '727-951-7737', '727-951-9889', 'supplycrafts@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300068', 'Cellular Services', 'Steve', 'Fulkerson', 'Mr.', '6912 White Horse Rd.', 'Snowflake', 'AZ', '85937', '602-129-1885', '602-129-5545', 'cellcall@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300069', 'Easy Internet Access', 'Orville', 'Gilliland', 'Mr.', '5515 Page-Mill Rd.', 'Vancleeve', 'MS', '39565', '490-263-2957', '490-263-6303', 'eia@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('C-300070', 'Sampson Home Mortgages', 'Bridgette', 'Kyger', 'Mrs.', '5682 Chester Pike Rd.', 'Annapolis', 'MD', '21412', '301-467-6480', '301-467-5740', 'homeloans@fast.com');	
Insert into HW1_Q1_CONTACT values ('C-300071', 'The Cable Company', 'Norman', 'Fields', 'Dr.', '4174 Collings St.', 'Juneau', 'AK', '99811', '501-346-4841', '501-346-0928', 'catv@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('C-300072', 'Automart', 'Jessica', 'Nakamura', 'Ms.', '8233 Clairton Ave.', 'Mitchell', 'SD', '57301', '605-324-2193', '605-324-1030', 'carsell@usol.com');	
Insert into HW1_Q1_CONTACT values ('C-300073', 'First National Bank', 'Jack', 'Barrick', 'Mr.', '2638 Becks Run Rd.', 'Titusville', 'FL', '32783', '786-494-4782', '786-494-1359', '1natbank@free.com');	
Insert into HW1_Q1_CONTACT values ('C-300074', 'Apartment Referrals', 'Aricka', 'Bross', 'Ms.', '555 W. Liberty Ave.', 'Jewett', 'OH', '43986', '419-676-9758', '419-676-3995', 'placetolive@free.com');	
Insert into HW1_Q1_CONTACT values ('I-300001', null, 'Anna', 'Mayton', 'Dr.', '2381 Basse Rd.', 'McKenzie', 'Al', '36456', '888-451-1233', null, 'doctor@free.com');	
Insert into HW1_Q1_CONTACT values ('I-300002', null, 'Lou', 'Caldwell', 'Mr.', '1486 Joliet Rd.', 'Louisville', 'KY', '40211', '606-901-1238', null, 'lucky@fast.com');	
Insert into HW1_Q1_CONTACT values ('I-300003', null, 'Carl', 'Hague', 'Mr.', '2711 143rd St.', 'Cincinnati', 'OH', '45207', '419-890-3531', null, null);	
Insert into HW1_Q1_CONTACT values ('I-300004', null, 'Jeffery', 'Jordan', 'Mr.', '1500 Normantown Rd.', 'Spokane', 'WA', '99211', '509-989-9996', null, 'seeya@usol.com');	
Insert into HW1_Q1_CONTACT values ('I-300005', null, 'Kimber', 'Spaller', 'Mrs.', '1565 Culebra Rd.', 'Sitka', 'AK', '99836', '878-119-5448', null, 'mcgimmie@zero.net');	
Insert into HW1_Q1_CONTACT values ('I-300006', null, 'Eric', 'Fannon', 'Mr.', '2526 Nelson Rd.', 'Redding', 'CA', '96003', '209-980-0812', null, 'ef@free.com');	
Insert into HW1_Q1_CONTACT values ('I-300007', null, 'Jessica', 'Cain', 'Ms.', '942 55th St.', 'Greenville', 'MI', '48838', '517-901-2610', null, null);	
Insert into HW1_Q1_CONTACT values ('I-300008', null, 'Richard', 'Zito', 'Mr.', '7569 130th St.', 'Lebanon', 'NH', '03766', '603-787-0787', null, 'rzito@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('I-300009', null, 'Angela', 'Wainscott', 'Dr.', '3646 North Ave.', 'Idaho Falls', 'ID', '83415', '208-788-4112', null, 'awainscott@free.com');	
Insert into HW1_Q1_CONTACT values ('I-300010', null, 'James', 'Gross', 'Dr.', '1983 Mill St.', 'Lakewood', 'NJ', '08701', '908-879-8672', null, 'jgross@fast.com');	
Insert into HW1_Q1_CONTACT values ('I-300011', null, 'Jack', 'Akers', 'Mr.', '1485 71st St.', 'Wilmington', 'DE', '19850', '301-454-6061', null, 'pizazz@usol.com');	
Insert into HW1_Q1_CONTACT values ('I-300012', null, 'Kevin', 'Jackson', 'Mr.', '5990 Cuba Rd.', 'New Orleans', 'LA', '70123', '225-624-2341', null, null);	
Insert into HW1_Q1_CONTACT values ('I-300013', null, 'Shirley', 'Osborne', 'Mrs.', '816 Penny Rd.', 'Swainsboro', 'GA', '30401', '706-333-7174', null, null);	
Insert into HW1_Q1_CONTACT values ('I-300014', null, 'Eric', 'Becker', 'Mr.', '8784 Wabash Ave.', 'Kinston', 'NC', '28504', '910-717-7613', null, 'daddyo@usol.com');	
Insert into HW1_Q1_CONTACT values ('I-300015', null, 'Karen', 'Mangus', 'Mrs.', '4804 Ridge Rd.', 'Sebring', 'FL', '33871', '863-623-0459', null, 'missright@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('I-300016', null, 'Peter', 'Austin', 'Mr.', '4804 River Rd.', 'Barnwell', 'SC', '29812', '803-343-6063', null, null);	
Insert into HW1_Q1_CONTACT values ('I-300017', null, 'Brad', 'Arquette', 'Mr.', '2599 Ben Hill Rd.', 'Tonopah', 'NV', '89049', '775-914-4294', null, 'arq@usol.com');	
Insert into HW1_Q1_CONTACT values ('I-300018', null, 'Daniel', 'Barton', 'Mr.', '4599 Atlanta Rd.', 'Sweetwater', 'TX', '79556', '915-894-8034', null, 'dannie@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('I-300019', null, 'Jerry', 'Mennen', 'Dr.', '869 Clay St.', 'Flagstaff', 'AZ', '86038', '520-306-8426', null, 'mennenj@free.com');	
Insert into HW1_Q1_CONTACT values ('I-300020', null, 'Kenneth', 'Wilcox', 'Mr.', '9364 Hershell Rd.', 'Creston', 'IA', '50801', '515-872-8848', null, 'kenny@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('I-300021', null, 'Matt', 'Smith', 'Mr.', '6804 All Rd.', 'Montrose', 'CO', '81402', '719-822-8828', null, 'matsm@fast.com');	
Insert into HW1_Q1_CONTACT values ('I-300022', null, 'Paul', 'Sullivan', 'Mr.', '9399 Flat Rd.', 'Wichita', 'KS', '67251', '785-322-5896', null, 'sullie@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('I-300023', null, 'Gerald', 'Campbell', 'Dr.', '1869 Boundary St.', 'Westfield', 'WI', '53964', '431-087-1044', null, 'gcampbell@free.com');	
Insert into HW1_Q1_CONTACT values ('I-300024', null, 'Joan', 'Hedden', 'Mrs.', '4518 Red Bud Trail', 'Springdale', 'AR', '72765', '501-710-0658', null, null);	
Insert into HW1_Q1_CONTACT values ('I-300025', null, 'Ronald', 'Miller', 'Mr.', '360 Spring St.', 'Kalamazoo', 'MI', '49008', '734-820-2076', null, 'picky@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('I-300026', null, 'Terry', 'Xu', 'Ms.', '2019 Elm St.', 'Columbia', 'MO', '65215', '417-546-2570', null, 'muffin@fast.com');	
Insert into HW1_Q1_CONTACT values ('I-300027', null, 'Danita', 'Sharp', 'Ms.', '3475 Mystic St.', 'Yakima', 'WA', '98908', '360-650-5604', null, 'girlfriend@fast.com');	
Insert into HW1_Q1_CONTACT values ('I-300028', null, 'Don', 'Kaleta', 'Mr.', '8948 Washington St.', 'Altoona', 'PA', '16602', '724-695-2157', null, 'stud@zeronet.net');	
Insert into HW1_Q1_CONTACT values ('I-300029', null, 'Tammi', 'Baldocchio', 'Ms.', '924 North Ave.', 'Slatersville', 'RI', '02876', '401-989-4975', null, null);	
Insert into HW1_Q1_CONTACT values ('I-300030', null, 'Eric', 'Quintero', 'Mr.', '144 Concord Rd.', 'Columbus', 'IN', '47202', '812-805-1588', null, 'diamond@onlineservice.com');	
Insert into HW1_Q1_CONTACT values ('I-300031', null, 'Phillip', 'Hession', 'Mr.', '7610 Hartford Ct.', 'Battle Creek', 'MI', '49016', '231-711-6837', null, 'howdy@usol.com');	
Insert into HW1_Q1_CONTACT values ('I-300032', null, 'Ruth', 'Albeering', 'Dr.', '1348 Yonge Rd.', 'Galax', 'VA', '24333', '784-444-0131', null, 'rabeering@free.com');	
	
COMMIT;

alter table HW1_Q1_CONTACT add constraint HW1_Q1_CONTACT_PK 
	primary key (CustomerID);
drop table HW1_Q1_CONTACT cascade constraints;
Select DISTINCT(user_id),username,first_name,last_name,city ,password,status  
from HW1_Q1_CONTACT;

update HW1_Q1_CONTACT SET City="New York" Where User_id;
Delete FROM HW1_Q1_CONTACT where CustTitle  IN (HW1_Q1_CONTACT);
Select DISTINCT(first_name),username,last_name,city ,password,status  from HW1_Q1_CONTACT;
Where City = ”New York”;

create table CUSTORDERLINE(
	OrderID			varchar2(10)	,
	PartNumber		varchar2(10)	,
	UnitPrice		number(9,2)	,	
	OrderQuantity		number(9)	,	
	Discount		number(6,2)	,	
	Status			varchar2(15),	
primary key (OrderID,PartNumber)
);
Insert into CUSTORDERLINE values ('2000000001', 'CAB-020', 19.99, 2, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000001', 'CRD-005', 59.99, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000001', 'CTR-001', 1875.49, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000001', 'PRT-001', 399, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000002', 'CAB-022', 9.99, 6, 5, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000002', 'CTR-025', 1624.79, 4, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000002', 'MON-002', 399, 4, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000002', 'PRT-006', 299, 4, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000002', 'SCN-002', 249, 2, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000003', 'CTR-029', 1757.49, 1, 5, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000003', 'PRT-006', 99, 1, 5, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000003', 'SCN-001', 129, 1, 5, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000004', 'CTR-017', 1175.29, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000004', 'MON-005', 249.99, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000004', 'SFT-008', 9.99, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000005', 'CTR-009', 1344.59, 2, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000005', 'MON-002', 399, 2, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000005', 'PRT-003', 699, 2, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000005', 'SFT-005', 9.99, 1, 3, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000006', 'SCN-001', 129, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000006', 'SFT-001', 9.99, 3, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000006', 'SFT-002', 9.99, 3, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000007', 'CAB-021', 14.99, 10, 3, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000007', 'CRD-001', 149.99, 15, 3, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000007', 'CRD-007', 49.99, 15, 3, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000008', 'ADT-005', 29.99, 2, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000008', 'BRK-009', 5.99, 6, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000008', 'ICAB-004', 19.99, 2, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000008', 'POW-003', 1.99, 2, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000009', 'BRK-008', 5.99, 20, 3, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000009', 'CRD-004', 99.99, 9, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000009', 'POW-003', 1.99, 20, 3, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000010', 'CTR-007', 1545.29, 15, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000010', 'PRT-006', 99, 15, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000011', 'CTR-023', 1846.79, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000011', 'SCN-002', 249, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000011', 'SFT-005', 9.99, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000011', 'SFT-006', 9.99, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000012', 'CTR-015', 1204.99, 6, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000012', 'MON-007', 179.99, 6, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000012', 'PRT-004', 299, 6, 10, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000013', 'CTR-028', 1326.89, 1, 0, 'SHIPPED');	
Insert into CUSTORDERLINE values ('2000000013', 'MON-003', 299, 1, 0, 'SHIPPED');	
commit;

drop table CustOrderLine cascade constraints;
alter table CustOrderLine add constraint CustOrderLine_CustOrder_FK 
	foreign key (OrderID) references CustOrder;
Select DISTINCT(PartNumber),UnitPrice,OrderQuantity, Discount, Status from CUSTORDERLINE;

update  CUSTORDERLINE  SET  UnitPrice ="499" Where OrderID;	
Delete FROM CUSTORDERLINE where UnitPrice  IN (Reard);
Select DISTINCT(OrderQuantity), Discount, Status from CUSTORDERLINE;
Where UnitPrice= ”699”;

create table Shipment(
	ShipmentID		varchar2(10)	,
	OrderID			varchar2(10)	,
	ShipperID		number(4)	,
	ShipName		varchar2(20)	,
	ShipAddress		varchar2(40)	,
	ShipCity		varchar2(20)	,
	ShipState		varchar2(2)	,
	ShipPostalCode		varchar2(10)	
);
Insert into SHIPMENT values ('H001', '2000000002', 2, 'Jared Meers', '4271 Airport Rd.', 'Grand Forks', 'ND', '58206');	
Insert into SHIPMENT values ('H002', '2000000005', 1, 'Cecil Scheetz', '391 Weber Rd.', 'Waterville', 'ME', '04903');	
Insert into SHIPMENT values ('H003', '2000000007', 4, 'Evelyn Cassens', '6094 Pearson Ave.', 'Newark', 'DE', '19726');	
Insert into SHIPMENT values ('H004', '2000000009', 2, 'Geo Schofield', '4931 Talbot Blvd.', 'Winona', 'MS', '38967');	
Insert into SHIPMENT values ('H005', '2000000010', 5, 'Kathleen Plyman', '7626 Belmont Ave.', 'New York City', 'NY', '10131');	
Insert into SHIPMENT values ('H006', '2000000012', 1, 'Mildred Jones', '2278 Flamingo Rd.', 'Allentown', 'PA', '18195');	
Insert into SHIPMENT values ('H007', '2000000014', 1, 'Susan Strong', '5883 Sudbury Rd.', 'Adel', 'GA', '31620');	
Insert into SHIPMENT values ('H008', '2000000017', 3, 'Archie Doremski', '6580 Midway Rd.', 'Cody', 'WY', '82414');	
Insert into SHIPMENT values ('H009', '2000000019', 5, 'Gregory Abbott', '7837 Busse Rd.', 'Terre Haute', 'IN', '47813');	
Insert into SHIPMENT values ('H010', '2000000022', 2, 'Randall Neely', '1132 Madison St.', 'Rutland', 'VT', '05701');	
Insert into SHIPMENT values ('H011', '2000000024', 1, 'Ginger Xiao', '6636 Walnut St.', 'Rapid City', 'SD', '57703');	
Insert into SHIPMENT values ('H012', '2000000026', 5, 'Carl Dallas', '2530 Lakewood Blvd.', 'Sumter', 'SC', '29153');	
Insert into SHIPMENT values ('H013', '2000000029', 4, 'Bruce Fogarty', '1012 Island Ave.', 'Ellenboro', 'WV', '26346');	
Insert into SHIPMENT values ('H014', '2000000031', 5, 'Eugene Gasper', '7022 Ward Lake Rd.', 'Barre', 'VT', '05641');	
Insert into SHIPMENT values ('H015', '2000000032', 5, 'Gregory Abbott', '7837 Busse Rd.', 'Terre Haute', 'IN', '47813');	
Insert into SHIPMENT values ('H016', '2000000033', 4, 'Jeff Kowaiski', '3323 Mission Pkwy.', 'Wellsville', 'NY', '14895');	
Insert into SHIPMENT values ('H017', '2000000035', 2, 'Evelyn Cassens', '6094 Pearson Ave.', 'Newark', 'DE', '19726');	
Insert into SHIPMENT values ('H018', '2000000039', 2, 'Dennis Drazer', '4799 Silverstar Rd.', 'Seattle', 'WA', '98115');	
Insert into SHIPMENT values ('H019', '2000000041', 4, 'Randall Neely', '1132 Madison St.', 'Rutland', 'VT', '05701');	
Insert into SHIPMENT values ('H020', '2000000043', 2, 'Tommy McFerren', '3817 Farrell Rd.', 'Bend', 'OR', '97709');	
Insert into SHIPMENT values ('H021', '2000000044', 5, 'Jim Sokeland', '6671 Pearl Rd.', 'Reisterstown', 'MD', '21136');	
Insert into SHIPMENT values ('H022', '2000000047', 5, 'Richard Kluth', '7901 Peach Tree Dr.', 'Middletown', 'DE', '19709');	
Insert into SHIPMENT values ('H023', '2000000050', 4, 'George Purcell', '4281 Jefferson Rd.', 'Scranton', 'PA', '18522');	
Insert into SHIPMENT values ('H024', '2000000053', 1, 'Stephanie Yeinick', '2596 S. Fairview Rd.', 'Moberly', 'MO', '65270');	
Insert into SHIPMENT values ('H025', '2000000054', 5, 'Cecil Scheetz', '391 Weber Rd.', 'Waterville', 'ME', '04903');	
Insert into SHIPMENT values ('H026', '2000000055', 1, 'Wade Jacobs', '2610 E. Lake Rd.', 'Scranton', 'ND', '58653');	
Insert into SHIPMENT values ('H027', '2000000059', 5, 'David Tarter', '6274 Blue Rock Rd.', 'Syracuse', 'NY', '13261');	
Insert into SHIPMENT values ('H028', '2000000061', 4, 'Sharon Rouls', '1274 Weaver Rd.', 'Dothan', 'AL', '36303');	
Insert into SHIPMENT values ('H029', '2000000064', 5, 'Dennis Drazer', '4799 Silverstar Rd.', 'Seattle', 'WA', '98115');	
Insert into SHIPMENT values ('H030', '2000000067', 4, 'Paul Kaakeh', '3616 Jones Blvd.', 'Gunnison', 'CO', '81247');	
Insert into SHIPMENT values ('H031', '2000000070', 2, 'Tommy McFerren', '3817 Farrell Rd.', 'Bend', 'OR', '97709');	
Insert into SHIPMENT values ('H032', '2000000073', 3, 'Frank Aamodt', '3304 Leredo Ave.', 'New Milford', 'CT', '06776');	
Insert into SHIPMENT values ('H033', '2000000074', 4, 'Allen Robles', '1228 Bailey Rd.', 'Haxtun', 'CO', '80731');	
Insert into SHIPMENT values ('H034', '2000000077', 5, 'Karen Burns', '2850 Farm St.', 'Modesto', 'CA', '95354');	
Insert into SHIPMENT values ('H035', '2000000080', 1, 'Mary Deets', '4534 South Acres Rd.', 'Pearl City', 'HI', '96782');	
Insert into SHIPMENT values ('H036', '2000000083', 5, 'George Purcell', '4281 Jefferson Rd.', 'Scranton', 'PA', '18522');	
Insert into SHIPMENT values ('H037', '2000000086', 2, 'Randall Neely', '1132 Madison St.', 'Rutland', 'VT', '05701');	
Insert into SHIPMENT values ('H038', '2000000087', 1, 'Kathleen Plyman', '7626 Belmont Ave.', 'New York City', 'NY', '10131');	
Insert into SHIPMENT values ('H039', '2000000089', 3, 'Richard Strehle', '9862 Rock Island Rd.', 'Walla Walla', 'WA', '99362');	
Insert into SHIPMENT values ('H040', '2000000093', 1, 'Gregory Abbott', '7837 Busse Rd.', 'Terre Haute', 'IN', '47813');	
Insert into SHIPMENT values ('H041', '2000000096', 3, 'Brittany Cottingham', '4234 Taylor Rd.', 'Lima', 'OH', '45819');	
Insert into SHIPMENT values ('H042', '2000000098', 3, 'Paul Kaakeh', '3616 Jones Blvd.', 'Gunnison', 'CO', '81247');	
Insert into SHIPMENT values ('H043', '2000000101', 5, 'Kathleen Plyman', '7626 Belmont Ave.', 'New York City', 'NY', '10131');	
Insert into SHIPMENT values ('H044', '2000000105', 4, 'Larry Osmanova', '256 Royal Ln.', 'Salem', 'OR', '97311');	
Insert into SHIPMENT values ('H045', '2000000108', 4, 'Cecil Scheetz', '391 Weber Rd.', 'Waterville', 'ME', '04903');	
Insert into SHIPMENT values ('H046', '2000000110', 2, 'George Purcell', '4281 Jefferson Rd.', 'Scranton', 'PA', '18522');	
Insert into SHIPMENT values ('H047', '2000000113', 1, 'Jim Sokeland', '6671 Pearl Rd.', 'Reisterstown', 'MD', '21136');	
Insert into SHIPMENT values ('H048', '2000000118', 2, 'Susan Strong', '5883 Sudbury Rd.', 'Adel', 'GA', '31620');	
Insert into SHIPMENT values ('H049', '2000000121', 3, 'Daniel Ezra', '7292 Lake June Rd.', 'Auburn', 'ME', '04212');	
Insert into SHIPMENT values ('H050', '2000000124', 5, 'Robert Lister', '3016 Dunlap Ave.', 'Provo', 'UT', '84603');	
Insert into SHIPMENT values ('H051', '2000000127', 4, 'Allen Robles', '1228 Bailey Rd.', 'Haxtun', 'CO', '80731');	
Insert into SHIPMENT values ('H052', '2000000130', 2, 'George Purcell', '4281 Jefferson Rd.', 'Scranton', 'PA', '18522');	
Insert into SHIPMENT values ('H053', '2000000133', 5, 'Richard Strehle', '9862 Rock Island Rd.', 'Walla Walla', 'WA', '99362');	
Insert into SHIPMENT values ('H054', '2000000135', 4, 'Bruce Fogarty', '1012 Island Ave.', 'Ellenboro', 'WV', '26346');	
Insert into SHIPMENT values ('H055', '2000000138', 2, 'Sharon Rouls', '1274 Weaver Rd.', 'Dothan', 'AL', '36303');	
Insert into SHIPMENT values ('H056', '2000000140', 2, 'Robert Lister', '3016 Dunlap Ave.', 'Provo', 'UT', '84603');	
Insert into SHIPMENT values ('H057', '2000000142', 5, 'Eugene Gasper', '7022 Ward Lake Rd.', 'Barre', 'VT', '05641');	
Insert into SHIPMENT values ('H058', '2000000143', 1, 'Kevin Zubarev', '5933 Valley St.', 'Blackfoot', 'ID', '83221');	
Insert into SHIPMENT values ('H059', '2000000147', 5, 'Brittany Cottingham', '4234 Taylor Rd.', 'Lima', 'OH', '45819');	
Insert into SHIPMENT values ('H060', '2000000150', 4, 'Frank Aamodt', '3304 Leredo Ave.', 'New Milford', 'CT', '06776');	
Insert into SHIPMENT values ('H061', '2000000153', 2, 'Charlene Franks', '1627 Thomas Rd.', 'Douglas', 'WY', '82633');	
Insert into SHIPMENT values ('H062', '2000000156', 1, 'Evelyn Cassens', '6094 Pearson Ave.', 'Newark', 'DE', '19726');	
Insert into SHIPMENT values ('H063', '2000000157', 5, 'Angie Hoover', '6427 Genesee St.', 'Casper', 'WY', '82638');	
Insert into SHIPMENT values ('H064', '2000000160', 5, 'Richard Strehle', '9862 Rock Island Rd.', 'Walla Walla', 'WA', '99362');	
Insert into SHIPMENT values ('H065', '2000000163', 4, 'Jim Sokeland', '6671 Pearl Rd.', 'Reisterstown', 'MD', '21136');	
Insert into SHIPMENT values ('H066', '2000000164', 4, 'Eugene Gasper', '7022 Ward Lake Rd.', 'Barre', 'VT', '05641');	
Insert into SHIPMENT values ('H067', '2000000168', 5, 'Paul Kaakeh', '3616 Jones Blvd.', 'Gunnison', 'CO', '81247');	
Insert into SHIPMENT values ('H068', '2000000171', 2, 'Angie Hoover', '6427 Genesee St.', 'Casper', 'WY', '82638');	
Insert into SHIPMENT values ('H069', '2000000172', 5, 'Hugo Gillespie', '4194 Northfield Rd.', 'Salina', 'KS', '67402');	
Insert into SHIPMENT values ('H070', '2000000174', 2, 'Wade Jacobs', '2610 E. Lake Rd.', 'Scranton', 'ND', '58653');	
Insert into SHIPMENT values ('H071', '2000000177', 3, 'Eugene Gasper', '7022 Ward Lake Rd.', 'Barre', 'VT', '05641');	
Insert into SHIPMENT values ('H072', '2000000182', 2, 'Brittany Cottingham', '4234 Taylor Rd.', 'Lima', 'OH', '45819');	
Insert into SHIPMENT values ('H073', '2000000184', 1, 'Brittany Cottingham', '4234 Taylor Rd.', 'Lima', 'OH', '45819');	
Insert into SHIPMENT values ('H074', '2000000185', 5, 'Charlene Franks', '1627 Thomas Rd.', 'Douglas', 'WY', '82633');	
Insert into SHIPMENT values ('H075', '2000000189', 2, 'Robert Lister', '3016 Dunlap Ave.', 'Provo', 'UT', '84603');	
Insert into SHIPMENT values ('H076', '2000000194', 2, 'Kevin Zubarev', '5933 Valley St.', 'Blackfoot', 'ID', '83221');	
Insert into SHIPMENT values ('H077', '2000000195', 4, 'David Tarter', '6274 Blue Rock Rd.', 'Syracuse', 'NY', '13261');	
Insert into SHIPMENT values ('H078', '2000000198', 1, 'Jim Sokeland', '6671 Pearl Rd.', 'Reisterstown', 'MD', '21136');	
Insert into SHIPMENT values ('H079', '2000000203', 2, 'Heather Wallpe', '4128 Hulen St.', 'Park Hills', 'MO', '63653');	
commit;

drop table Shipment cascade constraints;
alter table Shipment add constraint Shipment_PK 
	primary key (ShipmentID);
Select DISTINCT(ShipmentID),OrderID, ShipperID,ShipName,ShipAddress,ShipCity,ShipState,ShipPostalCode from Shipment;

update  Shipment SET  ShipAddress ="H48 Weber Rd " Where ShipmentID	
Delete FROM Shipment where ShipmentID IN (Reard);
Select DISTINCT(ShipName),OrderID, ShipperID,ShipAddress,ShipCity,ShipState,ShipPostalCode from Shipment;
Where ShipAddress= ”H48 Weber Rd”;

--References
--Retrieved from https://www.w3schools.com/sql/.
--SQL Tutorial. (n.d.). Retrieved from https://www.tutorialspoint.com/sql/index.htm.
--SQL Tutorial. (n.d.). Retrieved from https://www.geeksforgeeks.org/sql-tutorial/.

