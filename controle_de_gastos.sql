--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-07-16 18:35:42 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 25300)
-- Name: Cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Cliente" (
    cd_cliente integer NOT NULL,
    endereco_cd_endereco integer,
    nm_razaosocial character varying(60),
    nm_nomefantasia character varying(30),
    ds_email character varying(100),
    cod_identificacao integer
);


ALTER TABLE "Cliente" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25303)
-- Name: Endereco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Endereco" (
    cd_endereco integer NOT NULL,
    nm_rua character varying(30),
    nr_casa integer,
    ds_complemento character varying(30),
    nm_bairro character varying(20),
    nm_cidade character varying(30),
    ds_cep character varying(8),
    telefone1 numeric(13,0),
    telefone2 numeric(13,0)
);


ALTER TABLE "Endereco" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 25306)
-- Name: Funcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Funcao" (
    cd_funcao integer NOT NULL,
    ds_funcao character varying,
    tp_visivel character varying(1)
);


ALTER TABLE "Funcao" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 25312)
-- Name: Funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Funcionario" (
    cd_funcionario integer NOT NULL,
    funcao_cd_funcao integer,
    endereco_cd_endereco integer,
    nm_funcionario character varying(30),
    ds_senha character varying(8),
    nick character varying(10),
    tp_visivel character varying(1)
);


ALTER TABLE "Funcionario" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 25315)
-- Name: Ordem_Servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Ordem_Servico" (
    cd_ordem_servico integer NOT NULL,
    funcionario_cd_funcionario integer,
    cliente_cd_cliente integer,
    dt_ordem_servico date,
    vl_total numeric(1000,2),
    bool_fechado boolean
);


ALTER TABLE "Ordem_Servico" OWNER TO postgres;

--
-- TOC entry 2168 (class 0 OID 25300)
-- Dependencies: 181
-- Data for Name: Cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Cliente" (cd_cliente, endereco_cd_endereco, nm_razaosocial, nm_nomefantasia, ds_email, cod_identificacao) FROM stdin;
\.


--
-- TOC entry 2169 (class 0 OID 25303)
-- Dependencies: 182
-- Data for Name: Endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Endereco" (cd_endereco, nm_rua, nr_casa, ds_complemento, nm_bairro, nm_cidade, ds_cep, telefone1, telefone2) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 25306)
-- Dependencies: 183
-- Data for Name: Funcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Funcao" (cd_funcao, ds_funcao, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2171 (class 0 OID 25312)
-- Dependencies: 184
-- Data for Name: Funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Funcionario" (cd_funcionario, funcao_cd_funcao, endereco_cd_endereco, nm_funcionario, ds_senha, nick, tp_visivel) FROM stdin;
\.


--
-- TOC entry 2172 (class 0 OID 25315)
-- Dependencies: 185
-- Data for Name: Ordem_Servico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Ordem_Servico" (cd_ordem_servico, funcionario_cd_funcionario, cliente_cd_cliente, dt_ordem_servico, vl_total, bool_fechado) FROM stdin;
\.


--
-- TOC entry 2036 (class 2606 OID 25319)
-- Name: pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Cliente"
    ADD CONSTRAINT pk_cliente PRIMARY KEY (cd_cliente);


--
-- TOC entry 2038 (class 2606 OID 25327)
-- Name: pk_endereco; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Endereco"
    ADD CONSTRAINT pk_endereco PRIMARY KEY (cd_endereco);


--
-- TOC entry 2040 (class 2606 OID 25329)
-- Name: pk_funcao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Funcao"
    ADD CONSTRAINT pk_funcao PRIMARY KEY (cd_funcao);


--
-- TOC entry 2044 (class 2606 OID 25331)
-- Name: pk_funcionario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Funcionario"
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (cd_funcionario);


--
-- TOC entry 2048 (class 2606 OID 25333)
-- Name: pk_ordem_servico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Ordem_Servico"
    ADD CONSTRAINT pk_ordem_servico PRIMARY KEY (cd_ordem_servico);


--
-- TOC entry 2045 (class 1259 OID 25357)
-- Name: fki_cliente_cd_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cliente_cd_cliente ON "Ordem_Servico" USING btree (cliente_cd_cliente);


--
-- TOC entry 2041 (class 1259 OID 25345)
-- Name: fki_endereco_cd_endereco; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco_cd_endereco ON "Funcionario" USING btree (endereco_cd_endereco);


--
-- TOC entry 2034 (class 1259 OID 25325)
-- Name: fki_endereco_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_endereco_cliente ON "Cliente" USING btree (endereco_cd_endereco);


--
-- TOC entry 2042 (class 1259 OID 25339)
-- Name: fki_funcao_cd_funcao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcao_cd_funcao ON "Funcionario" USING btree (funcao_cd_funcao);


--
-- TOC entry 2046 (class 1259 OID 25351)
-- Name: fki_funcionario_cd_funcionario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_funcionario_cd_funcionario ON "Ordem_Servico" USING btree (funcionario_cd_funcionario);


--
-- TOC entry 2053 (class 2606 OID 25352)
-- Name: fk_cliente_cd_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Ordem_Servico"
    ADD CONSTRAINT fk_cliente_cd_cliente FOREIGN KEY (cliente_cd_cliente) REFERENCES "Cliente"(cd_cliente);


--
-- TOC entry 2051 (class 2606 OID 25340)
-- Name: fk_endereco_cd_endereco; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Funcionario"
    ADD CONSTRAINT fk_endereco_cd_endereco FOREIGN KEY (endereco_cd_endereco) REFERENCES "Cliente"(cd_cliente);


--
-- TOC entry 2049 (class 2606 OID 25320)
-- Name: fk_endereco_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Cliente"
    ADD CONSTRAINT fk_endereco_cliente FOREIGN KEY (endereco_cd_endereco) REFERENCES "Cliente"(cd_cliente);


--
-- TOC entry 2050 (class 2606 OID 25334)
-- Name: fk_funcao_cd_funcao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Funcionario"
    ADD CONSTRAINT fk_funcao_cd_funcao FOREIGN KEY (funcao_cd_funcao) REFERENCES "Cliente"(cd_cliente);


--
-- TOC entry 2052 (class 2606 OID 25346)
-- Name: fk_funcionario_cd_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Ordem_Servico"
    ADD CONSTRAINT fk_funcionario_cd_funcionario FOREIGN KEY (funcionario_cd_funcionario) REFERENCES "Cliente"(cd_cliente);


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-07-16 18:35:42 BRT

--
-- PostgreSQL database dump complete
--

