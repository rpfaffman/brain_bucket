--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_info; Type: TABLE; Schema: public; Owner: rgmp; Tablespace: 
--

CREATE TABLE schema_info (
    version integer DEFAULT 0 NOT NULL
);


ALTER TABLE schema_info OWNER TO rgmp;

--
-- Name: thoughts; Type: TABLE; Schema: public; Owner: rgmp; Tablespace: 
--

CREATE TABLE thoughts (
    id integer NOT NULL,
    created_at timestamp without time zone,
    title text,
    content text
);


ALTER TABLE thoughts OWNER TO rgmp;

--
-- Name: thoughts_id_seq; Type: SEQUENCE; Schema: public; Owner: rgmp
--

CREATE SEQUENCE thoughts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE thoughts_id_seq OWNER TO rgmp;

--
-- Name: thoughts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rgmp
--

ALTER SEQUENCE thoughts_id_seq OWNED BY thoughts.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rgmp
--

ALTER TABLE ONLY thoughts ALTER COLUMN id SET DEFAULT nextval('thoughts_id_seq'::regclass);


--
-- Name: thoughts_pkey; Type: CONSTRAINT; Schema: public; Owner: rgmp; Tablespace: 
--

ALTER TABLE ONLY thoughts
    ADD CONSTRAINT thoughts_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: rgmp
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM rgmp;
GRANT ALL ON SCHEMA public TO rgmp;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

