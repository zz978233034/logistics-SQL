

-- Name: deliverylist; Type: Table; Schema: public;

SET search_path = public;
CREATE TABLE deliverylist (
	did character(50) NOT NULL,
	oid character(30),
	pid character(10),
	dunit_price smallint,
	dstart_add character varying(255),
	dend_add character varying(255)
)
WITH (orientation=row, compression=no);
ALTER TABLE deliverylist ADD CONSTRAINT deliverylist_pkey PRIMARY KEY (did);
