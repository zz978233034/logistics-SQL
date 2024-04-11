

-- Name: vehicle; Type: Table; Schema: public;

SET search_path = public;
CREATE TABLE vehicle (
	vid character varying(50) NOT NULL,
	vmax_load double precision NOT NULL,
	vtype character varying(50)
)
WITH (orientation=row, compression=no);
ALTER TABLE vehicle ADD CONSTRAINT vehicle_pkey PRIMARY KEY (vid);
