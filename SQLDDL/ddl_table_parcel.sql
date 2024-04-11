

-- Name: parcel; Type: Table; Schema: public;

SET search_path = public;
CREATE TABLE parcel (
	pid character(10) NOT NULL,
	pname character(10),
	pweight smallint,
	psize character varying(20)
)
WITH (orientation=row, compression=no);
ALTER TABLE parcel ADD CONSTRAINT parcel_pkey PRIMARY KEY (pid);
