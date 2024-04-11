

-- Name: delivery_price_table; Type: Table; Schema: public;

SET search_path = public;
CREATE TABLE delivery_price_table (
	did character(50),
	oid character(50),
	cid character(50),
	onum smallint,
	duint_price double precision
)
WITH (orientation=row, compression=no);
