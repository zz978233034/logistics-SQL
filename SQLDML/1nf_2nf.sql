CREATE TABLE deliverylist
(
  did character(50) NOT NULL,
	oid character(30),
	pid character(10),
	dunit_price smallint,
	dstart_add character varying(255),
	dend_add character varying(255)
);

CREATE TABLE vehicle
(
  vid character varying(50) NOT NULL,
	vmax_load double precisiON NOT NULL,
	vtype character varying(50)
);


CREATE TABLE delivery_vehicle
(
  did character(50)NOT NULL,
	vid character varying(50) NOT NULL,
	status character varying(20)
)

CREATE TABLE delivery_vehicle_status_1nf
(
did character(50) NOT NULL,
oid character(30),
pid character(10),
dunit_price smallint,
dstart_add character varying(255),
dend_add character varying(255),
vid character varying(50) NOT NULL,
vmax_load double precisiON NOT NULL,
vtype character varying(50),
status character varying(20)
)


INSERT INTO delivery_vehicle_status_1nf(did,oid,pid,dunit_price,dstart_add,dend_add,vid,vmax_load,vtype,status)
SELECT deliverylist.did,deliverylist.oid,deliverylist.pid,deliverylist.dunit_price,deliverylist.dstart_add,
deliverylist.dend_add,vehicle.vid,
vehicle.vmax_load,vehicle.vtype,delivery_vehicle.status
FROM vehicle,delivery_vehicle,deliverylist
where vehicle.vid=delivery_vehicle.vid
AND deliverylist.did=delivery_vehicle.did


SELECT *
FROM delivery_vehicle_status_1nf
WHERE vtype='大型无人车'
 and dstart_add LIKE '安徽%'

select *
FROM deliverylist,vehicle,delivery_vehicle
WHERE deliverylist.did=delivery_vehicle.did
AND delivery_vehicle.vid=vehicle.vid
 AND vehicle.vtype='大型无人车'
 AND deliverylist.dstart_add like '安徽%'


DROP INDEX idx_deliverylist_did
DROP INDEX idx_delivery_vehicle_status_did_vid;
DROP INDEX idx_vehicle_vid


CREATE INDEX idx_deliverylist_did ON deliverylist (did);
CREATE INDEX idx_delivery_vehicle_status_did_vid ON delivery_vehicle (did, vid);
CREATE INDEX idx_vehicle_vid ON vehicle (vid);

select *
FROM deliverylist,vehicle,delivery_vehicle
WHERE deliverylist.did=delivery_vehicle.did
AND delivery_vehicle.vid=vehicle.vid
 AND vehicle.vtype='大型无人车'
 AND deliverylist.dstart_add like '安徽%'