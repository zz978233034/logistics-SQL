

-- Name: delivery_vehicle; Type: Table; Schema: public;

SET search_path = public;
CREATE TABLE delivery_vehicle (
	did character(50),
	vid character varying(50),
	status character varying(20)
)
WITH (orientation=row, compression=no);
