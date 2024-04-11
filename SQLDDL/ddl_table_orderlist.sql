

-- Name: orderlist; Type: Table; Schema: public;

SET search_path = public;
CREATE TABLE orderlist (
	oid character(30) NOT NULL,
	cid character(30),
	ostart_add character varying(255),
	oend_add character varying(255),
	onum smallint,
	osum integer,
	otime character varying(50),
	pnamelist character varying(255)
)
WITH (orientation=row, compression=no);
ALTER TABLE orderlist ADD CONSTRAINT orderlist_pkey PRIMARY KEY (oid);
