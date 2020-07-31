
# query 1:
use hotelguild;
SELECT g.FirstName,g.LastName,rr.RoomId as RoomNumber, 
res.EndDate as ReservationDate
FROM reservation res, guestreservation gr,
guest g,roomreservation rr
where res.Id=gr.reservationId 
AND gr.GuestId=g.Id
AND rr.reservationId=res.Id 
AND res.EndDate between '2023-7-1' and '2023-7-31'

/*
# FirstName, LastName, RoomNumber, ReservationDate
'Qing', 'Qiu', '205', '2023-07-02'
'Bettyann', 'Seery', '303', '2023-07-29'
'Walter', 'Holaway', '204', '2023-07-14'
'Wilfred', 'Vise', '401', '2023-07-21'
*/

;
# query 2:
use hotelguild;
SELECT g.FirstName,g.LastName,rr.RoomId as RoomNumber, 
res.StartDate as ReservationDate
FROM reservation res, guestreservation gr,
guest g,roomreservation rr, room r,
roomamenity ra, amenity a
where res.Id=gr.reservationId 
AND gr.GuestId=g.Id
AND rr.reservationId=res.Id 
AND rr.roomid=r.id
AND r.id=ra.roomid
AND ra.AmenityId=a.id
AND a.AmenityType ='jacuzzi'

/*
# FirstName, LastName, RoomNumber, ReservationDate
'Karie', 'Yang', '201', '2023-03-06'
'Bettyann', 'Seery', '203', '2023-02-05'
'Karie', 'Yang', '203', '2023-09-13'
'Qing', 'Qiu', '205', '2023-06-28'
'Wilfred', 'Vise', '207', '2023-04-23'
'Walter', 'Holaway', '301', '2023-04-09'
'Mack', 'Simmer', '301', '2023-11-22'
'Bettyann', 'Seery', '303', '2023-07-28'
'Duane', 'Cullison', '305', '2023-02-22'
'Bettyann', 'Seery', '305', '2023-08-30'
'Qing', 'Qiu', '307', '2023-03-17'

*/
;
# query 3:
use hotelguild;

SELECT g.FirstName,g.LastName,rr.RoomId as RoomNumber, 
res.StartDate as ReservationDate, res.Adults,res.Children
FROM reservation res, guestreservation gr,
guest g,roomreservation rr
where res.Id=gr.reservationId 
AND gr.GuestId=g.Id
AND rr.reservationId=res.Id 
AND g.firstName='Mack' 
AND g.lastname='Simmer'

/*
# FirstName, LastName, RoomNumber, ReservationDate, Adults, Children
'Mack', 'Simmer', '308', '2023-02-02', '1', '0'
'Mack', 'Simmer', '208', '2023-09-16', '2', '0'
'Mack', 'Simmer', '206', '2023-11-22', '2', '0'
'Mack', 'Simmer', '301', '2023-11-22', '2', '2'
*/
;
# query 4:

use hotelguild;

SELECT r.id as RoomNumber,res.id as ReservationID, res.Cost
FROM room r left join roomreservation rr on rr.RoomId=r.id
left join  reservation res on res.Id=rr.reservationId

;

/*
# RoomNumber, ReservationID, Cost
'203', '2', '999.95'
'203', '21', '399.98'
'204', '16', '184.99'
'301', '9', '799.96'
'301', '24', '599.97'
'302', '6', '924.95'
'302', '25', '699.96'
'303', '18', '199.99'
'304', '8', '874.95'
'304', '14', '184.99'
'205', '15', '699.96'
'206', '12', '599.96'
'206', '23', '449.97'
'207', '10', '174.99'
'208', '13', '599.96'
'208', '20', '149.99'
'305', '3', '349.98'
'305', '19', '349.98'
'306', NULL, NULL
'307', '5', '524.97'
'308', '1', '299.98'
'401', '11', '1199.97'
'401', '17', '1259.97'
'401', '22', '1199.97'
'402', NULL, NULL

*/

;
# query 5:
use hotelguild;

SELECT r.id as RoomNumber,rt.MaxOccupancy
FROM reservation res inner join roomreservation rr on rr.reservationId=res.Id 
inner join room r on rr.RoomId=r.id
inner join roomtype rt on r.roomTypeid= rt.id
where rt.MaxOccupancy>=3 
AND res.startdate between '2023-4-1' and '2023-4-30'


/*
# RoomNumber, MaxOccupancy
'301', '4'

*/

;
# query 6:
use hotelguild;
SELECT g.FirstName,g.LastName,count(res.id) as reservationQty
FROM reservation res, guestreservation gr,
guest g
where res.Id=gr.reservationId 
AND gr.GuestId=g.Id
group by g.id
order by count(res.id) desc, g.lastname

/*
# FirstName, LastName, reservationQty
'Mack', 'Simmer', '4'
'Bettyann', 'Seery', '3'
'Duane', 'Cullison', '2'
'Walter', 'Holaway', '2'
'Aurore', 'Lipton', '2'
'Qing', 'Qiu', '2'
'Maritza', 'Tilton', '2'
'Joleen', 'Tison', '2'
'Wilfred', 'Vise', '2'
'Karie', 'Yang', '2'
'Zachery', 'Luechtefeld', '1'
*/
;
# query 7:
use hotelguild;
SELECT FirstName,LastName,Address,Phone
FROM guest
where phone like '%(231) 893-2756%'

/*
# FirstName, LastName, Address, Phone
'Qing', 'Qiu', '1800 Rene-Levesque', '(231) 893-2756'
*/
