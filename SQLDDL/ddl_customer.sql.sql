

-- Name: customer; Type: Table; Schema: public;

SET search_path = public;
CREATE TABLE customer (
	cid character varying(128) NOT NULL,
	caccount1 character varying(255),
	cname character varying(30),
	cage integer,
	"Cregister" character varying(20),
	cpassword character varying(30),
	cphone character varying(20),
	caddress character varying(255),
	csex character varying(10),
	caccount2 character varying NOT NULL
)
WITH (orientation=row, compression=no);
ALTER TABLE customer ADD CONSTRAINT consumer_pkey PRIMARY KEY (cid);
