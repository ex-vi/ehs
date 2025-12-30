--
-- PostgreSQL database dump
--

\restrict qqzMX0lLdEw3dQ6dYBvR0PKKuHMvRniQxJkrvmeNoUYqKS4KGunnZUcU64JYVQb

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1 (Debian 18.1-1.pgdg12+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addons; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.addons (
    id integer NOT NULL,
    document_id character varying(255),
    slug character varying(255),
    name character varying(255),
    price numeric(10,2),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    worker_time numeric(10,2),
    client_time numeric(10,2)
);


ALTER TABLE public.addons OWNER TO esg_strapi;

--
-- Name: addons_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.addons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addons_id_seq OWNER TO esg_strapi;

--
-- Name: addons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.addons_id_seq OWNED BY public.addons.id;


--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_permissions OWNER TO esg_strapi;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO esg_strapi;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.admin_permissions_role_lnk OWNER TO esg_strapi;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_roles OWNER TO esg_strapi;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO esg_strapi;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_users OWNER TO esg_strapi;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO esg_strapi;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


ALTER TABLE public.admin_users_roles_lnk OWNER TO esg_strapi;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: advantages; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.advantages (
    id integer NOT NULL,
    document_id character varying(255),
    icon_slug character varying(255),
    title character varying(255),
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.advantages OWNER TO esg_strapi;

--
-- Name: advantages_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.advantages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.advantages_id_seq OWNER TO esg_strapi;

--
-- Name: advantages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.advantages_id_seq OWNED BY public.advantages.id;


--
-- Name: coefficients; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.coefficients (
    id integer NOT NULL,
    document_id character varying(255),
    slug character varying(255),
    coefficient numeric(10,2),
    applies_to character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.coefficients OWNER TO esg_strapi;

--
-- Name: coefficients_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.coefficients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coefficients_id_seq OWNER TO esg_strapi;

--
-- Name: coefficients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.coefficients_id_seq OWNED BY public.coefficients.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    link character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    slug character varying(255)
);


ALTER TABLE public.contacts OWNER TO esg_strapi;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO esg_strapi;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: cookie_policies; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.cookie_policies (
    id integer NOT NULL,
    document_id character varying(255),
    effective_date character varying(255),
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.cookie_policies OWNER TO esg_strapi;

--
-- Name: cookie_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.cookie_policies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cookie_policies_id_seq OWNER TO esg_strapi;

--
-- Name: cookie_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.cookie_policies_id_seq OWNED BY public.cookie_policies.id;


--
-- Name: feature_options; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.feature_options (
    id integer NOT NULL,
    document_id character varying(255),
    text character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.feature_options OWNER TO esg_strapi;

--
-- Name: feature_options_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.feature_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feature_options_id_seq OWNER TO esg_strapi;

--
-- Name: feature_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.feature_options_id_seq OWNED BY public.feature_options.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.features (
    id integer NOT NULL,
    document_id character varying(255),
    slug character varying(255),
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.features OWNER TO esg_strapi;

--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.features_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.features_id_seq OWNER TO esg_strapi;

--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- Name: features_options_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.features_options_lnk (
    id integer NOT NULL,
    feature_id integer,
    feature_option_id integer,
    feature_option_ord double precision
);


ALTER TABLE public.features_options_lnk OWNER TO esg_strapi;

--
-- Name: features_options_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.features_options_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.features_options_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: features_options_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.features_options_lnk_id_seq OWNED BY public.features_options_lnk.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.files OWNER TO esg_strapi;

--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


ALTER TABLE public.files_folder_lnk OWNER TO esg_strapi;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO esg_strapi;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_mph OWNER TO esg_strapi;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_mph_id_seq OWNER TO esg_strapi;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: home_pages; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.home_pages (
    id integer NOT NULL,
    document_id character varying(255),
    price_from integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.home_pages OWNER TO esg_strapi;

--
-- Name: home_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.home_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.home_pages_id_seq OWNER TO esg_strapi;

--
-- Name: home_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.home_pages_id_seq OWNED BY public.home_pages.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.i18n_locale OWNER TO esg_strapi;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO esg_strapi;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: login_pages; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.login_pages (
    id integer NOT NULL,
    document_id character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.login_pages OWNER TO esg_strapi;

--
-- Name: login_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.login_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_pages_id_seq OWNER TO esg_strapi;

--
-- Name: login_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.login_pages_id_seq OWNED BY public.login_pages.id;


--
-- Name: privacy_policies; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.privacy_policies (
    id integer NOT NULL,
    document_id character varying(255),
    effective_date character varying(255),
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.privacy_policies OWNER TO esg_strapi;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.privacy_policies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.privacy_policies_id_seq OWNER TO esg_strapi;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.privacy_policies_id_seq OWNED BY public.privacy_policies.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    document_id character varying(255),
    question character varying(255),
    answer text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.questions OWNER TO esg_strapi;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_id_seq OWNER TO esg_strapi;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    document_id character varying(255),
    author character varying(255),
    review text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.reviews OWNER TO esg_strapi;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO esg_strapi;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.services (
    id integer NOT NULL,
    document_id character varying(255),
    slug character varying(255),
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    service_price numeric(10,2),
    sqft_price numeric(10,2),
    worker_time numeric(10,2),
    client_time numeric(10,2),
    extra_bedroom_price numeric(10,2),
    extra_bathroom_price numeric(10,2),
    extra_kitchen_price numeric(10,2),
    extra_bedroom_worker_time numeric(10,2),
    extra_bedroom_client_time numeric(10,2),
    extra_bathroom_worker_time numeric(10,2),
    extra_bathroom_client_time numeric(10,2),
    extra_kitchen_worker_time numeric(10,2),
    extra_kitchen_client_time numeric(10,2)
);


ALTER TABLE public.services OWNER TO esg_strapi;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO esg_strapi;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: strapi_ai_localization_jobs; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_ai_localization_jobs (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255) NOT NULL,
    source_locale character varying(255) NOT NULL,
    target_locales jsonb NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.strapi_ai_localization_jobs OWNER TO esg_strapi;

--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_ai_localization_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_ai_localization_jobs_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_ai_localization_jobs_id_seq OWNED BY public.strapi_ai_localization_jobs.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO esg_strapi;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_lnk OWNER TO esg_strapi;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    encrypted_key text,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_tokens OWNER TO esg_strapi;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO esg_strapi;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO esg_strapi;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


ALTER TABLE public.strapi_history_versions OWNER TO esg_strapi;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_history_versions_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO esg_strapi;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations_internal OWNER TO esg_strapi;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO esg_strapi;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


ALTER TABLE public.strapi_release_actions_release_lnk OWNER TO esg_strapi;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_releases OWNER TO esg_strapi;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_sessions; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_sessions (
    id integer NOT NULL,
    document_id character varying(255),
    user_id character varying(255),
    session_id character varying(255),
    child_id character varying(255),
    device_id character varying(255),
    origin character varying(255),
    expires_at timestamp(6) without time zone,
    absolute_expires_at timestamp(6) without time zone,
    status character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_sessions OWNER TO esg_strapi;

--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_sessions_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_sessions_id_seq OWNED BY public.strapi_sessions.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO esg_strapi;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk OWNER TO esg_strapi;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO esg_strapi;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO esg_strapi;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows OWNER TO esg_strapi;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk OWNER TO esg_strapi;

--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows_stages OWNER TO esg_strapi;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_permissions_lnk OWNER TO esg_strapi;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_workflow_lnk OWNER TO esg_strapi;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: taxes; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.taxes (
    id integer NOT NULL,
    document_id character varying(255),
    vat numeric(10,2),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.taxes OWNER TO esg_strapi;

--
-- Name: taxes_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.taxes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taxes_id_seq OWNER TO esg_strapi;

--
-- Name: taxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.taxes_id_seq OWNED BY public.taxes.id;


--
-- Name: terms_of_services; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.terms_of_services (
    id integer NOT NULL,
    document_id character varying(255),
    effective_date character varying(255),
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.terms_of_services OWNER TO esg_strapi;

--
-- Name: terms_of_services_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.terms_of_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.terms_of_services_id_seq OWNER TO esg_strapi;

--
-- Name: terms_of_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.terms_of_services_id_seq OWNED BY public.terms_of_services.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_permissions OWNER TO esg_strapi;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO esg_strapi;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.up_permissions_role_lnk OWNER TO esg_strapi;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_roles OWNER TO esg_strapi;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO esg_strapi;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_users OWNER TO esg_strapi;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO esg_strapi;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


ALTER TABLE public.up_users_role_lnk OWNER TO esg_strapi;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.upload_folders OWNER TO esg_strapi;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO esg_strapi;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: esg_strapi
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


ALTER TABLE public.upload_folders_parent_lnk OWNER TO esg_strapi;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: esg_strapi
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNER TO esg_strapi;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: esg_strapi
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: addons id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.addons ALTER COLUMN id SET DEFAULT nextval('public.addons_id_seq'::regclass);


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: advantages id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.advantages ALTER COLUMN id SET DEFAULT nextval('public.advantages_id_seq'::regclass);


--
-- Name: coefficients id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.coefficients ALTER COLUMN id SET DEFAULT nextval('public.coefficients_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: cookie_policies id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.cookie_policies ALTER COLUMN id SET DEFAULT nextval('public.cookie_policies_id_seq'::regclass);


--
-- Name: feature_options id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.feature_options ALTER COLUMN id SET DEFAULT nextval('public.feature_options_id_seq'::regclass);


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- Name: features_options_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features_options_lnk ALTER COLUMN id SET DEFAULT nextval('public.features_options_lnk_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: home_pages id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.home_pages ALTER COLUMN id SET DEFAULT nextval('public.home_pages_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: login_pages id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.login_pages ALTER COLUMN id SET DEFAULT nextval('public.login_pages_id_seq'::regclass);


--
-- Name: privacy_policies id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.privacy_policies ALTER COLUMN id SET DEFAULT nextval('public.privacy_policies_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: strapi_ai_localization_jobs id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_localization_jobs_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_sessions id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_sessions ALTER COLUMN id SET DEFAULT nextval('public.strapi_sessions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: taxes id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.taxes ALTER COLUMN id SET DEFAULT nextval('public.taxes_id_seq'::regclass);


--
-- Name: terms_of_services id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.terms_of_services ALTER COLUMN id SET DEFAULT nextval('public.terms_of_services_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Data for Name: addons; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.addons (id, document_id, slug, name, price, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, worker_time, client_time) FROM stdin;
59	oy79lapcw29jm5vpjz9qv0ya	microwave	Microwave cleaning	20.00	2025-10-13 20:34:02.866	2025-10-23 09:34:30.77	2025-10-23 09:34:30.796	1	3	en	15.00	20.00
3	tn0zvv1p4b4ebgjsd5xjibmp	range-hood	Range hood cleaning	50.00	2025-10-13 20:33:12.286	2025-10-23 09:36:29.273	\N	1	3	en	45.00	50.00
62	tn0zvv1p4b4ebgjsd5xjibmp	range-hood	Range hood cleaning	50.00	2025-10-13 20:33:12.286	2025-10-23 09:36:29.273	2025-10-23 09:36:29.295	1	3	en	45.00	50.00
21	vuzzn8hlbom3hism2j1t5f7c	extra-hours	Extra hours	65.00	2025-10-13 20:35:13.453	2025-10-23 09:28:08.871	\N	1	3	en	60.00	60.00
51	vuzzn8hlbom3hism2j1t5f7c	extra-hours	Extra hours	65.00	2025-10-13 20:35:13.453	2025-10-23 09:28:08.871	2025-10-23 09:28:08.901	1	3	en	60.00	60.00
25	qdr0lv1out39cmxfvdxz7rxy	dishwasher-machine	Dishwasher machine cleaning	35.00	2025-10-13 20:35:44.627	2025-10-23 09:29:44.676	\N	1	3	en	30.00	40.00
54	qdr0lv1out39cmxfvdxz7rxy	dishwasher-machine	Dishwasher machine cleaning	35.00	2025-10-13 20:35:44.627	2025-10-23 09:29:44.676	2025-10-23 09:29:44.704	1	3	en	30.00	40.00
17	i25meeuvczuxr03by0ag0wm9	ironing	Ironing	35.00	2025-10-13 20:34:43.255	2025-10-23 09:31:06.119	\N	1	3	en	30.00	40.00
56	i25meeuvczuxr03by0ag0wm9	ironing	Ironing	35.00	2025-10-13 20:34:43.255	2025-10-23 09:31:06.119	2025-10-23 09:31:06.205	1	3	en	30.00	40.00
11	oy79lapcw29jm5vpjz9qv0ya	microwave	Microwave cleaning	20.00	2025-10-13 20:34:02.866	2025-10-23 09:34:30.77	\N	1	3	en	15.00	20.00
29	hg8z8k1shuh93hv6axg8bi0c	vacuum-cleaner	Add a vacuum cleaner to your booking	10.00	2025-10-13 20:36:08.498	2025-12-03 14:39:57.379	\N	1	3	en	10.00	10.00
80	hg8z8k1shuh93hv6axg8bi0c	vacuum-cleaner	Add a vacuum cleaner to your booking	10.00	2025-10-13 20:36:08.498	2025-12-03 14:39:57.379	2025-12-03 14:39:57.41	1	3	en	10.00	10.00
65	bf6va63ygcuahrno71ize8nj	laundry	Start the laundry	10.00	2025-11-04 11:48:20.149	2025-11-10 10:41:06.373	\N	1	3	en	10.00	10.00
73	bf6va63ygcuahrno71ize8nj	laundry	Start the laundry	10.00	2025-11-04 11:48:20.149	2025-11-10 10:41:06.373	2025-11-10 10:41:06.422	1	3	en	10.00	10.00
67	sizfatscws0xl2r5mr9by6o1	gardines	Curtain replacement	10.00	2025-11-04 11:50:07.682	2025-11-10 10:41:32.65	\N	1	3	en	10.00	10.00
74	sizfatscws0xl2r5mr9by6o1	gardines	Curtain replacement	10.00	2025-11-04 11:50:07.682	2025-11-10 10:41:32.65	2025-11-10 10:41:32.693	1	3	en	10.00	10.00
71	mest03w93u2jmd7qfwt7vp4s	pet-cleaning	Pet habitat cleaning	15.00	2025-11-04 12:55:49.358	2025-11-10 10:41:58.929	\N	1	3	en	10.00	15.00
75	mest03w93u2jmd7qfwt7vp4s	pet-cleaning	Pet habitat cleaning	15.00	2025-11-04 12:55:49.358	2025-11-10 10:41:58.929	2025-11-10 10:41:58.966	1	3	en	10.00	15.00
19	qfq6lv467ckgol91v3u448et	litter-box	Pet litter box cleaning	10.00	2025-10-13 20:34:55.008	2025-11-10 10:44:00.941	\N	1	3	en	5.00	10.00
76	qfq6lv467ckgol91v3u448et	litter-box	Pet litter box cleaning	10.00	2025-10-13 20:34:55.008	2025-11-10 10:44:00.941	2025-11-10 10:44:01.028	1	3	en	5.00	10.00
13	es4c9nxh1zkdvg4gh4422tg5	balcony	Balcony cleaning	25.00	2025-10-13 20:34:14.578	2025-12-19 15:37:16.788	\N	1	3	en	20.00	20.00
81	es4c9nxh1zkdvg4gh4422tg5	balcony	Balcony cleaning	25.00	2025-10-13 20:34:14.578	2025-12-19 15:37:16.788	2025-12-19 15:37:16.823	1	3	en	20.00	20.00
23	icg0xj82a1u1q9h1re1mqk2z	closet	Closet organizing	35.00	2025-10-13 20:35:31.329	2025-12-19 15:37:49.798	\N	1	3	en	30.00	30.00
82	icg0xj82a1u1q9h1re1mqk2z	closet	Closet organizing	35.00	2025-10-13 20:35:31.329	2025-12-19 15:37:49.798	2025-12-19 15:37:49.832	1	3	en	30.00	30.00
7	zl21lxc2jplqi9g0ctrowgre	dishwashing	Dishwashing	25.00	2025-10-13 20:33:34.1	2025-12-19 15:38:37.09	\N	1	3	en	20.00	20.00
83	zl21lxc2jplqi9g0ctrowgre	dishwashing	Dishwashing	25.00	2025-10-13 20:33:34.1	2025-12-19 15:38:37.09	2025-12-19 15:38:37.123	1	3	en	20.00	20.00
9	zzbt3wnp98fqzam3x7okgi4e	fridge	Fridge cleaning	70.00	2025-10-13 20:33:50.055	2025-12-19 15:39:18.899	\N	1	3	en	60.00	60.00
84	zzbt3wnp98fqzam3x7okgi4e	fridge	Fridge cleaning	70.00	2025-10-13 20:33:50.055	2025-12-19 15:39:18.899	2025-12-19 15:39:18.94	1	3	en	60.00	60.00
1	a0ryxnlwlmst589meubzqz9i	oven	Oven cleaning	65.00	2025-10-13 20:33:01.453	2025-12-19 15:40:00.43	\N	1	3	en	60.00	60.00
85	a0ryxnlwlmst589meubzqz9i	oven	Oven cleaning	65.00	2025-10-13 20:33:01.453	2025-12-19 15:40:00.43	2025-12-19 15:40:00.486	1	3	en	60.00	60.00
15	m14eogptlgh438826onqaj8u	window	Window cleaning (per window)	20.00	2025-10-13 20:34:30.119	2025-12-19 16:07:13.899	\N	1	3	en	20.00	20.00
86	m14eogptlgh438826onqaj8u	window	Window cleaning (per window)	20.00	2025-10-13 20:34:30.119	2025-12-19 16:07:13.899	2025-12-19 16:07:13.932	1	3	en	20.00	20.00
\.


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
36	tfdjz1cify0vv73inglt13io	plugin::upload.read	{}	\N	{}	[]	2025-09-27 03:20:23.26	2025-09-27 03:20:23.26	2025-09-27 03:20:23.26	\N	\N	\N
37	jr9yj1t8xlthosfory2bge1d	plugin::upload.configure-view	{}	\N	{}	[]	2025-09-27 03:20:23.481	2025-09-27 03:20:23.481	2025-09-27 03:20:23.481	\N	\N	\N
38	a2ba7h4ngtlbvkzzfus76cxm	plugin::upload.assets.create	{}	\N	{}	[]	2025-09-27 03:20:23.703	2025-09-27 03:20:23.703	2025-09-27 03:20:23.703	\N	\N	\N
39	ykb34n7j4icn2em9fvxznmvu	plugin::upload.assets.update	{}	\N	{}	[]	2025-09-27 03:20:23.924	2025-09-27 03:20:23.924	2025-09-27 03:20:23.925	\N	\N	\N
40	p54u5gew7gqg653q7aq6foet	plugin::upload.assets.download	{}	\N	{}	[]	2025-09-27 03:20:24.148	2025-09-27 03:20:24.148	2025-09-27 03:20:24.149	\N	\N	\N
41	a0bqrh5hxlpq83ubxbgqi4a0	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-09-27 03:20:24.368	2025-09-27 03:20:24.368	2025-09-27 03:20:24.368	\N	\N	\N
42	m7izkfvphsroq04jb9xnm1rx	plugin::content-manager.explorer.create	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"]}	["admin::is-creator"]	2025-09-27 03:20:24.59	2025-09-27 03:20:24.59	2025-09-27 03:20:24.59	\N	\N	\N
44	glkskf8aabvax4klypgz6gef	plugin::content-manager.explorer.create	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"]}	["admin::is-creator"]	2025-09-27 03:20:25.037	2025-09-27 03:20:25.037	2025-09-27 03:20:25.038	\N	\N	\N
45	nxfu1t9tnpmbh9xk5wx4yr8f	plugin::content-manager.explorer.create	{}	api::feature-option.feature-option	{"fields": ["text"]}	["admin::is-creator"]	2025-09-27 03:20:25.256	2025-09-27 03:20:25.256	2025-09-27 03:20:25.256	\N	\N	\N
46	ei53umwsimh7uku4x8iw2g8p	plugin::content-manager.explorer.create	{}	api::home-page.home-page	{"fields": ["price_from"]}	["admin::is-creator"]	2025-09-27 03:20:25.477	2025-09-27 03:20:25.477	2025-09-27 03:20:25.478	\N	\N	\N
47	andrkuozj3ov4bpnkvzwni3b	plugin::content-manager.explorer.create	{}	api::question.question	{"fields": ["question", "answer"]}	["admin::is-creator"]	2025-09-27 03:20:25.702	2025-09-27 03:20:25.702	2025-09-27 03:20:25.702	\N	\N	\N
48	j7wjd888owgk0a5kedysqr3p	plugin::content-manager.explorer.create	{}	api::review.review	{"fields": ["author", "review"]}	["admin::is-creator"]	2025-09-27 03:20:25.929	2025-09-27 03:20:25.929	2025-09-27 03:20:25.93	\N	\N	\N
49	yv6cf55406jj4e19eh68ftmx	plugin::content-manager.explorer.read	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"]}	["admin::is-creator"]	2025-09-27 03:20:26.15	2025-09-27 03:20:26.15	2025-09-27 03:20:26.151	\N	\N	\N
51	hcgqbvz7m7msszrruawo9mwm	plugin::content-manager.explorer.read	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"]}	["admin::is-creator"]	2025-09-27 03:20:26.591	2025-09-27 03:20:26.591	2025-09-27 03:20:26.591	\N	\N	\N
52	h732rkqw7z6y0mv9ddgphtfz	plugin::content-manager.explorer.read	{}	api::feature-option.feature-option	{"fields": ["text"]}	["admin::is-creator"]	2025-09-27 03:20:26.812	2025-09-27 03:20:26.812	2025-09-27 03:20:26.812	\N	\N	\N
53	o0pl04kpqij60apheitu04nk	plugin::content-manager.explorer.read	{}	api::home-page.home-page	{"fields": ["price_from"]}	["admin::is-creator"]	2025-09-27 03:20:27.027	2025-09-27 03:20:27.027	2025-09-27 03:20:27.027	\N	\N	\N
54	g9aro19495vziwufnvulcpiu	plugin::content-manager.explorer.read	{}	api::question.question	{"fields": ["question", "answer"]}	["admin::is-creator"]	2025-09-27 03:20:27.247	2025-09-27 03:20:27.247	2025-09-27 03:20:27.247	\N	\N	\N
55	b4ymflwlhyq6rjankikvtaav	plugin::content-manager.explorer.read	{}	api::review.review	{"fields": ["author", "review"]}	["admin::is-creator"]	2025-09-27 03:20:27.463	2025-09-27 03:20:27.463	2025-09-27 03:20:27.463	\N	\N	\N
56	tzhegsp80npcrmst4st78a04	plugin::content-manager.explorer.update	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"]}	["admin::is-creator"]	2025-09-27 03:20:27.689	2025-09-27 03:20:27.689	2025-09-27 03:20:27.689	\N	\N	\N
58	qmhmwrnr54xkte2kmop5nagx	plugin::content-manager.explorer.update	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"]}	["admin::is-creator"]	2025-09-27 03:20:28.164	2025-09-27 03:20:28.164	2025-09-27 03:20:28.165	\N	\N	\N
59	zg3u5vk7l46yrwt4elq2mp53	plugin::content-manager.explorer.update	{}	api::feature-option.feature-option	{"fields": ["text"]}	["admin::is-creator"]	2025-09-27 03:20:28.384	2025-09-27 03:20:28.384	2025-09-27 03:20:28.385	\N	\N	\N
60	lr6e8wsjjetxxh5mjowde529	plugin::content-manager.explorer.update	{}	api::home-page.home-page	{"fields": ["price_from"]}	["admin::is-creator"]	2025-09-27 03:20:28.608	2025-09-27 03:20:28.608	2025-09-27 03:20:28.609	\N	\N	\N
61	uvkd4fshchwcw7zp6r2pzr9i	plugin::content-manager.explorer.update	{}	api::question.question	{"fields": ["question", "answer"]}	["admin::is-creator"]	2025-09-27 03:20:28.839	2025-09-27 03:20:28.839	2025-09-27 03:20:28.839	\N	\N	\N
62	v6xg9jty45rjwysrm4qgf9lh	plugin::content-manager.explorer.update	{}	api::review.review	{"fields": ["author", "review"]}	["admin::is-creator"]	2025-09-27 03:20:29.064	2025-09-27 03:20:29.064	2025-09-27 03:20:29.064	\N	\N	\N
70	eow9settxyfu4fsi3mbkpk45	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2025-09-27 03:20:30.849	2025-09-27 03:20:30.849	2025-09-27 03:20:30.85	\N	\N	\N
71	vy1vqnyxqg37rhpwqescvvoe	plugin::upload.configure-view	{}	\N	{}	[]	2025-09-27 03:20:31.077	2025-09-27 03:20:31.077	2025-09-27 03:20:31.077	\N	\N	\N
72	xkx144au7is844y3tzrlck29	plugin::upload.assets.create	{}	\N	{}	[]	2025-09-27 03:20:31.298	2025-09-27 03:20:31.298	2025-09-27 03:20:31.299	\N	\N	\N
73	b22c4lxwryekx7vojct4q66j	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2025-09-27 03:20:31.525	2025-09-27 03:20:31.525	2025-09-27 03:20:31.526	\N	\N	\N
74	cytuhxazmw5039ntf0va6kqu	plugin::upload.assets.download	{}	\N	{}	[]	2025-09-27 03:20:31.745	2025-09-27 03:20:31.745	2025-09-27 03:20:31.745	\N	\N	\N
75	vw6ym61iqctrpc1yj8png0j9	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-09-27 03:20:31.962	2025-09-27 03:20:31.962	2025-09-27 03:20:31.962	\N	\N	\N
76	zqig3oypwxrx0k0754nl2go7	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-09-27 03:20:32.36	2025-09-27 03:20:32.36	2025-09-27 03:20:32.36	\N	\N	\N
77	e8402mbegqwq8oi76nkmnshw	plugin::content-manager.explorer.create	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"], "locales": ["en"]}	[]	2025-09-27 03:20:32.576	2025-09-27 03:20:32.576	2025-09-27 03:20:32.577	\N	\N	\N
79	zsexc5z9m9gt6v7t9dg9x0uf	plugin::content-manager.explorer.create	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"], "locales": ["en"]}	[]	2025-09-27 03:20:33.019	2025-09-27 03:20:33.019	2025-09-27 03:20:33.02	\N	\N	\N
50	t0cf4k773caxrw4koai9gfxy	plugin::content-manager.explorer.read	{}	api::contact.contact	{"fields": ["title", "link"]}	["admin::is-creator"]	2025-09-27 03:20:26.371	2025-10-03 13:09:41.222	2025-09-27 03:20:26.371	\N	\N	\N
43	kd4vfpugsm0ii23emji5nimr	plugin::content-manager.explorer.create	{}	api::contact.contact	{"fields": ["title", "link"]}	["admin::is-creator"]	2025-09-27 03:20:24.808	2025-10-03 13:09:41.222	2025-09-27 03:20:24.808	\N	\N	\N
57	g2hz05atkg3s6jujx7a04iww	plugin::content-manager.explorer.update	{}	api::contact.contact	{"fields": ["title", "link"]}	["admin::is-creator"]	2025-09-27 03:20:27.928	2025-10-03 13:09:41.222	2025-09-27 03:20:27.929	\N	\N	\N
80	t09xllrsaocb8j6pgx0bv6r1	plugin::content-manager.explorer.create	{}	api::feature-option.feature-option	{"fields": ["text"], "locales": ["en"]}	[]	2025-09-27 03:20:33.235	2025-09-27 03:20:33.235	2025-09-27 03:20:33.235	\N	\N	\N
82	wx84sxl2mr3t7pt7y522padr	plugin::content-manager.explorer.create	{}	api::question.question	{"fields": ["question", "answer"], "locales": ["en"]}	[]	2025-09-27 03:20:33.674	2025-09-27 03:20:33.674	2025-09-27 03:20:33.674	\N	\N	\N
83	wrk3v2zome6vnixwilzos72d	plugin::content-manager.explorer.create	{}	api::review.review	{"fields": ["author", "review"], "locales": ["en"]}	[]	2025-09-27 03:20:33.895	2025-09-27 03:20:33.895	2025-09-27 03:20:33.895	\N	\N	\N
84	eaqzyymx4si8zzt9nqittgqf	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-09-27 03:20:34.116	2025-09-27 03:20:34.116	2025-09-27 03:20:34.116	\N	\N	\N
85	y6r479qijjxqirt47xufit3q	plugin::content-manager.explorer.read	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"], "locales": ["en"]}	[]	2025-09-27 03:20:34.351	2025-09-27 03:20:34.351	2025-09-27 03:20:34.352	\N	\N	\N
87	kt6pc8ywqo812bhxweebot3b	plugin::content-manager.explorer.read	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"], "locales": ["en"]}	[]	2025-09-27 03:20:34.791	2025-09-27 03:20:34.791	2025-09-27 03:20:34.791	\N	\N	\N
88	jm19j5tyuin41dcdsog75fjx	plugin::content-manager.explorer.read	{}	api::feature-option.feature-option	{"fields": ["text"], "locales": ["en"]}	[]	2025-09-27 03:20:35.009	2025-09-27 03:20:35.009	2025-09-27 03:20:35.009	\N	\N	\N
90	blqi65wo10dz05pohbjo8oem	plugin::content-manager.explorer.read	{}	api::question.question	{"fields": ["question", "answer"], "locales": ["en"]}	[]	2025-09-27 03:20:35.459	2025-09-27 03:20:35.459	2025-09-27 03:20:35.459	\N	\N	\N
91	cxttdk8um6ds42lxtb8nwf2t	plugin::content-manager.explorer.read	{}	api::review.review	{"fields": ["author", "review"], "locales": ["en"]}	[]	2025-09-27 03:20:35.679	2025-09-27 03:20:35.679	2025-09-27 03:20:35.679	\N	\N	\N
92	wb34w2b3lwzyov4av12qne99	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2025-09-27 03:20:35.893	2025-09-27 03:20:35.893	2025-09-27 03:20:35.894	\N	\N	\N
93	o9j24hj6875ws8jj0st63gbx	plugin::content-manager.explorer.update	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"], "locales": ["en"]}	[]	2025-09-27 03:20:36.118	2025-09-27 03:20:36.118	2025-09-27 03:20:36.118	\N	\N	\N
95	xs35klc6ihye8xm7tm5qspv8	plugin::content-manager.explorer.update	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"], "locales": ["en"]}	[]	2025-09-27 03:20:36.576	2025-09-27 03:20:36.576	2025-09-27 03:20:36.576	\N	\N	\N
96	kzd3ijuvfsrszb3sdpygwukf	plugin::content-manager.explorer.update	{}	api::feature-option.feature-option	{"fields": ["text"], "locales": ["en"]}	[]	2025-09-27 03:20:36.796	2025-09-27 03:20:36.796	2025-09-27 03:20:36.796	\N	\N	\N
98	u4jhecrhkqe52b3qdey6qyjp	plugin::content-manager.explorer.update	{}	api::question.question	{"fields": ["question", "answer"], "locales": ["en"]}	[]	2025-09-27 03:20:37.236	2025-09-27 03:20:37.236	2025-09-27 03:20:37.236	\N	\N	\N
99	mcwk1wavu7bgb370vzydcw1h	plugin::content-manager.explorer.update	{}	api::review.review	{"fields": ["author", "review"], "locales": ["en"]}	[]	2025-09-27 03:20:37.457	2025-09-27 03:20:37.457	2025-09-27 03:20:37.458	\N	\N	\N
100	zr4inncly026txmbhkgmgnih	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2025-09-27 03:20:37.677	2025-09-27 03:20:37.677	2025-09-27 03:20:37.677	\N	\N	\N
101	bslwezjuch41p12rkrk6b5e6	plugin::content-manager.explorer.delete	{}	api::advantage.advantage	{"locales": ["en"]}	[]	2025-09-27 03:20:37.907	2025-09-27 03:20:37.907	2025-09-27 03:20:37.908	\N	\N	\N
102	t7ooans12rwxj97zzpc87ajw	plugin::content-manager.explorer.delete	{}	api::contact.contact	{"locales": ["en"]}	[]	2025-09-27 03:20:38.124	2025-09-27 03:20:38.124	2025-09-27 03:20:38.125	\N	\N	\N
103	emr79zp1wo23wspuga9m1wrb	plugin::content-manager.explorer.delete	{}	api::feature.feature	{"locales": ["en"]}	[]	2025-09-27 03:20:38.341	2025-09-27 03:20:38.341	2025-09-27 03:20:38.342	\N	\N	\N
104	wfv3xu3t9wkgfzfgleqx2jd2	plugin::content-manager.explorer.delete	{}	api::feature-option.feature-option	{"locales": ["en"]}	[]	2025-09-27 03:20:38.564	2025-09-27 03:20:38.564	2025-09-27 03:20:38.565	\N	\N	\N
105	uooh0jcemm9ndhb0q2f9uckg	plugin::content-manager.explorer.delete	{}	api::home-page.home-page	{"locales": ["en"]}	[]	2025-09-27 03:20:38.783	2025-09-27 03:20:38.783	2025-09-27 03:20:38.783	\N	\N	\N
106	b6nt2f6ub4t2pihjnc13g9t4	plugin::content-manager.explorer.delete	{}	api::question.question	{"locales": ["en"]}	[]	2025-09-27 03:20:39	2025-09-27 03:20:39	2025-09-27 03:20:39	\N	\N	\N
107	n96mho4m4wk2tqh6myiraoj9	plugin::content-manager.explorer.delete	{}	api::review.review	{"locales": ["en"]}	[]	2025-09-27 03:20:39.224	2025-09-27 03:20:39.224	2025-09-27 03:20:39.225	\N	\N	\N
108	r8wckir5s47v7t79x23mvbvw	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2025-09-27 03:20:39.445	2025-09-27 03:20:39.445	2025-09-27 03:20:39.445	\N	\N	\N
109	zd36mzkiktmam7uqmb774o9t	plugin::content-manager.explorer.publish	{}	api::advantage.advantage	{"locales": ["en"]}	[]	2025-09-27 03:20:39.66	2025-09-27 03:20:39.66	2025-09-27 03:20:39.66	\N	\N	\N
110	uzsdgez1fmc8t0rf7pvnsx3w	plugin::content-manager.explorer.publish	{}	api::contact.contact	{"locales": ["en"]}	[]	2025-09-27 03:20:39.883	2025-09-27 03:20:39.883	2025-09-27 03:20:39.883	\N	\N	\N
111	yw9wf1hdxzcleqmw73x65q3a	plugin::content-manager.explorer.publish	{}	api::feature.feature	{"locales": ["en"]}	[]	2025-09-27 03:20:40.102	2025-09-27 03:20:40.102	2025-09-27 03:20:40.102	\N	\N	\N
112	xec5mcbog7axy3hv6822ddig	plugin::content-manager.explorer.publish	{}	api::feature-option.feature-option	{"locales": ["en"]}	[]	2025-09-27 03:20:40.327	2025-09-27 03:20:40.327	2025-09-27 03:20:40.328	\N	\N	\N
113	di0znoocwch5cqchzx0djp7t	plugin::content-manager.explorer.publish	{}	api::home-page.home-page	{"locales": ["en"]}	[]	2025-09-27 03:20:40.549	2025-09-27 03:20:40.549	2025-09-27 03:20:40.549	\N	\N	\N
114	tspjp3rpdt73vdpcn3i2g1u4	plugin::content-manager.explorer.publish	{}	api::question.question	{"locales": ["en"]}	[]	2025-09-27 03:20:40.764	2025-09-27 03:20:40.764	2025-09-27 03:20:40.764	\N	\N	\N
115	egh1m67stn50v67oe3376kuc	plugin::content-manager.explorer.publish	{}	api::review.review	{"locales": ["en"]}	[]	2025-09-27 03:20:40.977	2025-09-27 03:20:40.977	2025-09-27 03:20:40.977	\N	\N	\N
116	dj5rtnr5hdttclmxax7nc1y6	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2025-09-27 03:20:41.193	2025-09-27 03:20:41.193	2025-09-27 03:20:41.193	\N	\N	\N
117	z6bht1wjiy0c40yjd3aul5u5	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2025-09-27 03:20:41.413	2025-09-27 03:20:41.413	2025-09-27 03:20:41.413	\N	\N	\N
118	bkxpevcgqu76uwg6gd192e50	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2025-09-27 03:20:41.637	2025-09-27 03:20:41.637	2025-09-27 03:20:41.638	\N	\N	\N
119	r4q79b8aag8a9j1ojq3adgan	plugin::content-type-builder.read	{}	\N	{}	[]	2025-09-27 03:20:41.855	2025-09-27 03:20:41.855	2025-09-27 03:20:41.855	\N	\N	\N
120	rclif447qyb5d1k4jhrvb8p5	plugin::email.settings.read	{}	\N	{}	[]	2025-09-27 03:20:42.071	2025-09-27 03:20:42.071	2025-09-27 03:20:42.071	\N	\N	\N
121	qx57byyuspxde2id4wvabix3	plugin::upload.read	{}	\N	{}	[]	2025-09-27 03:20:42.294	2025-09-27 03:20:42.294	2025-09-27 03:20:42.295	\N	\N	\N
122	ygmocpadpcg6v8wgkk9k4bdd	plugin::upload.assets.create	{}	\N	{}	[]	2025-09-27 03:20:42.515	2025-09-27 03:20:42.515	2025-09-27 03:20:42.516	\N	\N	\N
123	xc7jwt0vwa4bnkirn6ul3r3d	plugin::upload.assets.update	{}	\N	{}	[]	2025-09-27 03:20:42.739	2025-09-27 03:20:42.739	2025-09-27 03:20:42.739	\N	\N	\N
124	h1lrf27rd7qxfym3kb38pd25	plugin::upload.assets.download	{}	\N	{}	[]	2025-09-27 03:20:42.96	2025-09-27 03:20:42.96	2025-09-27 03:20:42.961	\N	\N	\N
125	idkyxhnvp6bev0r28gsmvfko	plugin::upload.assets.copy-link	{}	\N	{}	[]	2025-09-27 03:20:43.182	2025-09-27 03:20:43.182	2025-09-27 03:20:43.182	\N	\N	\N
126	qjiwycutzwvsnbpbau4kd856	plugin::upload.configure-view	{}	\N	{}	[]	2025-09-27 03:20:43.394	2025-09-27 03:20:43.394	2025-09-27 03:20:43.395	\N	\N	\N
127	gcr7wy3oq1etwt56chuolt5k	plugin::upload.settings.read	{}	\N	{}	[]	2025-09-27 03:20:43.618	2025-09-27 03:20:43.618	2025-09-27 03:20:43.619	\N	\N	\N
128	mrafwvzeze9lgej4ae0inpsz	plugin::i18n.locale.create	{}	\N	{}	[]	2025-09-27 03:20:43.843	2025-09-27 03:20:43.843	2025-09-27 03:20:43.844	\N	\N	\N
129	j3fpb7hzjcpvegqlj260h4uj	plugin::i18n.locale.read	{}	\N	{}	[]	2025-09-27 03:20:44.07	2025-09-27 03:20:44.07	2025-09-27 03:20:44.07	\N	\N	\N
130	nynge97uvwvjwsoew53pahic	plugin::i18n.locale.update	{}	\N	{}	[]	2025-09-27 03:20:44.291	2025-09-27 03:20:44.291	2025-09-27 03:20:44.291	\N	\N	\N
131	k5ja992tfobu8upyzmcyib49	plugin::i18n.locale.delete	{}	\N	{}	[]	2025-09-27 03:20:44.515	2025-09-27 03:20:44.515	2025-09-27 03:20:44.516	\N	\N	\N
132	ih3bu7k4ul8s4rnzs6n39k7q	plugin::users-permissions.roles.create	{}	\N	{}	[]	2025-09-27 03:20:44.734	2025-09-27 03:20:44.734	2025-09-27 03:20:44.734	\N	\N	\N
133	a0rj8jlzc0vbi42aretegz16	plugin::users-permissions.roles.read	{}	\N	{}	[]	2025-09-27 03:20:44.959	2025-09-27 03:20:44.959	2025-09-27 03:20:44.96	\N	\N	\N
134	qcgdunglmi02m6vnylcpebxv	plugin::users-permissions.roles.update	{}	\N	{}	[]	2025-09-27 03:20:45.176	2025-09-27 03:20:45.176	2025-09-27 03:20:45.176	\N	\N	\N
135	w1tk8detuizwhnfy08nher1m	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2025-09-27 03:20:45.395	2025-09-27 03:20:45.395	2025-09-27 03:20:45.396	\N	\N	\N
136	eqyrob79b2sm9gjazxvjku8s	plugin::users-permissions.providers.read	{}	\N	{}	[]	2025-09-27 03:20:45.619	2025-09-27 03:20:45.619	2025-09-27 03:20:45.62	\N	\N	\N
137	kjzwwgm2vw32of301j1zxfph	plugin::users-permissions.providers.update	{}	\N	{}	[]	2025-09-27 03:20:45.85	2025-09-27 03:20:45.85	2025-09-27 03:20:45.85	\N	\N	\N
138	mi6llecf9gcc7ef4q3vctgpl	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2025-09-27 03:20:46.068	2025-09-27 03:20:46.068	2025-09-27 03:20:46.068	\N	\N	\N
139	dzr1i6u0rkofge7xfm8rpo7q	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2025-09-27 03:20:46.291	2025-09-27 03:20:46.291	2025-09-27 03:20:46.291	\N	\N	\N
140	k4fifhn78kuqgo72vfspr4ny	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2025-09-27 03:23:35.125	2025-09-27 03:23:35.125	2025-09-27 03:23:35.125	\N	\N	\N
141	uau5b3jf72bb500it8i3o2ub	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2025-09-27 03:23:35.346	2025-09-27 03:23:35.346	2025-09-27 03:23:35.347	\N	\N	\N
142	o12v02g74hc6vtol7jubqhwa	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2025-09-27 03:23:35.581	2025-09-27 03:23:35.581	2025-09-27 03:23:35.583	\N	\N	\N
143	pzq32dso6xeqde3z2x50is9r	admin::marketplace.read	{}	\N	{}	[]	2025-09-27 03:23:35.801	2025-09-27 03:23:35.801	2025-09-27 03:23:35.802	\N	\N	\N
144	y629z7ms2ib8x30n3n5rxr6r	admin::webhooks.create	{}	\N	{}	[]	2025-09-27 03:23:36.016	2025-09-27 03:23:36.016	2025-09-27 03:23:36.017	\N	\N	\N
145	uilx6n231es59jvaebifgqyh	admin::webhooks.read	{}	\N	{}	[]	2025-09-27 03:23:36.245	2025-09-27 03:23:36.245	2025-09-27 03:23:36.246	\N	\N	\N
146	w0yokxrrznrv7139co09yv1f	admin::webhooks.update	{}	\N	{}	[]	2025-09-27 03:23:36.463	2025-09-27 03:23:36.463	2025-09-27 03:23:36.463	\N	\N	\N
147	c7qp66ddvx8124lpfu0eb703	admin::webhooks.delete	{}	\N	{}	[]	2025-09-27 03:23:36.678	2025-09-27 03:23:36.678	2025-09-27 03:23:36.679	\N	\N	\N
148	v27mxu9j0ijv9i27pw689tbh	admin::users.create	{}	\N	{}	[]	2025-09-27 03:23:36.9	2025-09-27 03:23:36.9	2025-09-27 03:23:36.901	\N	\N	\N
149	fmkmrle5i3gmesr2tbevk3su	admin::users.read	{}	\N	{}	[]	2025-09-27 03:23:37.113	2025-09-27 03:23:37.113	2025-09-27 03:23:37.114	\N	\N	\N
150	ab0az20qkmqyq9uedv26v86r	admin::users.update	{}	\N	{}	[]	2025-09-27 03:23:37.334	2025-09-27 03:23:37.334	2025-09-27 03:23:37.335	\N	\N	\N
151	dsv2gwtad5qwfbfsvv0p05uy	admin::users.delete	{}	\N	{}	[]	2025-09-27 03:23:37.552	2025-09-27 03:23:37.552	2025-09-27 03:23:37.552	\N	\N	\N
152	vqz2u9uaf73q400cbtmsiv38	admin::roles.create	{}	\N	{}	[]	2025-09-27 03:23:37.768	2025-09-27 03:23:37.768	2025-09-27 03:23:37.769	\N	\N	\N
153	pkpwzv6gs1kh4r11atdcffo2	admin::roles.read	{}	\N	{}	[]	2025-09-27 03:23:37.987	2025-09-27 03:23:37.987	2025-09-27 03:23:37.988	\N	\N	\N
154	sdbxgkqk75asjli8r5w7pmbz	admin::roles.update	{}	\N	{}	[]	2025-09-27 03:23:38.204	2025-09-27 03:23:38.204	2025-09-27 03:23:38.205	\N	\N	\N
155	a5iuvqbyjtn8puvlj6q6a6d2	admin::roles.delete	{}	\N	{}	[]	2025-09-27 03:23:38.425	2025-09-27 03:23:38.425	2025-09-27 03:23:38.426	\N	\N	\N
156	h1yvqn8e4tef4lvbbicr6dr8	admin::api-tokens.access	{}	\N	{}	[]	2025-09-27 03:23:38.639	2025-09-27 03:23:38.639	2025-09-27 03:23:38.639	\N	\N	\N
157	jql3u428ym6s72ye7ucixkea	admin::api-tokens.create	{}	\N	{}	[]	2025-09-27 03:23:38.851	2025-09-27 03:23:38.851	2025-09-27 03:23:38.852	\N	\N	\N
158	gsoqkxqxzj01rr9wj2h8n65k	admin::api-tokens.read	{}	\N	{}	[]	2025-09-27 03:23:39.065	2025-09-27 03:23:39.065	2025-09-27 03:23:39.065	\N	\N	\N
159	s0h2no4rzb1iq8njxlqkghry	admin::api-tokens.update	{}	\N	{}	[]	2025-09-27 03:23:39.28	2025-09-27 03:23:39.28	2025-09-27 03:23:39.28	\N	\N	\N
160	reywiu4t5njbyvo2fnem49c5	admin::api-tokens.regenerate	{}	\N	{}	[]	2025-09-27 03:23:39.495	2025-09-27 03:23:39.495	2025-09-27 03:23:39.495	\N	\N	\N
161	nc5yxk4be3mfbcpibvkk3zov	admin::api-tokens.delete	{}	\N	{}	[]	2025-09-27 03:23:39.711	2025-09-27 03:23:39.711	2025-09-27 03:23:39.712	\N	\N	\N
162	t32sn20e3jxvzuimaeii644x	admin::project-settings.update	{}	\N	{}	[]	2025-09-27 03:23:39.95	2025-09-27 03:23:39.95	2025-09-27 03:23:39.951	\N	\N	\N
163	xzodrun0l9glsp3gst4pe8s8	admin::project-settings.read	{}	\N	{}	[]	2025-09-27 03:23:40.171	2025-09-27 03:23:40.171	2025-09-27 03:23:40.171	\N	\N	\N
164	jmhljq7gtgn80trrhzv01wvo	admin::transfer.tokens.access	{}	\N	{}	[]	2025-09-27 03:23:40.387	2025-09-27 03:23:40.387	2025-09-27 03:23:40.387	\N	\N	\N
165	cu5tvz2nk8gwmqrqau6ccs58	admin::transfer.tokens.create	{}	\N	{}	[]	2025-09-27 03:23:40.606	2025-09-27 03:23:40.606	2025-09-27 03:23:40.606	\N	\N	\N
166	r4cu7s5sw0aqg69fz4xbg039	admin::transfer.tokens.read	{}	\N	{}	[]	2025-09-27 03:23:40.885	2025-09-27 03:23:40.885	2025-09-27 03:23:40.886	\N	\N	\N
167	vdnrxig539dvt1io7f6e4opr	admin::transfer.tokens.update	{}	\N	{}	[]	2025-09-27 03:23:41.106	2025-09-27 03:23:41.106	2025-09-27 03:23:41.107	\N	\N	\N
168	xqwhu4gwfga4q2wfwgyg62w6	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2025-09-27 03:23:41.323	2025-09-27 03:23:41.323	2025-09-27 03:23:41.323	\N	\N	\N
169	krh2bvejg5zpj4tdj6xv2vss	admin::transfer.tokens.delete	{}	\N	{}	[]	2025-09-27 03:23:41.543	2025-09-27 03:23:41.543	2025-09-27 03:23:41.544	\N	\N	\N
171	m877e1nxkic3omcup9k3cl6e	plugin::content-manager.explorer.create	{}	api::coefficient.coefficient	{"fields": ["slug", "coefficient", "applies_to"]}	[]	2025-10-03 13:09:40.637	2025-10-03 13:09:40.637	2025-10-03 13:09:40.637	\N	\N	\N
172	abiwz4cd7mo8u6c7klcy9sf7	plugin::content-manager.explorer.create	{}	api::contact.contact	{"fields": ["slug", "title", "link"], "locales": ["en"]}	[]	2025-10-03 13:09:40.647	2025-10-03 13:09:40.647	2025-10-03 13:09:40.647	\N	\N	\N
174	ibczje8yoo1cjt95i39xiofe	plugin::content-manager.explorer.create	{}	api::login-page.login-page	{"fields": ["login_background"], "locales": ["en"]}	[]	2025-10-03 13:09:40.67	2025-10-03 13:09:40.67	2025-10-03 13:09:40.671	\N	\N	\N
175	uh4nm03ujaogwdd4nksf7q99	plugin::content-manager.explorer.create	{}	api::privacy-policy.privacy-policy	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-03 13:09:40.681	2025-10-03 13:09:40.681	2025-10-03 13:09:40.681	\N	\N	\N
178	ft5ul69ky8z74mg3jz2xq8i0	plugin::content-manager.explorer.create	{}	api::terms-of-service.terms-of-service	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-03 13:09:40.722	2025-10-03 13:09:40.722	2025-10-03 13:09:40.723	\N	\N	\N
180	zuakh5965ri8um37ctzy2jk0	plugin::content-manager.explorer.read	{}	api::coefficient.coefficient	{"fields": ["slug", "coefficient", "applies_to"]}	[]	2025-10-03 13:09:40.742	2025-10-03 13:09:40.742	2025-10-03 13:09:40.742	\N	\N	\N
181	mryfuso43n2g67iz6kadkdkz	plugin::content-manager.explorer.read	{}	api::contact.contact	{"fields": ["slug", "title", "link"], "locales": ["en"]}	[]	2025-10-03 13:09:40.752	2025-10-03 13:09:40.752	2025-10-03 13:09:40.752	\N	\N	\N
183	rwan7bicxewsgufezxb7nu73	plugin::content-manager.explorer.read	{}	api::login-page.login-page	{"fields": ["login_background"], "locales": ["en"]}	[]	2025-10-03 13:09:40.769	2025-10-03 13:09:40.769	2025-10-03 13:09:40.77	\N	\N	\N
184	bm3vdbugcmd2rv77wq969tij	plugin::content-manager.explorer.read	{}	api::privacy-policy.privacy-policy	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-03 13:09:40.777	2025-10-03 13:09:40.777	2025-10-03 13:09:40.778	\N	\N	\N
187	w1i7pz11dpak2t7hqz2oihsc	plugin::content-manager.explorer.read	{}	api::terms-of-service.terms-of-service	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-03 13:09:40.804	2025-10-03 13:09:40.804	2025-10-03 13:09:40.804	\N	\N	\N
189	qmgts9uvnuoevbbpen3e6xg3	plugin::content-manager.explorer.update	{}	api::coefficient.coefficient	{"fields": ["slug", "coefficient", "applies_to"]}	[]	2025-10-03 13:09:40.824	2025-10-03 13:09:40.824	2025-10-03 13:09:40.824	\N	\N	\N
190	umwwqk2ejp1c1hm7awfy6ued	plugin::content-manager.explorer.update	{}	api::contact.contact	{"fields": ["slug", "title", "link"], "locales": ["en"]}	[]	2025-10-03 13:09:40.834	2025-10-03 13:09:40.834	2025-10-03 13:09:40.834	\N	\N	\N
192	n7u2jxov5vxv1at3bvpwdalq	plugin::content-manager.explorer.update	{}	api::login-page.login-page	{"fields": ["login_background"], "locales": ["en"]}	[]	2025-10-03 13:09:40.855	2025-10-03 13:09:40.855	2025-10-03 13:09:40.855	\N	\N	\N
193	axhv57x3vdffrqwwmab9l7f1	plugin::content-manager.explorer.update	{}	api::privacy-policy.privacy-policy	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-03 13:09:40.864	2025-10-03 13:09:40.864	2025-10-03 13:09:40.865	\N	\N	\N
196	tw6f20n5r7bt5uibima9p60d	plugin::content-manager.explorer.update	{}	api::terms-of-service.terms-of-service	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-03 13:09:40.893	2025-10-03 13:09:40.893	2025-10-03 13:09:40.894	\N	\N	\N
197	t2nvxn7vml6e8gwzlnuvl9pj	plugin::content-manager.explorer.delete	{}	api::addon.addon	{"locales": ["en"]}	[]	2025-10-03 13:09:40.903	2025-10-03 13:09:40.903	2025-10-03 13:09:40.904	\N	\N	\N
198	eygtxxv133lw6mkpa1iiuffj	plugin::content-manager.explorer.delete	{}	api::coefficient.coefficient	{}	[]	2025-10-03 13:09:40.919	2025-10-03 13:09:40.919	2025-10-03 13:09:40.92	\N	\N	\N
199	q9m1zh9ije4vi5c7k1hl7f1v	plugin::content-manager.explorer.delete	{}	api::login-page.login-page	{"locales": ["en"]}	[]	2025-10-03 13:09:40.929	2025-10-03 13:09:40.929	2025-10-03 13:09:40.929	\N	\N	\N
200	w3dpuqc0voouem51b07s9hs6	plugin::content-manager.explorer.delete	{}	api::privacy-policy.privacy-policy	{"locales": ["en"]}	[]	2025-10-03 13:09:40.95	2025-10-03 13:09:40.95	2025-10-03 13:09:40.95	\N	\N	\N
202	wez680krk1a88x2zc9mzh6ps	plugin::content-manager.explorer.delete	{}	api::service.service	{"locales": ["en"]}	[]	2025-10-03 13:09:41.009	2025-10-03 13:09:41.009	2025-10-03 13:09:41.009	\N	\N	\N
203	otkv2dbjqbo72wbpeat7d9ss	plugin::content-manager.explorer.delete	{}	api::terms-of-service.terms-of-service	{"locales": ["en"]}	[]	2025-10-03 13:09:41.026	2025-10-03 13:09:41.026	2025-10-03 13:09:41.026	\N	\N	\N
204	aoyoxtgvj9s487tdlh4hpyom	plugin::content-manager.explorer.publish	{}	api::addon.addon	{"locales": ["en"]}	[]	2025-10-03 13:09:41.036	2025-10-03 13:09:41.036	2025-10-03 13:09:41.036	\N	\N	\N
205	rj05j72pufoe6kvq29auhtoe	plugin::content-manager.explorer.publish	{}	api::coefficient.coefficient	{}	[]	2025-10-03 13:09:41.046	2025-10-03 13:09:41.046	2025-10-03 13:09:41.046	\N	\N	\N
243	l2tt67be6dg3n588b4kyxk9s	plugin::content-manager.explorer.publish	{}	api::contact.contact	{"locales": ["en"]}	[]	2025-10-17 08:21:12.099	2025-10-17 08:21:12.099	2025-10-17 08:21:12.099	\N	\N	\N
247	iqbmog4uq1aejqpul1evolm1	plugin::content-manager.explorer.publish	{}	api::feature.feature	{"locales": ["en"]}	[]	2025-10-17 08:21:12.138	2025-10-17 08:21:12.138	2025-10-17 08:21:12.138	\N	\N	\N
251	c5qksrdhrvfnewywd2lojvn8	plugin::content-manager.explorer.publish	{}	api::feature-option.feature-option	{"locales": ["en"]}	[]	2025-10-17 08:21:12.17	2025-10-17 08:21:12.17	2025-10-17 08:21:12.17	\N	\N	\N
206	dj26l0dho53xf06bahumbo3q	plugin::content-manager.explorer.publish	{}	api::login-page.login-page	{"locales": ["en"]}	[]	2025-10-03 13:09:41.056	2025-10-03 13:09:41.056	2025-10-03 13:09:41.057	\N	\N	\N
207	pvgw05qhbs6wpr2f0ewa1gzx	plugin::content-manager.explorer.publish	{}	api::privacy-policy.privacy-policy	{"locales": ["en"]}	[]	2025-10-03 13:09:41.067	2025-10-03 13:09:41.067	2025-10-03 13:09:41.067	\N	\N	\N
209	fh1wgy5laxodvc6utbhslx37	plugin::content-manager.explorer.publish	{}	api::service.service	{"locales": ["en"]}	[]	2025-10-03 13:09:41.088	2025-10-03 13:09:41.088	2025-10-03 13:09:41.088	\N	\N	\N
210	pa4pulh9g3gehaculnq65ejd	plugin::content-manager.explorer.publish	{}	api::terms-of-service.terms-of-service	{"locales": ["en"]}	[]	2025-10-03 13:09:41.099	2025-10-03 13:09:41.099	2025-10-03 13:09:41.099	\N	\N	\N
212	l010sadz8cbd3fz8e75jne3j	plugin::content-manager.explorer.create	{}	api::tax.tax	{"fields": ["vat"]}	[]	2025-10-13 20:25:58.103	2025-10-13 20:25:58.103	2025-10-13 20:25:58.104	\N	\N	\N
214	prxbz7t02ixlfqhassa6scr9	plugin::content-manager.explorer.read	{}	api::tax.tax	{"fields": ["vat"]}	[]	2025-10-13 20:25:58.121	2025-10-13 20:25:58.121	2025-10-13 20:25:58.123	\N	\N	\N
216	ygxw6kgf7tg3cmyql77ahbt6	plugin::content-manager.explorer.update	{}	api::tax.tax	{"fields": ["vat"]}	[]	2025-10-13 20:25:58.14	2025-10-13 20:25:58.14	2025-10-13 20:25:58.14	\N	\N	\N
217	m89gi4mdmgp2qbble34xu7d6	plugin::content-manager.explorer.delete	{}	api::tax.tax	{}	[]	2025-10-13 20:25:58.148	2025-10-13 20:25:58.148	2025-10-13 20:25:58.148	\N	\N	\N
218	wz71czlome5natj2qsla4gb0	plugin::content-manager.explorer.publish	{}	api::tax.tax	{}	[]	2025-10-13 20:25:58.156	2025-10-13 20:25:58.156	2025-10-13 20:25:58.157	\N	\N	\N
219	i7r5c628bqsrho3l25nh7c38	plugin::content-manager.explorer.create	{}	api::addon.addon	{"fields": ["slug", "name", "price", "worker_time", "client_time"], "locales": ["en"]}	[]	2025-10-13 22:06:29.386	2025-10-13 22:06:29.386	2025-10-13 22:06:29.39	\N	\N	\N
220	u4sljg6n0or98ppvzpsyjc0t	plugin::content-manager.explorer.create	{}	api::service.service	{"fields": ["slug", "name", "service_price", "sqft_price", "worker_time", "client_time", "extra_bedroom_price", "extra_bedroom_worker_time", "extra_bedroom_client_time", "extra_bathroom_price", "extra_bathroom_worker_time", "extra_bathroom_client_time", "extra_kitchen_price", "extra_kitchen_worker_time", "extra_kitchen_client_time"], "locales": ["en"]}	[]	2025-10-13 22:06:29.406	2025-10-13 22:06:29.406	2025-10-13 22:06:29.406	\N	\N	\N
221	kmt84xfq3bk2u16fjq9eopqz	plugin::content-manager.explorer.read	{}	api::addon.addon	{"fields": ["slug", "name", "price", "worker_time", "client_time"], "locales": ["en"]}	[]	2025-10-13 22:06:29.415	2025-10-13 22:06:29.415	2025-10-13 22:06:29.416	\N	\N	\N
222	xpebyoryod6x9pad0csya4ml	plugin::content-manager.explorer.read	{}	api::service.service	{"fields": ["slug", "name", "service_price", "sqft_price", "worker_time", "client_time", "extra_bedroom_price", "extra_bedroom_worker_time", "extra_bedroom_client_time", "extra_bathroom_price", "extra_bathroom_worker_time", "extra_bathroom_client_time", "extra_kitchen_price", "extra_kitchen_worker_time", "extra_kitchen_client_time"], "locales": ["en"]}	[]	2025-10-13 22:06:29.424	2025-10-13 22:06:29.424	2025-10-13 22:06:29.428	\N	\N	\N
223	x4lzajqd27929jlmy17tl17b	plugin::content-manager.explorer.update	{}	api::addon.addon	{"fields": ["slug", "name", "price", "worker_time", "client_time"], "locales": ["en"]}	[]	2025-10-13 22:06:29.439	2025-10-13 22:06:29.439	2025-10-13 22:06:29.439	\N	\N	\N
224	wame8v34mzdy5ugszhho70d9	plugin::content-manager.explorer.update	{}	api::service.service	{"fields": ["slug", "name", "service_price", "sqft_price", "worker_time", "client_time", "extra_bedroom_price", "extra_bedroom_worker_time", "extra_bedroom_client_time", "extra_bathroom_price", "extra_bathroom_worker_time", "extra_bathroom_client_time", "extra_kitchen_price", "extra_kitchen_worker_time", "extra_kitchen_client_time"], "locales": ["en"]}	[]	2025-10-13 22:06:29.449	2025-10-13 22:06:29.449	2025-10-13 22:06:29.449	\N	\N	\N
225	vavmtkbhg05n66eendwfn6b9	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2025-10-17 08:21:11.866	2025-10-17 08:21:11.866	2025-10-17 08:21:11.867	\N	\N	\N
226	pznrjn89mrfqzdaunxpbmb75	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2025-10-17 08:21:11.88	2025-10-17 08:21:11.88	2025-10-17 08:21:11.88	\N	\N	\N
227	rgaz7g5t9zpq60gzgdm2cn72	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2025-10-17 08:21:11.889	2025-10-17 08:21:11.889	2025-10-17 08:21:11.889	\N	\N	\N
228	u9yyna6huil3rhuwbrdhecmk	plugin::content-manager.explorer.create	{}	api::addon.addon	{"fields": ["slug", "name", "price", "worker_time", "client_time"], "locales": ["en"]}	[]	2025-10-17 08:21:11.902	2025-10-17 08:21:11.902	2025-10-17 08:21:11.902	\N	\N	\N
229	mx8y4t53cqxt8361zisf8p3h	plugin::content-manager.explorer.read	{}	api::addon.addon	{"fields": ["slug", "name", "price", "worker_time", "client_time"], "locales": ["en"]}	[]	2025-10-17 08:21:11.918	2025-10-17 08:21:11.918	2025-10-17 08:21:11.918	\N	\N	\N
230	xfvjvrpd3c3jg6e8gjw57559	plugin::content-manager.explorer.update	{}	api::addon.addon	{"fields": ["slug", "name", "price", "worker_time", "client_time"], "locales": ["en"]}	[]	2025-10-17 08:21:11.926	2025-10-17 08:21:11.926	2025-10-17 08:21:11.926	\N	\N	\N
231	b8i5c0yrbqffwte4bn0wzlk9	plugin::content-manager.explorer.publish	{}	api::addon.addon	{"locales": ["en"]}	[]	2025-10-17 08:21:11.934	2025-10-17 08:21:11.934	2025-10-17 08:21:11.934	\N	\N	\N
235	d2btv2mwasfpckzi99pay8nf	plugin::content-manager.explorer.publish	{}	api::advantage.advantage	{"locales": ["en"]}	[]	2025-10-17 08:21:11.969	2025-10-17 08:21:11.969	2025-10-17 08:21:11.969	\N	\N	\N
236	me9e1t52h6ug42hsvqc3vq2d	plugin::content-manager.explorer.create	{}	api::coefficient.coefficient	{"fields": ["slug", "coefficient", "applies_to"]}	[]	2025-10-17 08:21:11.977	2025-10-17 08:21:11.977	2025-10-17 08:21:11.977	\N	\N	\N
237	dh8sbpptljj62zjekur1fae3	plugin::content-manager.explorer.read	{}	api::coefficient.coefficient	{"fields": ["slug", "coefficient", "applies_to"]}	[]	2025-10-17 08:21:11.992	2025-10-17 08:21:11.992	2025-10-17 08:21:11.992	\N	\N	\N
238	wgeyegnh5rwz12jtl4yqaknj	plugin::content-manager.explorer.update	{}	api::coefficient.coefficient	{"fields": ["slug", "coefficient", "applies_to"]}	[]	2025-10-17 08:21:12.002	2025-10-17 08:21:12.002	2025-10-17 08:21:12.003	\N	\N	\N
239	oydq5n01givpkwmclrmhk3ga	plugin::content-manager.explorer.publish	{}	api::coefficient.coefficient	{}	[]	2025-10-17 08:21:12.017	2025-10-17 08:21:12.017	2025-10-17 08:21:12.017	\N	\N	\N
255	mvicho86addm162viju9468r	plugin::content-manager.explorer.publish	{}	api::question.question	{"locales": ["en"]}	[]	2025-10-17 08:21:12.2	2025-10-17 08:21:12.2	2025-10-17 08:21:12.201	\N	\N	\N
259	xv9ygmqdq0d8drdddspnm7dp	plugin::content-manager.explorer.publish	{}	api::review.review	{"locales": ["en"]}	[]	2025-10-17 08:21:12.233	2025-10-17 08:21:12.233	2025-10-17 08:21:12.233	\N	\N	\N
260	i1yy5tta8ubq2162sfr9udb1	plugin::content-manager.explorer.create	{}	api::service.service	{"fields": ["slug", "name", "service_price", "sqft_price", "worker_time", "client_time", "extra_bedroom_price", "extra_bedroom_worker_time", "extra_bedroom_client_time", "extra_bathroom_price", "extra_bathroom_worker_time", "extra_bathroom_client_time", "extra_kitchen_price", "extra_kitchen_worker_time", "extra_kitchen_client_time"], "locales": ["en"]}	[]	2025-10-17 08:21:12.24	2025-10-17 08:21:12.24	2025-10-17 08:21:12.24	\N	\N	\N
261	wbmc3wn5tlrp95usmjwkttc5	plugin::content-manager.explorer.read	{}	api::service.service	{"fields": ["slug", "name", "service_price", "sqft_price", "worker_time", "client_time", "extra_bedroom_price", "extra_bedroom_worker_time", "extra_bedroom_client_time", "extra_bathroom_price", "extra_bathroom_worker_time", "extra_bathroom_client_time", "extra_kitchen_price", "extra_kitchen_worker_time", "extra_kitchen_client_time"], "locales": ["en"]}	[]	2025-10-17 08:21:12.249	2025-10-17 08:21:12.249	2025-10-17 08:21:12.249	\N	\N	\N
262	cr30szd959asj4z96jjwgkir	plugin::content-manager.explorer.update	{}	api::service.service	{"fields": ["slug", "name", "service_price", "sqft_price", "worker_time", "client_time", "extra_bedroom_price", "extra_bedroom_worker_time", "extra_bedroom_client_time", "extra_bathroom_price", "extra_bathroom_worker_time", "extra_bathroom_client_time", "extra_kitchen_price", "extra_kitchen_worker_time", "extra_kitchen_client_time"], "locales": ["en"]}	[]	2025-10-17 08:21:12.255	2025-10-17 08:21:12.255	2025-10-17 08:21:12.255	\N	\N	\N
263	vjs0wwvqd3i3u779n83yta9d	plugin::content-manager.explorer.publish	{}	api::service.service	{"locales": ["en"]}	[]	2025-10-17 08:21:12.262	2025-10-17 08:21:12.262	2025-10-17 08:21:12.262	\N	\N	\N
267	lfvujzaot7ng51lrl6ner4vc	plugin::content-manager.explorer.publish	{}	api::home-page.home-page	{"locales": ["en"]}	[]	2025-10-17 08:21:12.29	2025-10-17 08:21:12.29	2025-10-17 08:21:12.29	\N	\N	\N
268	mb8nnutq0z81gl5sifdupl58	plugin::content-manager.explorer.create	{}	api::login-page.login-page	{"fields": ["login_background"], "locales": ["en"]}	[]	2025-10-17 08:21:12.297	2025-10-17 08:21:12.297	2025-10-17 08:21:12.297	\N	\N	\N
269	knnlkkn6izfx7v7ous7jrbzn	plugin::content-manager.explorer.read	{}	api::login-page.login-page	{"fields": ["login_background"], "locales": ["en"]}	[]	2025-10-17 08:21:12.304	2025-10-17 08:21:12.304	2025-10-17 08:21:12.304	\N	\N	\N
270	f115osentiu0juxc4bf6ekc7	plugin::content-manager.explorer.update	{}	api::login-page.login-page	{"fields": ["login_background"], "locales": ["en"]}	[]	2025-10-17 08:21:12.311	2025-10-17 08:21:12.311	2025-10-17 08:21:12.313	\N	\N	\N
271	csc5dro8vyjsm7o47pqlrx3n	plugin::content-manager.explorer.publish	{}	api::login-page.login-page	{"locales": ["en"]}	[]	2025-10-17 08:21:12.32	2025-10-17 08:21:12.32	2025-10-17 08:21:12.321	\N	\N	\N
272	pfc2j82e9jscgmf3idquw0tk	plugin::content-manager.explorer.create	{}	api::privacy-policy.privacy-policy	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-17 08:21:12.328	2025-10-17 08:21:12.328	2025-10-17 08:21:12.328	\N	\N	\N
273	k3u0psx3h90w9k7nljnye95x	plugin::content-manager.explorer.read	{}	api::privacy-policy.privacy-policy	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-17 08:21:12.335	2025-10-17 08:21:12.335	2025-10-17 08:21:12.335	\N	\N	\N
274	nnir7lqlk4e12a8rptik2iuh	plugin::content-manager.explorer.update	{}	api::privacy-policy.privacy-policy	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-17 08:21:12.342	2025-10-17 08:21:12.342	2025-10-17 08:21:12.342	\N	\N	\N
275	nsaipmj3mnxapw86o8s8hetc	plugin::content-manager.explorer.publish	{}	api::privacy-policy.privacy-policy	{"locales": ["en"]}	[]	2025-10-17 08:21:12.349	2025-10-17 08:21:12.349	2025-10-17 08:21:12.349	\N	\N	\N
276	kjki4krmbp2i6gz83iocg87v	plugin::content-manager.explorer.create	{}	api::tax.tax	{"fields": ["vat"]}	[]	2025-10-17 08:21:12.356	2025-10-17 08:21:12.356	2025-10-17 08:21:12.356	\N	\N	\N
277	e8zyjgly1yfmru27bf9b7ju6	plugin::content-manager.explorer.read	{}	api::tax.tax	{"fields": ["vat"]}	[]	2025-10-17 08:21:12.363	2025-10-17 08:21:12.363	2025-10-17 08:21:12.363	\N	\N	\N
278	ubln25fcem7uykeuk8w8pnlk	plugin::content-manager.explorer.update	{}	api::tax.tax	{"fields": ["vat"]}	[]	2025-10-17 08:21:12.369	2025-10-17 08:21:12.369	2025-10-17 08:21:12.37	\N	\N	\N
279	i8ilob51rb6z28sefnewwt7t	plugin::content-manager.explorer.publish	{}	api::tax.tax	{}	[]	2025-10-17 08:21:12.376	2025-10-17 08:21:12.376	2025-10-17 08:21:12.376	\N	\N	\N
280	ic8q7n9xet1ahdmexbssmc0z	plugin::content-manager.explorer.create	{}	api::terms-of-service.terms-of-service	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-17 08:21:12.388	2025-10-17 08:21:12.388	2025-10-17 08:21:12.388	\N	\N	\N
281	uee04imvcftifnuk2dlj6c7y	plugin::content-manager.explorer.read	{}	api::terms-of-service.terms-of-service	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-17 08:21:12.395	2025-10-17 08:21:12.395	2025-10-17 08:21:12.395	\N	\N	\N
282	btl82phw4x86qvvd1w1alg0r	plugin::content-manager.explorer.update	{}	api::terms-of-service.terms-of-service	{"fields": ["effective_date", "content"], "locales": ["en"]}	[]	2025-10-17 08:21:12.403	2025-10-17 08:21:12.403	2025-10-17 08:21:12.403	\N	\N	\N
283	c5n97v3camqfkm8sj33yickq	plugin::content-manager.explorer.publish	{}	api::terms-of-service.terms-of-service	{"locales": ["en"]}	[]	2025-10-17 08:21:12.421	2025-10-17 08:21:12.421	2025-10-17 08:21:12.422	\N	\N	\N
284	w0ia8xv8yt0b1jflbcltjk3p	plugin::content-manager.explorer.delete	{}	api::addon.addon	{"locales": ["en"]}	[]	2025-10-17 08:23:10.129	2025-10-17 08:23:10.129	2025-10-17 08:23:10.13	\N	\N	\N
285	cxuwt0e1s7sxd4puw327xpxp	plugin::content-manager.explorer.create	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"], "locales": ["en"]}	[]	2025-10-17 08:23:10.146	2025-10-17 08:23:10.146	2025-10-17 08:23:10.146	\N	\N	\N
286	xcqds8tar3xfhpwhphvuq36j	plugin::content-manager.explorer.read	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"], "locales": ["en"]}	[]	2025-10-17 08:23:10.165	2025-10-17 08:23:10.165	2025-10-17 08:23:10.165	\N	\N	\N
287	nbuwyu9t7owet37188gmugep	plugin::content-manager.explorer.update	{}	api::advantage.advantage	{"fields": ["icon_slug", "title", "description"], "locales": ["en"]}	[]	2025-10-17 08:23:10.186	2025-10-17 08:23:10.186	2025-10-17 08:23:10.187	\N	\N	\N
288	aolrqse8ihlbpkyq1wpzw6wg	plugin::content-manager.explorer.delete	{}	api::advantage.advantage	{"locales": ["en"]}	[]	2025-10-17 08:23:10.209	2025-10-17 08:23:10.209	2025-10-17 08:23:10.209	\N	\N	\N
289	f7tetg6xemovm91g3w3v2wl8	plugin::content-manager.explorer.delete	{}	api::coefficient.coefficient	{}	[]	2025-10-17 08:23:10.227	2025-10-17 08:23:10.227	2025-10-17 08:23:10.227	\N	\N	\N
290	plqvvqagu9ivj0lvo18c8jiq	plugin::content-manager.explorer.create	{}	api::contact.contact	{"fields": ["slug", "title", "link"], "locales": ["en"]}	[]	2025-10-17 08:23:10.245	2025-10-17 08:23:10.245	2025-10-17 08:23:10.245	\N	\N	\N
291	rvige9ocpfxrfpont9c5kcux	plugin::content-manager.explorer.read	{}	api::contact.contact	{"fields": ["slug", "title", "link"], "locales": ["en"]}	[]	2025-10-17 08:23:10.256	2025-10-17 08:23:10.256	2025-10-17 08:23:10.256	\N	\N	\N
292	ugebzptxraxfcayqyr8vr1co	plugin::content-manager.explorer.update	{}	api::contact.contact	{"fields": ["slug", "title", "link"], "locales": ["en"]}	[]	2025-10-17 08:23:10.266	2025-10-17 08:23:10.266	2025-10-17 08:23:10.266	\N	\N	\N
293	hvoatpfzk4ns3byzdbqjt799	plugin::content-manager.explorer.delete	{}	api::contact.contact	{"locales": ["en"]}	[]	2025-10-17 08:23:10.276	2025-10-17 08:23:10.276	2025-10-17 08:23:10.277	\N	\N	\N
294	fzoxf0cptdzmwrd67drj1iye	plugin::content-manager.explorer.create	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"], "locales": ["en"]}	[]	2025-10-17 08:23:10.29	2025-10-17 08:23:10.29	2025-10-17 08:23:10.291	\N	\N	\N
295	snjbxf4vudzvoyn098pni4qx	plugin::content-manager.explorer.read	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"], "locales": ["en"]}	[]	2025-10-17 08:23:10.299	2025-10-17 08:23:10.299	2025-10-17 08:23:10.299	\N	\N	\N
296	ccyriwu9r6ecesb28ane4k2z	plugin::content-manager.explorer.update	{}	api::feature.feature	{"fields": ["slug", "title", "image_desktop", "image_mobile", "options"], "locales": ["en"]}	[]	2025-10-17 08:23:10.309	2025-10-17 08:23:10.309	2025-10-17 08:23:10.309	\N	\N	\N
297	aog2ez5ahxi7ntaj8qrz22dd	plugin::content-manager.explorer.delete	{}	api::feature.feature	{"locales": ["en"]}	[]	2025-10-17 08:23:10.322	2025-10-17 08:23:10.322	2025-10-17 08:23:10.322	\N	\N	\N
298	ex6u7m18p9vntfarcwwkka2e	plugin::content-manager.explorer.create	{}	api::feature-option.feature-option	{"fields": ["text"], "locales": ["en"]}	[]	2025-10-17 08:23:10.333	2025-10-17 08:23:10.333	2025-10-17 08:23:10.334	\N	\N	\N
299	aouw2hk6laupgfsukdqxt4q4	plugin::content-manager.explorer.read	{}	api::feature-option.feature-option	{"fields": ["text"], "locales": ["en"]}	[]	2025-10-17 08:23:10.347	2025-10-17 08:23:10.347	2025-10-17 08:23:10.347	\N	\N	\N
300	uulyhp5hjs0lb0hzjraxt4uw	plugin::content-manager.explorer.update	{}	api::feature-option.feature-option	{"fields": ["text"], "locales": ["en"]}	[]	2025-10-17 08:23:10.357	2025-10-17 08:23:10.357	2025-10-17 08:23:10.357	\N	\N	\N
301	z62kjiqlmzblrnn5w076121i	plugin::content-manager.explorer.delete	{}	api::feature-option.feature-option	{"locales": ["en"]}	[]	2025-10-17 08:23:10.367	2025-10-17 08:23:10.367	2025-10-17 08:23:10.367	\N	\N	\N
302	b0fdavw9wb9a9nyowcfw1qnn	plugin::content-manager.explorer.create	{}	api::question.question	{"fields": ["question", "answer"], "locales": ["en"]}	[]	2025-10-17 08:23:10.377	2025-10-17 08:23:10.377	2025-10-17 08:23:10.377	\N	\N	\N
303	suecwjoxcdhwohlsrghx0ako	plugin::content-manager.explorer.read	{}	api::question.question	{"fields": ["question", "answer"], "locales": ["en"]}	[]	2025-10-17 08:23:10.385	2025-10-17 08:23:10.385	2025-10-17 08:23:10.385	\N	\N	\N
304	hs035pksqr9d2xfkyngp4dc5	plugin::content-manager.explorer.update	{}	api::question.question	{"fields": ["question", "answer"], "locales": ["en"]}	[]	2025-10-17 08:23:10.394	2025-10-17 08:23:10.394	2025-10-17 08:23:10.394	\N	\N	\N
305	wgmxd6fs9o5cd9riuxnhdbug	plugin::content-manager.explorer.delete	{}	api::question.question	{"locales": ["en"]}	[]	2025-10-17 08:23:10.404	2025-10-17 08:23:10.404	2025-10-17 08:23:10.404	\N	\N	\N
306	q6hdu3ngp64y68cn88jdmnir	plugin::content-manager.explorer.create	{}	api::review.review	{"fields": ["author", "review"], "locales": ["en"]}	[]	2025-10-17 08:23:10.421	2025-10-17 08:23:10.421	2025-10-17 08:23:10.421	\N	\N	\N
307	o7790adm7clbyviumgfc1g1g	plugin::content-manager.explorer.read	{}	api::review.review	{"fields": ["author", "review"], "locales": ["en"]}	[]	2025-10-17 08:23:10.433	2025-10-17 08:23:10.433	2025-10-17 08:23:10.434	\N	\N	\N
308	migxd7d2swkvgerrk2h0yn1l	plugin::content-manager.explorer.update	{}	api::review.review	{"fields": ["author", "review"], "locales": ["en"]}	[]	2025-10-17 08:23:10.445	2025-10-17 08:23:10.445	2025-10-17 08:23:10.445	\N	\N	\N
309	tagky5gphmvg2j8egos1jyzt	plugin::content-manager.explorer.delete	{}	api::review.review	{"locales": ["en"]}	[]	2025-10-17 08:23:10.462	2025-10-17 08:23:10.462	2025-10-17 08:23:10.462	\N	\N	\N
310	wcy0g1nhp9nchfvqh5d0w6q6	plugin::content-manager.explorer.delete	{}	api::service.service	{"locales": ["en"]}	[]	2025-10-17 08:23:10.472	2025-10-17 08:23:10.472	2025-10-17 08:23:10.473	\N	\N	\N
312	o854m65sd6hxeymvryc8wvft	plugin::content-manager.explorer.read	{}	api::home-page.home-page	{"fields": ["price_from", "hero_background"], "locales": ["en"]}	[]	2025-10-17 08:23:10.491	2025-10-31 18:15:08.815	2025-10-17 08:23:10.491	\N	\N	\N
313	nk6f67wu8sxby0j2rlvzdut5	plugin::content-manager.explorer.update	{}	api::home-page.home-page	{"fields": ["price_from", "hero_background"], "locales": ["en"]}	[]	2025-10-17 08:23:10.499	2025-10-31 18:15:08.815	2025-10-17 08:23:10.5	\N	\N	\N
314	nci6ora6ng4n639mbym3xxn3	plugin::content-manager.explorer.create	{}	api::home-page.home-page	{"fields": ["price_from", "hero_background"], "locales": ["en"]}	[]	2025-10-31 18:15:08.57	2025-10-31 18:15:08.57	2025-10-31 18:15:08.573	\N	\N	\N
315	o1rapwh3t56jnvr6cub01bo5	plugin::content-manager.explorer.read	{}	api::home-page.home-page	{"fields": ["price_from", "hero_background"], "locales": ["en"]}	[]	2025-10-31 18:15:08.598	2025-10-31 18:15:08.598	2025-10-31 18:15:08.599	\N	\N	\N
316	z6kk56dhwzugxy576s10s6qu	plugin::content-manager.explorer.update	{}	api::home-page.home-page	{"fields": ["price_from", "hero_background"], "locales": ["en"]}	[]	2025-10-31 18:15:08.624	2025-10-31 18:15:08.624	2025-10-31 18:15:08.625	\N	\N	\N
311	v7gd4eysptq9dsheblvasdn9	plugin::content-manager.explorer.create	{}	api::home-page.home-page	{"fields": ["price_from", "hero_background"], "locales": ["en"]}	[]	2025-10-17 08:23:10.482	2025-10-31 18:15:08.815	2025-10-17 08:23:10.482	\N	\N	\N
317	nnzfdnzqdai0n3hjk3qn88wb	plugin::content-manager.explorer.create	{}	api::cookie-policy.cookie-policy	{"fields": ["effective_date", "content"]}	[]	2025-12-15 21:48:02.556	2025-12-15 21:48:02.556	2025-12-15 21:48:02.559	\N	\N	\N
318	zliwxlhesagcuv0j8eu0mn7k	plugin::content-manager.explorer.read	{}	api::cookie-policy.cookie-policy	{"fields": ["effective_date", "content"]}	[]	2025-12-15 21:48:02.59	2025-12-15 21:48:02.59	2025-12-15 21:48:02.591	\N	\N	\N
319	qzqfhzw1s3gq5ajbc2y6tv0e	plugin::content-manager.explorer.update	{}	api::cookie-policy.cookie-policy	{"fields": ["effective_date", "content"]}	[]	2025-12-15 21:48:02.607	2025-12-15 21:48:02.607	2025-12-15 21:48:02.608	\N	\N	\N
320	cble64wqyub0smzp07q9te2g	plugin::content-manager.explorer.delete	{}	api::cookie-policy.cookie-policy	{}	[]	2025-12-15 21:48:02.624	2025-12-15 21:48:02.624	2025-12-15 21:48:02.625	\N	\N	\N
321	v4x34u7xexln6xqbxn43mdew	plugin::content-manager.explorer.publish	{}	api::cookie-policy.cookie-policy	{}	[]	2025-12-15 21:48:02.646	2025-12-15 21:48:02.646	2025-12-15 21:48:02.646	\N	\N	\N
\.


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
36	36	2	36
37	37	2	37
38	38	2	38
39	39	2	39
40	40	2	40
41	41	2	41
42	42	3	1
43	43	3	2
44	44	3	3
45	45	3	4
46	46	3	5
47	47	3	6
48	48	3	7
49	49	3	8
50	50	3	9
51	51	3	10
52	52	3	11
53	53	3	12
54	54	3	13
55	55	3	14
56	56	3	15
57	57	3	16
58	58	3	17
59	59	3	18
60	60	3	19
61	61	3	20
62	62	3	21
70	70	3	29
71	71	3	30
72	72	3	31
73	73	3	32
74	74	3	33
75	75	3	34
76	76	1	1
77	77	1	2
79	79	1	4
80	80	1	5
82	82	1	7
83	83	1	8
84	84	1	9
85	85	1	10
87	87	1	12
88	88	1	13
90	90	1	15
91	91	1	16
92	92	1	17
93	93	1	18
95	95	1	20
96	96	1	21
98	98	1	23
99	99	1	24
100	100	1	25
101	101	1	26
102	102	1	27
103	103	1	28
104	104	1	29
105	105	1	30
106	106	1	31
107	107	1	32
108	108	1	33
109	109	1	34
110	110	1	35
111	111	1	36
112	112	1	37
113	113	1	38
114	114	1	39
115	115	1	40
116	116	1	41
117	117	1	42
118	118	1	43
119	119	1	44
120	120	1	45
121	121	1	46
122	122	1	47
123	123	1	48
124	124	1	49
125	125	1	50
126	126	1	51
127	127	1	52
128	128	1	53
129	129	1	54
130	130	1	55
131	131	1	56
132	132	1	57
133	133	1	58
134	134	1	59
135	135	1	60
136	136	1	61
137	137	1	62
138	138	1	63
140	140	1	64
141	141	1	65
142	142	1	66
143	143	1	67
144	144	1	68
145	145	1	69
146	146	1	70
147	147	1	71
148	148	1	72
149	149	1	73
150	150	1	74
151	151	1	75
152	152	1	76
153	153	1	77
154	154	1	78
155	155	1	79
156	156	1	80
157	157	1	81
158	158	1	82
159	159	1	83
160	160	1	84
161	161	1	85
162	162	1	86
163	163	1	87
164	164	1	88
165	165	1	89
166	166	1	90
167	167	1	91
168	168	1	92
169	169	1	93
171	171	1	95
172	172	1	96
174	174	1	98
175	175	1	99
178	178	1	102
180	180	1	104
181	181	1	105
183	183	1	107
184	184	1	108
187	187	1	111
189	189	1	113
190	190	1	114
192	192	1	116
193	193	1	117
196	196	1	120
197	197	1	121
198	198	1	122
199	199	1	123
200	200	1	124
202	202	1	126
203	203	1	127
204	204	1	128
205	205	1	129
206	206	1	130
207	207	1	131
209	209	1	133
210	210	1	134
212	212	1	136
214	214	1	138
216	216	1	140
217	217	1	141
218	218	1	142
219	219	1	143
220	220	1	144
221	221	1	145
222	222	1	146
223	223	1	147
224	224	1	148
225	225	2	42
226	226	2	43
227	227	2	44
228	228	2	45
229	229	2	46
230	230	2	47
231	231	2	48
235	235	2	52
236	236	2	53
237	237	2	54
238	238	2	55
239	239	2	56
243	243	2	60
247	247	2	64
251	251	2	68
255	255	2	72
259	259	2	76
260	260	2	77
261	261	2	78
262	262	2	79
263	263	2	80
267	267	2	84
268	268	2	85
269	269	2	86
270	270	2	87
271	271	2	88
272	272	2	89
273	273	2	90
274	274	2	91
275	275	2	92
276	276	2	93
277	277	2	94
278	278	2	95
279	279	2	96
280	280	2	97
281	281	2	98
282	282	2	99
283	283	2	100
284	284	2	101
285	285	2	102
286	286	2	103
287	287	2	104
288	288	2	105
289	289	2	106
290	290	2	107
291	291	2	108
292	292	2	109
293	293	2	110
294	294	2	111
295	295	2	112
296	296	2	113
297	297	2	114
298	298	2	115
299	299	2	116
300	300	2	117
301	301	2	118
302	302	2	119
303	303	2	120
304	304	2	121
305	305	2	122
306	306	2	123
307	307	2	124
308	308	2	125
309	309	2	126
310	310	2	127
311	311	2	128
312	312	2	129
313	313	2	130
314	314	1	149
315	315	1	150
316	316	1	151
317	317	1	152
318	318	1	153
319	319	1	154
320	320	1	155
321	321	1	156
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	v3cbe5scewrln2p2wxy3dqcr	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2025-09-27 03:20:14.786	2025-09-27 03:20:14.786	2025-09-27 03:20:14.787	\N	\N	\N
3	hzate9fp4yhckhnjp1lo3456	Author	strapi-author	Authors can manage the content they have created.	2025-09-27 03:20:15.196	2025-09-27 03:20:15.196	2025-09-27 03:20:15.196	\N	\N	\N
2	fmauxhzj2w2jwt6m999oxgvv	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2025-09-27 03:20:15.009	2025-10-17 08:23:09.676	2025-09-27 03:20:15.009	\N	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	edos90et06t0kzdnhb6rvv6o	Admin	\N	admin	admin@newpage.software	$2a$10$9KLRPqQx/rbcPa4.GtWN2O6U2O4KrFqTHEK72aGkeEXvuyXQ9vOJ.	\N	\N	t	f	\N	2025-09-27 01:03:22.228	2025-09-27 01:04:56.364	2025-09-27 01:03:22.233	\N	\N	\N
2	fkju5qcg235wyovtmvyc276u	Maksym		\N	kwest.gts@gmail.com	$2a$10$EwBdiT2W5UvwFI4oLPb/meSjwTHHaYeM5vReV3dahCQ9vjFqPYia2	\N	\N	t	f	\N	2025-10-13 21:12:41.611	2025-10-13 21:13:23.552	2025-10-13 21:12:41.612	\N	\N	\N
3	d013y41jtiy3lunkh0pkbdv3	Andrii		\N	vorobets.gts@gmail.com	$2a$10$BRRXArgOnXSwz3y7P0HZa.WKyWNFfD7hOyr1rg3WMLctrzueNmDiO	\N	\N	t	f	\N	2025-10-16 14:54:11.56	2025-10-16 14:54:42.548	2025-10-16 14:54:11.561	\N	\N	\N
\.


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
3	2	3	1	1
4	2	2	2	1
5	3	2	1	2
6	3	3	2	2
\.


--
-- Data for Name: advantages; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.advantages (id, document_id, icon_slug, title, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	zlyhwc4w280zauo225lvi3oa	receipt	Transparent pricing	No hidden fees, we work on a mutual agreement for services.	2025-10-13 20:37:04.075	2025-10-13 20:37:04.075	\N	1	1	en
2	zlyhwc4w280zauo225lvi3oa	receipt	Transparent pricing	No hidden fees, we work on a mutual agreement for services.	2025-10-13 20:37:04.075	2025-10-13 20:37:04.075	2025-10-13 20:37:04.097	1	1	en
3	c4xr9fhs7ko56nqb5al2vvbr	user-check	Qualified staff 	Trained, background-checked, insured.	2025-10-13 20:37:42.899	2025-10-13 20:37:42.899	\N	1	1	en
4	c4xr9fhs7ko56nqb5al2vvbr	user-check	Qualified staff 	Trained, background-checked, insured.	2025-10-13 20:37:42.899	2025-10-13 20:37:42.899	2025-10-13 20:37:42.924	1	1	en
5	k2b16yif1wtnkkpyp30w2sq5	calendar-clock	Flexible	You can reschedule free up to 12h before.	2025-10-13 20:38:07.408	2025-10-13 20:38:07.408	\N	1	1	en
6	k2b16yif1wtnkkpyp30w2sq5	calendar-clock	Flexible	You can reschedule free up to 12h before.	2025-10-13 20:38:07.408	2025-10-13 20:38:07.408	2025-10-13 20:38:07.433	1	1	en
7	e0fywj4ghxb3r6l8u8qoakj5	thumbs-up	Everything provided	Cleaners bring supplies & tools (vacuum on request)	2025-10-13 20:38:26.191	2025-10-13 20:38:26.191	\N	1	1	en
8	e0fywj4ghxb3r6l8u8qoakj5	thumbs-up	Everything provided	Cleaners bring supplies & tools (vacuum on request)	2025-10-13 20:38:26.191	2025-10-13 20:38:26.191	2025-10-13 20:38:26.217	1	1	en
\.


--
-- Data for Name: coefficients; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.coefficients (id, document_id, slug, coefficient, applies_to, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
11	s9esy6qkfwcc8elvzbysjbab	discount-monthly	0.90	total	2025-10-13 23:24:05.707	2025-10-13 23:24:05.707	\N	1	1	\N
12	s9esy6qkfwcc8elvzbysjbab	discount-monthly	0.90	total	2025-10-13 23:24:05.707	2025-10-13 23:24:05.707	2025-10-13 23:24:05.734	1	1	\N
3	rvwnk77lwrsexuipiuzbfqbp	discount-weekly	0.80	total	2025-10-13 20:38:49.413	2025-10-13 23:24:11.779	\N	1	1	\N
13	rvwnk77lwrsexuipiuzbfqbp	discount-weekly	0.80	total	2025-10-13 20:38:49.413	2025-10-13 23:24:11.779	2025-10-13 23:24:11.807	1	1	\N
5	kvgorjqh1693g2rufjpckwrg	discount-biweekly	0.85	total	2025-10-13 20:39:00.737	2025-10-13 23:24:21.89	\N	1	1	\N
15	kvgorjqh1693g2rufjpckwrg	discount-biweekly	0.85	total	2025-10-13 20:39:00.737	2025-10-13 23:24:21.89	2025-10-13 23:24:21.911	1	1	\N
16	b1dpot2n1vzadakcgnsmok5r	house	1.20	base	2025-10-17 09:59:17.406	2025-10-17 09:59:17.406	\N	1	1	\N
17	b1dpot2n1vzadakcgnsmok5r	house	1.20	base	2025-10-17 09:59:17.406	2025-10-17 09:59:17.406	2025-10-17 09:59:17.429	1	1	\N
18	nwzvgsqiq6dy2b6u6y54deqk	suburbs	1.30	base	2025-10-17 09:59:30.628	2025-10-17 09:59:30.628	\N	1	1	\N
19	nwzvgsqiq6dy2b6u6y54deqk	suburbs	1.30	base	2025-10-17 09:59:30.628	2025-10-17 09:59:30.628	2025-10-17 09:59:30.647	1	1	\N
1	m5g2rnensaisri33dyd226o7	discount-once	1.00	total	2025-10-13 20:38:35.503	2025-10-25 14:17:00.676	\N	1	1	\N
24	m5g2rnensaisri33dyd226o7	discount-once	1.00	total	2025-10-13 20:38:35.503	2025-10-25 14:17:00.676	2025-10-25 14:17:00.717	1	1	\N
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.contacts (id, document_id, title, link, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, slug) FROM stdin;
1	jjtrnpvkiqyprveicxb4xwdj	Telegram	https://t.me	2025-11-09 20:16:43.111	2025-11-09 20:16:43.111	\N	1	1	en	telegram
2	jjtrnpvkiqyprveicxb4xwdj	Telegram	https://t.me	2025-11-09 20:16:43.111	2025-11-09 20:16:43.111	2025-11-09 20:16:43.148	1	1	en	telegram
\.


--
-- Data for Name: cookie_policies; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.cookie_policies (id, document_id, effective_date, content, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	ku9nncs66lo532bvxxzxl5ve	DATE	1. What Are Cookies\nCookies are small text files placed on your device when you visit our Site. They help us improve the Site’s functionality, analyze usage, and remember your preferences.\n\n2. How We Use Cookies\nWe use cookies (and similar technologies) for:\n  • Essential functionality (e.g., keeping you logged in, maintaining your session)\n  • Analytics — to understand how users navigate our Site, improve user experience, and troubleshoot issues\n  • (Optional) Marketing — only if you opt in explicitly (e.g., for newsletters, promotional offers)\n\n3. Consent & Control\nWhen you first visit our Site, we will request your consent to use non-essential cookies (analytics, marketing). Essential cookies required for the Site to work will be used regardless, but you will be informed.\nYou may withdraw consent at any time by clearing cookies or adjusting your browser settings. However, that may affect Site functionality.\n\n4. Third-Party Cookies & Services\nWe may use third-party services (e.g., analytics providers) that set their own cookies. These third parties may collect and process information as per their policies. We recommend reviewing their privacy/cookie policies before consenting.\n\n5. Changes to Cookie Policy\nWe may update this Cookie Policy over time. We will notify you of material changes (e.g., via banner, notification, or updated “Effective Date”). Continued use of our Site after changes means you accept the revised policy. 	2025-12-15 21:49:29.92	2025-12-15 21:49:29.92	\N	1	1	\N
2	ku9nncs66lo532bvxxzxl5ve	DATE	1. What Are Cookies\nCookies are small text files placed on your device when you visit our Site. They help us improve the Site’s functionality, analyze usage, and remember your preferences.\n\n2. How We Use Cookies\nWe use cookies (and similar technologies) for:\n  • Essential functionality (e.g., keeping you logged in, maintaining your session)\n  • Analytics — to understand how users navigate our Site, improve user experience, and troubleshoot issues\n  • (Optional) Marketing — only if you opt in explicitly (e.g., for newsletters, promotional offers)\n\n3. Consent & Control\nWhen you first visit our Site, we will request your consent to use non-essential cookies (analytics, marketing). Essential cookies required for the Site to work will be used regardless, but you will be informed.\nYou may withdraw consent at any time by clearing cookies or adjusting your browser settings. However, that may affect Site functionality.\n\n4. Third-Party Cookies & Services\nWe may use third-party services (e.g., analytics providers) that set their own cookies. These third parties may collect and process information as per their policies. We recommend reviewing their privacy/cookie policies before consenting.\n\n5. Changes to Cookie Policy\nWe may update this Cookie Policy over time. We will notify you of material changes (e.g., via banner, notification, or updated “Effective Date”). Continued use of our Site after changes means you accept the revised policy. 	2025-12-15 21:49:29.92	2025-12-15 21:49:29.92	2025-12-15 21:49:29.952	1	1	\N
\.


--
-- Data for Name: feature_options; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.feature_options (id, document_id, text, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	okgmlkbpnt6wby0gpuya14c9	Dust-free surfaces	2025-10-13 20:39:51.752	2025-10-13 20:39:51.752	\N	1	1	en
2	okgmlkbpnt6wby0gpuya14c9	Dust-free surfaces	2025-10-13 20:39:51.752	2025-10-13 20:39:51.752	2025-10-13 20:39:51.78	1	1	en
3	y8yxbpdxz9dkg5qupgmvjudu	Shoes and belongings in order	2025-10-13 20:39:59.279	2025-10-13 20:39:59.279	\N	1	1	en
4	y8yxbpdxz9dkg5qupgmvjudu	Shoes and belongings in order	2025-10-13 20:39:59.279	2025-10-13 20:39:59.279	2025-10-13 20:39:59.303	1	1	en
5	kgk7nw3w7wlzo4svreu7p4xk	Freshly made beds	2025-10-13 20:40:07.103	2025-10-13 20:40:07.103	\N	1	1	en
6	kgk7nw3w7wlzo4svreu7p4xk	Freshly made beds	2025-10-13 20:40:07.103	2025-10-13 20:40:07.103	2025-10-13 20:40:07.129	1	1	en
7	gzk8c6galssx6vc040o4ax58	Window sills, baseboards, handles, doors, switches	2025-10-13 20:40:14.087	2025-10-13 20:40:14.087	\N	1	1	en
8	gzk8c6galssx6vc040o4ax58	Window sills, baseboards, handles, doors, switches	2025-10-13 20:40:14.087	2025-10-13 20:40:14.087	2025-10-13 20:40:14.108	1	1	en
9	rkv38t5tnoz1emjfroeo652f	Vacuumed and mopped floors	2025-10-13 20:40:20.636	2025-10-13 20:40:20.636	\N	1	1	en
10	rkv38t5tnoz1emjfroeo652f	Vacuumed and mopped floors	2025-10-13 20:40:20.636	2025-10-13 20:40:20.636	2025-10-13 20:40:20.66	1	1	en
11	qdi45cfrmncpnr5dflhmmi8w	Crystal-clear mirrors	2025-10-13 20:40:27.965	2025-10-13 20:40:27.965	\N	1	1	en
12	qdi45cfrmncpnr5dflhmmi8w	Crystal-clear mirrors	2025-10-13 20:40:27.965	2025-10-13 20:40:27.965	2025-10-13 20:40:27.983	1	1	en
13	fvsdhl6k214ixpq3f45hhr9u	Trash removed	2025-10-13 20:40:36.576	2025-10-13 20:40:36.576	\N	1	1	en
14	fvsdhl6k214ixpq3f45hhr9u	Trash removed	2025-10-13 20:40:36.576	2025-10-13 20:40:36.576	2025-10-13 20:40:36.6	1	1	en
15	kzuqrq4m5yw93z6gjucn5voe	Appliance interiors available as an add-on 	2025-10-13 20:40:44.776	2025-10-13 20:40:44.776	\N	1	1	en
16	kzuqrq4m5yw93z6gjucn5voe	Appliance interiors available as an add-on 	2025-10-13 20:40:44.776	2025-10-13 20:40:44.776	2025-10-13 20:40:44.793	1	1	en
17	iopsm5okniiikles772b760l	Exterior surfaces and furniture cleaned	2025-10-13 20:40:51.492	2025-10-13 20:40:51.492	\N	1	1	en
18	iopsm5okniiikles772b760l	Exterior surfaces and furniture cleaned	2025-10-13 20:40:51.492	2025-10-13 20:40:51.492	2025-10-13 20:40:51.511	1	1	en
19	ti7igzg0w78eoatxq210vc8s	Stove, sink, and countertop washed	2025-10-13 20:40:59.403	2025-10-13 20:40:59.403	\N	1	1	en
20	ti7igzg0w78eoatxq210vc8s	Stove, sink, and countertop washed	2025-10-13 20:40:59.403	2025-10-13 20:40:59.403	2025-10-13 20:40:59.418	1	1	en
21	ti8krjpc2zxf8m2y2p9qiuq6	Tiles wiped down	2025-10-13 20:41:08.833	2025-10-13 20:41:08.833	\N	1	1	en
22	ti8krjpc2zxf8m2y2p9qiuq6	Tiles wiped down	2025-10-13 20:41:08.833	2025-10-13 20:41:08.833	2025-10-13 20:41:08.856	1	1	en
23	tb03dovnlg9mvam87gq06g5e	Window sills, baseboards, handles, doors, switches cleaned	2025-10-13 20:41:16.121	2025-10-13 20:41:16.121	\N	1	1	en
24	tb03dovnlg9mvam87gq06g5e	Window sills, baseboards, handles, doors, switches cleaned	2025-10-13 20:41:16.121	2025-10-13 20:41:16.121	2025-10-13 20:41:16.138	1	1	en
25	lno6bq3r72jrng45olrqall8	Floors mopped	2025-10-13 20:41:23.362	2025-10-13 20:41:23.362	\N	1	1	en
26	lno6bq3r72jrng45olrqall8	Floors mopped	2025-10-13 20:41:23.362	2025-10-13 20:41:23.362	2025-10-13 20:41:23.383	1	1	en
27	tyuipantekbsynl2fcbrcobb	Chairs arranged, tidied up	2025-10-13 20:41:30.52	2025-10-13 20:41:30.52	\N	1	1	en
28	tyuipantekbsynl2fcbrcobb	Chairs arranged, tidied up	2025-10-13 20:41:30.52	2025-10-13 20:41:30.52	2025-10-13 20:41:30.552	1	1	en
29	z06k2umettzwv77wmbeg6s0u	Small amount of dishes washed (larger loads available as add-on)	2025-10-13 20:41:37.194	2025-10-13 20:41:37.194	\N	1	1	en
30	z06k2umettzwv77wmbeg6s0u	Small amount of dishes washed (larger loads available as add-on)	2025-10-13 20:41:37.194	2025-10-13 20:41:37.194	2025-10-13 20:41:37.21	1	1	en
31	klax9cer3akwrwvtk6volw3m	Trash removed	2025-10-13 20:41:45.187	2025-10-13 20:41:45.187	\N	1	1	en
32	klax9cer3akwrwvtk6volw3m	Trash removed	2025-10-13 20:41:45.187	2025-10-13 20:41:45.187	2025-10-13 20:41:45.208	1	1	en
33	h2lilhpbw9sjx56ns1vvyal1	Floors mopped	2025-10-13 20:41:51.832	2025-10-13 20:41:51.832	\N	1	1	en
34	h2lilhpbw9sjx56ns1vvyal1	Floors mopped	2025-10-13 20:41:51.832	2025-10-13 20:41:51.832	2025-10-13 20:41:51.851	1	1	en
35	vy5ilwf39lds9v3vpzxg0t61	Clothes folded or hung neatly	2025-10-13 20:41:59.252	2025-10-13 20:41:59.252	\N	1	1	en
36	vy5ilwf39lds9v3vpzxg0t61	Clothes folded or hung neatly	2025-10-13 20:41:59.252	2025-10-13 20:41:59.252	2025-10-13 20:41:59.266	1	1	en
37	au9ncimj2key3sp27dz3iafz	Shoes arranged	2025-10-13 20:42:09.865	2025-10-13 20:42:09.865	\N	1	1	en
38	au9ncimj2key3sp27dz3iafz	Shoes arranged	2025-10-13 20:42:09.865	2025-10-13 20:42:09.865	2025-10-13 20:42:09.88	1	1	en
39	yfei3m9t0mho1t88rzs90il8	All surfaces wiped	2025-10-13 20:42:43.056	2025-10-13 20:42:43.056	\N	1	1	en
40	yfei3m9t0mho1t88rzs90il8	All surfaces wiped	2025-10-13 20:42:43.056	2025-10-13 20:42:43.056	2025-10-13 20:42:43.08	1	1	en
41	s3r30bfnqeblwb9vkwpr1jvv	Toilet cleaned and disinfected	2025-10-13 20:42:50.555	2025-10-13 20:42:50.555	\N	1	1	en
42	s3r30bfnqeblwb9vkwpr1jvv	Toilet cleaned and disinfected	2025-10-13 20:42:50.555	2025-10-13 20:42:50.555	2025-10-13 20:42:50.577	1	1	en
43	fqxd32arl2ecwr0as25ytrtj	Bathtub, faucets, or shower cabin cleaned	2025-10-13 20:43:00.186	2025-10-13 20:43:00.186	\N	1	1	en
44	fqxd32arl2ecwr0as25ytrtj	Bathtub, faucets, or shower cabin cleaned	2025-10-13 20:43:00.186	2025-10-13 20:43:00.186	2025-10-13 20:43:00.211	1	1	en
45	f8ljb3xgwj8asetwc4opuvxk	Sink washed	2025-10-13 20:43:07.084	2025-10-13 20:43:07.084	\N	1	1	en
46	f8ljb3xgwj8asetwc4opuvxk	Sink washed	2025-10-13 20:43:07.084	2025-10-13 20:43:07.084	2025-10-13 20:43:07.114	1	1	en
47	uw1du1e8o0cmv76t031lkh3l	Mirrors polished	2025-10-13 20:43:16.247	2025-10-13 20:43:16.247	\N	1	1	en
48	uw1du1e8o0cmv76t031lkh3l	Mirrors polished	2025-10-13 20:43:16.247	2025-10-13 20:43:16.247	2025-10-13 20:43:16.267	1	1	en
49	z1z0vsdd8e60hyn3pwbnvk45	Floors and baseboards cleaned, carpets vacuumed	2025-10-13 20:43:22.849	2025-10-13 20:43:22.849	\N	1	1	en
50	z1z0vsdd8e60hyn3pwbnvk45	Floors and baseboards cleaned, carpets vacuumed	2025-10-13 20:43:22.849	2025-10-13 20:43:22.849	2025-10-13 20:43:22.87	1	1	en
53	lhmr1z1zkve8fq8jc3e0d1rb	Items neatly arranged	2025-10-13 20:44:05.455	2025-10-13 20:44:05.455	\N	1	1	en
54	lhmr1z1zkve8fq8jc3e0d1rb	Items neatly arranged	2025-10-13 20:44:05.455	2025-10-13 20:44:05.455	2025-10-13 20:44:05.483	1	1	en
55	vxkkgzfw5bj4wu4ohxcf7mf3	Mirrors wiped	2025-10-31 16:42:43.207	2025-10-31 16:42:57.942	\N	1	1	en
57	vxkkgzfw5bj4wu4ohxcf7mf3	Mirrors wiped	2025-10-31 16:42:43.207	2025-10-31 16:42:57.942	2025-10-31 16:42:58.047	1	1	en
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.features (id, document_id, slug, title, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
5	bsxnr58fkc0n9xjh68pn4fyi	hallway	Hallway / Entry	2025-10-13 20:50:21.271	2025-10-31 16:43:42.991	\N	1	1	en
9	bsxnr58fkc0n9xjh68pn4fyi	hallway	Hallway / Entry	2025-10-13 20:50:21.271	2025-10-31 16:43:42.991	2025-10-31 16:43:43.142	1	1	en
7	lt6qb26eh25zzn8qgsts5p0e	bathroom	Bathroom	2025-10-13 20:51:38.044	2025-10-31 16:44:06.858	\N	1	1	en
10	lt6qb26eh25zzn8qgsts5p0e	bathroom	Bathroom	2025-10-13 20:51:38.044	2025-10-31 16:44:06.858	2025-10-31 16:44:06.949	1	1	en
3	alvoqj0u2k89y6buvnkj4x0o	kitchen	Kitchen	2025-10-13 20:49:19.83	2025-10-31 16:44:40.817	\N	1	1	en
11	alvoqj0u2k89y6buvnkj4x0o	kitchen	Kitchen	2025-10-13 20:49:19.83	2025-10-31 16:44:40.817	2025-10-31 16:44:40.904	1	1	en
1	nqc6gr7qhn5d2gqj12jnjctt	room	Rooms	2025-10-13 20:47:55.225	2025-10-31 16:45:35.893	\N	1	1	en
12	nqc6gr7qhn5d2gqj12jnjctt	room	Rooms	2025-10-13 20:47:55.225	2025-10-31 16:45:35.893	2025-10-31 16:45:35.996	1	1	en
\.


--
-- Data for Name: features_options_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.features_options_lnk (id, feature_id, feature_option_id, feature_option_ord) FROM stdin;
1	1	1	0
2	1	3	1
3	1	5	2
4	1	7	3
5	1	9	4
6	1	11	5
7	1	13	6
15	3	15	0
16	3	17	1
17	3	19	2
18	3	21	3
19	3	23	4
20	3	25	5
21	3	27	6
22	3	29	7
39	7	39	0
40	7	41	1
41	7	43	2
42	7	45	3
43	7	47	4
44	7	49	5
46	7	53	7
31	5	31	1
32	5	25	2
33	5	35	3
34	5	37	5
55	5	55	4
56	9	32	1
57	9	26	2
58	9	36	3
59	9	57	4
60	9	38	5
61	10	40	1
62	10	42	2
63	10	44	3
64	10	46	4
65	10	48	5
66	10	50	6
67	10	54	7
68	11	16	1
69	11	18	2
70	11	20	3
71	11	22	4
72	11	24	5
73	11	26	6
74	11	28	7
75	11	30	8
76	12	2	1
77	12	4	2
78	12	6	3
79	12	8	4
80	12	10	5
81	12	12	6
82	12	14	7
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
13	e9ibm2tcisguety9rewu7dkd	bathroom_mobile.png	Bathroom	Bathroom	936	624	{"small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_bathroom_mobile_9bd40c1955.png", "hash": "small_bathroom_mobile_9bd40c1955", "mime": "image/png", "name": "small_bathroom_mobile.png", "path": null, "size": 356.91, "width": 500, "height": 333, "sizeInBytes": 356909}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_bathroom_mobile_9bd40c1955.png", "hash": "medium_bathroom_mobile_9bd40c1955", "mime": "image/png", "name": "medium_bathroom_mobile.png", "path": null, "size": 756.99, "width": 750, "height": 500, "sizeInBytes": 756989}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_bathroom_mobile_9bd40c1955.png", "hash": "thumbnail_bathroom_mobile_9bd40c1955", "mime": "image/png", "name": "thumbnail_bathroom_mobile.png", "path": null, "size": 91.43, "width": 234, "height": 156, "sizeInBytes": 91425}}	bathroom_mobile_9bd40c1955	.png	image/png	213.39	https://esg-cms-prod.fra1.digitaloceanspaces.com/bathroom_mobile_9bd40c1955.png	\N	aws-s3	\N	/1/2	2025-10-31 14:51:21.552	2025-10-31 15:37:40.36	2025-10-31 14:51:21.554	1	1	\N
14	broq3fpp68wdkuwxdswu9df2	bathroom_desktop.png	Bathroom	Bathroom	1848	1232	{"large": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/large_bathroom_desktop_fa225ac8a0.png", "hash": "large_bathroom_desktop_fa225ac8a0", "mime": "image/png", "name": "large_bathroom_desktop.png", "path": null, "size": 1316.49, "width": 1000, "height": 667, "sizeInBytes": 1316485}, "small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_bathroom_desktop_fa225ac8a0.png", "hash": "small_bathroom_desktop_fa225ac8a0", "mime": "image/png", "name": "small_bathroom_desktop.png", "path": null, "size": 359.03, "width": 500, "height": 333, "sizeInBytes": 359026}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_bathroom_desktop_fa225ac8a0.png", "hash": "medium_bathroom_desktop_fa225ac8a0", "mime": "image/png", "name": "medium_bathroom_desktop.png", "path": null, "size": 763.06, "width": 750, "height": 500, "sizeInBytes": 763060}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_bathroom_desktop_fa225ac8a0.png", "hash": "thumbnail_bathroom_desktop_fa225ac8a0", "mime": "image/png", "name": "thumbnail_bathroom_desktop.png", "path": null, "size": 93.42, "width": 234, "height": 156, "sizeInBytes": 93424}}	bathroom_desktop_fa225ac8a0	.png	image/png	756.92	https://esg-cms-prod.fra1.digitaloceanspaces.com/bathroom_desktop_fa225ac8a0.png	\N	aws-s3	\N	/1/2	2025-10-31 15:36:07.815	2025-10-31 15:37:45.474	2025-10-31 15:36:07.817	1	1	\N
16	xa60f1x4qnk1fb8zyv6qssn1	hallway_desktop.png	Hallway	Hallway	2464	1662	{"large": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/large_hallway_desktop_07ea251d8e.png", "hash": "large_hallway_desktop_07ea251d8e", "mime": "image/png", "name": "large_hallway_desktop.png", "path": null, "size": 987.22, "width": 1000, "height": 675, "sizeInBytes": 987220}, "small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_hallway_desktop_07ea251d8e.png", "hash": "small_hallway_desktop_07ea251d8e", "mime": "image/png", "name": "small_hallway_desktop.png", "path": null, "size": 292.45, "width": 500, "height": 337, "sizeInBytes": 292453}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_hallway_desktop_07ea251d8e.png", "hash": "medium_hallway_desktop_07ea251d8e", "mime": "image/png", "name": "medium_hallway_desktop.png", "path": null, "size": 589.15, "width": 750, "height": 506, "sizeInBytes": 589146}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_hallway_desktop_07ea251d8e.png", "hash": "thumbnail_hallway_desktop_07ea251d8e", "mime": "image/png", "name": "thumbnail_hallway_desktop.png", "path": null, "size": 77.75, "width": 231, "height": 156, "sizeInBytes": 77751}}	hallway_desktop_07ea251d8e	.png	image/png	1154.12	https://esg-cms-prod.fra1.digitaloceanspaces.com/hallway_desktop_07ea251d8e.png	\N	aws-s3	\N	/1/4	2025-10-31 16:05:13.235	2025-10-31 16:31:39.223	2025-10-31 16:05:13.236	1	1	\N
15	sb4hfdvuvyh88yegv5fpf5j9	hallway_mobile.png	Hallway	Hallway	936	624	{"small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_hallway_mobile_ca49571850.png", "hash": "small_hallway_mobile_ca49571850", "mime": "image/png", "name": "small_hallway_mobile.png", "path": null, "size": 283.1, "width": 500, "height": 333, "sizeInBytes": 283101}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_hallway_mobile_ca49571850.png", "hash": "medium_hallway_mobile_ca49571850", "mime": "image/png", "name": "medium_hallway_mobile.png", "path": null, "size": 591, "width": 750, "height": 500, "sizeInBytes": 590996}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_hallway_mobile_ca49571850.png", "hash": "thumbnail_hallway_mobile_ca49571850", "mime": "image/png", "name": "thumbnail_hallway_mobile.png", "path": null, "size": 76.56, "width": 234, "height": 156, "sizeInBytes": 76558}}	hallway_mobile_ca49571850	.png	image/png	197.19	https://esg-cms-prod.fra1.digitaloceanspaces.com/hallway_mobile_ca49571850.png	\N	aws-s3	\N	/1/4	2025-10-31 15:43:09.758	2025-10-31 16:43:38.117	2025-10-31 15:43:09.759	1	1	\N
18	i6hi9peusqju8pxsjdrj52zr	kitchen_desktop.png	Kitchen	Kitchen	2464	1642	{"large": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/large_kitchen_desktop_494fd01d0e.png", "hash": "large_kitchen_desktop_494fd01d0e", "mime": "image/png", "name": "large_kitchen_desktop.png", "path": null, "size": 1011.95, "width": 1000, "height": 666, "sizeInBytes": 1011947}, "small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_kitchen_desktop_494fd01d0e.png", "hash": "small_kitchen_desktop_494fd01d0e", "mime": "image/png", "name": "small_kitchen_desktop.png", "path": null, "size": 290.71, "width": 500, "height": 333, "sizeInBytes": 290715}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_kitchen_desktop_494fd01d0e.png", "hash": "medium_kitchen_desktop_494fd01d0e", "mime": "image/png", "name": "medium_kitchen_desktop.png", "path": null, "size": 596.55, "width": 750, "height": 500, "sizeInBytes": 596552}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_kitchen_desktop_494fd01d0e.png", "hash": "thumbnail_kitchen_desktop_494fd01d0e", "mime": "image/png", "name": "thumbnail_kitchen_desktop.png", "path": null, "size": 75.87, "width": 234, "height": 156, "sizeInBytes": 75872}}	kitchen_desktop_494fd01d0e	.png	image/png	1202.72	https://esg-cms-prod.fra1.digitaloceanspaces.com/kitchen_desktop_494fd01d0e.png	\N	aws-s3	\N	/1/3	2025-10-31 16:32:21.485	2025-10-31 16:32:31.957	2025-10-31 16:32:21.486	1	1	\N
17	rcsgmd04ikspim2inajtim5z	kitchen_mobile.png	Kitchen	Kitchen	936	624	{"small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_kitchen_mobile_094e2292bd.png", "hash": "small_kitchen_mobile_094e2292bd", "mime": "image/png", "name": "small_kitchen_mobile.png", "path": null, "size": 279.18, "width": 500, "height": 333, "sizeInBytes": 279179}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_kitchen_mobile_094e2292bd.png", "hash": "medium_kitchen_mobile_094e2292bd", "mime": "image/png", "name": "medium_kitchen_mobile.png", "path": null, "size": 598.18, "width": 750, "height": 500, "sizeInBytes": 598183}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_kitchen_mobile_094e2292bd.png", "hash": "thumbnail_kitchen_mobile_094e2292bd", "mime": "image/png", "name": "thumbnail_kitchen_mobile.png", "path": null, "size": 72.09, "width": 234, "height": 156, "sizeInBytes": 72091}}	kitchen_mobile_094e2292bd	.png	image/png	199.14	https://esg-cms-prod.fra1.digitaloceanspaces.com/kitchen_mobile_094e2292bd.png	\N	aws-s3	\N	/1/3	2025-10-31 16:32:17.363	2025-10-31 16:32:37.556	2025-10-31 16:32:17.37	1	1	\N
20	lh0b76leyq2xjeeyj1u64e9r	rooms_desktop.png	Rooms	Rooms	2464	1642	{"large": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/large_rooms_desktop_fc8972b2b3.png", "hash": "large_rooms_desktop_fc8972b2b3", "mime": "image/png", "name": "large_rooms_desktop.png", "path": null, "size": 1349.81, "width": 1000, "height": 666, "sizeInBytes": 1349810}, "small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_rooms_desktop_fc8972b2b3.png", "hash": "small_rooms_desktop_fc8972b2b3", "mime": "image/png", "name": "small_rooms_desktop.png", "path": null, "size": 367.54, "width": 500, "height": 333, "sizeInBytes": 367544}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_rooms_desktop_fc8972b2b3.png", "hash": "medium_rooms_desktop_fc8972b2b3", "mime": "image/png", "name": "medium_rooms_desktop.png", "path": null, "size": 777.49, "width": 750, "height": 500, "sizeInBytes": 777487}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_rooms_desktop_fc8972b2b3.png", "hash": "thumbnail_rooms_desktop_fc8972b2b3", "mime": "image/png", "name": "thumbnail_rooms_desktop.png", "path": null, "size": 91.58, "width": 234, "height": 156, "sizeInBytes": 91577}}	rooms_desktop_fc8972b2b3	.png	image/png	1632.86	https://esg-cms-prod.fra1.digitaloceanspaces.com/rooms_desktop_fc8972b2b3.png	\N	aws-s3	\N	/1/5	2025-10-31 16:32:55.449	2025-10-31 16:33:24.562	2025-10-31 16:32:55.45	1	1	\N
19	l7if4bo6wn56de871ejfi4mt	rooms_mobile.png	Rooms	Rooms	936	624	{"small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_rooms_mobile_6769f7be4a.png", "hash": "small_rooms_mobile_6769f7be4a", "mime": "image/png", "name": "small_rooms_mobile.png", "path": null, "size": 361.91, "width": 500, "height": 333, "sizeInBytes": 361910}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_rooms_mobile_6769f7be4a.png", "hash": "medium_rooms_mobile_6769f7be4a", "mime": "image/png", "name": "medium_rooms_mobile.png", "path": null, "size": 792.17, "width": 750, "height": 500, "sizeInBytes": 792167}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_rooms_mobile_6769f7be4a.png", "hash": "thumbnail_rooms_mobile_6769f7be4a", "mime": "image/png", "name": "thumbnail_rooms_mobile.png", "path": null, "size": 89.1, "width": 234, "height": 156, "sizeInBytes": 89103}}	rooms_mobile_6769f7be4a	.png	image/png	260.57	https://esg-cms-prod.fra1.digitaloceanspaces.com/rooms_mobile_6769f7be4a.png	\N	aws-s3	\N	/1/5	2025-10-31 16:32:49.434	2025-10-31 16:33:29.549	2025-10-31 16:32:49.435	1	1	\N
21	c2v8n2xeangpf9pzjns8xmln	hero-bg.jpg	Hero cover	Hero cover	2880	1920	{"large": {"ext": ".jpg", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/large_hero_bg_ce5e79fd71.jpg", "hash": "large_hero_bg_ce5e79fd71", "mime": "image/jpeg", "name": "large_hero-bg.jpg", "path": null, "size": 126.15, "width": 1000, "height": 667, "sizeInBytes": 126153}, "small": {"ext": ".jpg", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_hero_bg_ce5e79fd71.jpg", "hash": "small_hero_bg_ce5e79fd71", "mime": "image/jpeg", "name": "small_hero-bg.jpg", "path": null, "size": 35.69, "width": 500, "height": 333, "sizeInBytes": 35691}, "medium": {"ext": ".jpg", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_hero_bg_ce5e79fd71.jpg", "hash": "medium_hero_bg_ce5e79fd71", "mime": "image/jpeg", "name": "medium_hero-bg.jpg", "path": null, "size": 73.94, "width": 750, "height": 500, "sizeInBytes": 73936}, "thumbnail": {"ext": ".jpg", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_hero_bg_ce5e79fd71.jpg", "hash": "thumbnail_hero_bg_ce5e79fd71", "mime": "image/jpeg", "name": "thumbnail_hero-bg.jpg", "path": null, "size": 10.1, "width": 234, "height": 156, "sizeInBytes": 10102}}	hero_bg_ce5e79fd71	.jpg	image/jpeg	1344.56	https://esg-cms-prod.fra1.digitaloceanspaces.com/hero_bg_ce5e79fd71.jpg	\N	aws-s3	\N	/7	2025-10-31 16:48:06.765	2025-10-31 16:48:15.678	2025-10-31 16:48:06.766	1	1	\N
22	p3sucrsuklxxyg6ddh61rml6	login-bg.png	Login background	Login background	2880	2880	{"large": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/large_login_bg_4bbecb44a5.png", "hash": "large_login_bg_4bbecb44a5", "mime": "image/png", "name": "large_login-bg.png", "path": null, "size": 1785.29, "width": 1000, "height": 1000, "sizeInBytes": 1785286}, "small": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/small_login_bg_4bbecb44a5.png", "hash": "small_login_bg_4bbecb44a5", "mime": "image/png", "name": "small_login-bg.png", "path": null, "size": 486.03, "width": 500, "height": 500, "sizeInBytes": 486031}, "medium": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/medium_login_bg_4bbecb44a5.png", "hash": "medium_login_bg_4bbecb44a5", "mime": "image/png", "name": "medium_login-bg.png", "path": null, "size": 1026.58, "width": 750, "height": 750, "sizeInBytes": 1026576}, "thumbnail": {"ext": ".png", "url": "https://esg-cms-prod.fra1.digitaloceanspaces.com/thumbnail_login_bg_4bbecb44a5.png", "hash": "thumbnail_login_bg_4bbecb44a5", "mime": "image/png", "name": "thumbnail_login-bg.png", "path": null, "size": 58.69, "width": 156, "height": 156, "sizeInBytes": 58692}}	login_bg_4bbecb44a5	.png	image/png	2938.53	https://esg-cms-prod.fra1.digitaloceanspaces.com/login_bg_4bbecb44a5.png	\N	aws-s3	\N	/6	2025-10-31 16:48:54.985	2025-10-31 16:49:38.455	2025-10-31 16:48:54.985	1	1	\N
23	vx440brkmoa9wfosm1x1psm6	hero-bg-v2.jpg	\N	\N	4896	3264	{"large": {"ext": ".jpg", "url": "https://esg-cms-prod-tor1.tor1.digitaloceanspaces.com/large_hero_bg_v2_dff0123bbf.jpg", "hash": "large_hero_bg_v2_dff0123bbf", "mime": "image/jpeg", "name": "large_hero-bg-v2.jpg", "path": null, "size": 124.69, "width": 1000, "height": 667, "sizeInBytes": 124692}, "small": {"ext": ".jpg", "url": "https://esg-cms-prod-tor1.tor1.digitaloceanspaces.com/small_hero_bg_v2_dff0123bbf.jpg", "hash": "small_hero_bg_v2_dff0123bbf", "mime": "image/jpeg", "name": "small_hero-bg-v2.jpg", "path": null, "size": 35.41, "width": 500, "height": 333, "sizeInBytes": 35410}, "medium": {"ext": ".jpg", "url": "https://esg-cms-prod-tor1.tor1.digitaloceanspaces.com/medium_hero_bg_v2_dff0123bbf.jpg", "hash": "medium_hero_bg_v2_dff0123bbf", "mime": "image/jpeg", "name": "medium_hero-bg-v2.jpg", "path": null, "size": 73.14, "width": 750, "height": 500, "sizeInBytes": 73136}, "thumbnail": {"ext": ".jpg", "url": "https://esg-cms-prod-tor1.tor1.digitaloceanspaces.com/thumbnail_hero_bg_v2_dff0123bbf.jpg", "hash": "thumbnail_hero_bg_v2_dff0123bbf", "mime": "image/jpeg", "name": "thumbnail_hero-bg-v2.jpg", "path": null, "size": 10.27, "width": 234, "height": 156, "sizeInBytes": 10272}}	hero_bg_v2_dff0123bbf	.jpg	image/jpeg	4419.94	https://esg-cms-prod-tor1.tor1.digitaloceanspaces.com/hero_bg_v2_dff0123bbf.jpg	\N	aws-s3	\N	/7	2025-12-17 14:07:35.341	2025-12-17 14:07:35.341	2025-12-17 14:07:35.342	1	1	\N
\.


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
1	13	2	1
2	14	2	2
5	15	4	1
6	16	4	2
9	17	3	1
10	18	3	2
13	19	5	1
14	20	5	2
18	21	7	1
20	22	6	1
22	23	7	2
\.


--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
39	16	5	api::feature.feature	image_desktop	1
40	15	5	api::feature.feature	image_mobile	1
41	16	9	api::feature.feature	image_desktop	1
42	15	9	api::feature.feature	image_mobile	1
43	14	7	api::feature.feature	image_desktop	1
44	13	7	api::feature.feature	image_mobile	1
45	14	10	api::feature.feature	image_desktop	1
46	13	10	api::feature.feature	image_mobile	1
47	18	3	api::feature.feature	image_desktop	1
48	17	3	api::feature.feature	image_mobile	1
49	18	11	api::feature.feature	image_desktop	1
50	17	11	api::feature.feature	image_mobile	1
51	20	1	api::feature.feature	image_desktop	1
52	19	1	api::feature.feature	image_mobile	1
53	20	12	api::feature.feature	image_desktop	1
54	19	12	api::feature.feature	image_mobile	1
57	22	1	api::login-page.login-page	login_background	1
58	22	3	api::login-page.login-page	login_background	1
59	23	1	api::home-page.home-page	hero_background	1
60	23	8	api::home-page.home-page	hero_background	1
\.


--
-- Data for Name: home_pages; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.home_pages (id, document_id, price_from, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	v9iiqpr2z9rzd54lksj4xb48	150	2025-10-03 13:15:35.714	2025-12-17 14:07:57.589	\N	1	1	en
8	v9iiqpr2z9rzd54lksj4xb48	150	2025-10-03 13:15:35.714	2025-12-17 14:07:57.589	2025-12-17 14:07:57.651	1	1	en
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	erilufpdndxaid1l8dxd72fb	English (en)	en	2025-09-27 03:20:12.794	2025-09-27 03:20:12.794	2025-09-27 03:20:12.794	\N	\N	\N
\.


--
-- Data for Name: login_pages; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.login_pages (id, document_id, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	shzit3nr4e7bdbjbu7jg9v1j	2025-10-03 15:31:19.073	2025-11-04 01:38:10.952	\N	1	1	en
3	shzit3nr4e7bdbjbu7jg9v1j	2025-10-03 15:31:19.073	2025-11-04 01:38:10.952	2025-11-04 01:38:11	1	1	en
\.


--
-- Data for Name: privacy_policies; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.privacy_policies (id, document_id, effective_date, content, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	obrvff9e1i9w8gpc7iujir7x	DATE	Contact: Easy Home Services, easyhs.ca — contact email: [contact email] or address: [business address] \n\n1. Purpose & Scope \nThis Privacy Policy explains how and why we collect, use, disclose, store, and protect personal information about you when you use our Site or request our cleaning services. Because we operate in Canada and engage in commercial activity, we adhere to the requirements of PIPEDA. \n\n2. What Personal Information We Collect & How \nWe collect only the personal information needed to deliver and manage our cleaning services. This may include: \n\n  • Name, contact information (address, phone number, e-mail) \n  • Address of premises to be cleaned \n  • Billing/payment information (e.g., credit card or debit card details) \n  • Scheduling and access instructions (e.g., gate codes, building access) \n  • Any special instructions or preferences relevant to the service (e.g., allergies, pets) \nWe collect this information directly through forms on our Site, by phone/email when you book, or during service delivery (e.g., access instructions). \n\n3. Purpose of Collection / Use / Disclosure \nWe use your information to: \n  • Provide and manage the cleaning services you request (scheduling, billing, communication) \n  • Process payments, issue invoices/receipts \n  • Contact you regarding your booking (confirmation, reminders, changes) \n  • Comply with legal or regulatory obligations (e.g., if required by law) \n  • Improve and optimize our services and customer experience (only with your consent) \nWe will not use or disclose your personal information for other purposes without your consent, except as required or permitted by law.   \n\n4. Consent \nWe obtain your consent to collect, use, or disclose your personal information at or before the time of collection. If we change the purpose, we will obtain additional consent before using or disclosing your information for that new purpose. \nYou are not required to consent to uses beyond what’s necessary to deliver the requested services; we will not make consent to additional uses a precondition to providing basic services. \n\n5. Limiting Collection, Use & Retention; Data Minimization \nWe collect only as much information as is reasonably necessary for the stated purposes. We will retain personal information only as long as needed to fulfill those purposes, or as required by law or legitimate business needs (e.g., billing records, service history). After that, we will securely dispose of or anonymize the data.   \n\n6. Safeguards & Security \nWe implement appropriate physical, organizational, and technical safeguards to protect personal information against unauthorized access, disclosure, loss, or theft. Examples may include access controls, secure storage, secure payment processing, password-protected systems, etc.   \n\n7. Openness & Accountability \nWe designate an individual (or team) responsible for compliance with this Policy and with PIPEDA’s principles. Upon request, we will provide you with information about our data practices, including what personal information we hold about you and how it is used or disclosed.   \n\n8. Access & Correction Rights \nYou have the right to request access to your personal information in our possession, and to request corrections if the information is inaccurate or incomplete. We will respond to such requests within a reasonable timeframe.   \n\n9. Third-Party Disclosure & Transfers (if any) \nWe will not share, rent, or sell your personal information to third parties for marketing or other purposes without your explicit consent. \nIf we engage third-party service providers (e.g., payment processors, software platforms), we will ensure they follow appropriate privacy safeguards. If your data will be transferred across provincial or national borders (e.g., cloud storage), we will inform you and obtain consent, if required.   \n\n10. Retention & Deletion \nWe will retain your personal information only as long as necessary for the purposes for which it was collected (service provision, billing, record-keeping), or as required by law. Once no longer needed, we will securely delete or anonymize it. \n\n11. Complaints & Contact Information \nIf you have questions, concerns or believe your personal information is being misused, contact us at [contact email]. We will investigate and address your complaint in a timely manner. If unsatisfied, you may also contact the Office of the Privacy Commissioner of Canada (OPC).   \n\n12. Updates to Privacy Policy \nWe may update this Privacy Policy from time to time. Updated versions will appear on the Site with a revised “Effective Date”. Continued use constitutes acceptance of the updated policy. 	2025-10-03 13:16:00.154	2025-12-15 17:34:27.263	\N	1	1	en
4	obrvff9e1i9w8gpc7iujir7x	DATE	Contact: Easy Home Services, easyhs.ca — contact email: [contact email] or address: [business address] \n\n1. Purpose & Scope \nThis Privacy Policy explains how and why we collect, use, disclose, store, and protect personal information about you when you use our Site or request our cleaning services. Because we operate in Canada and engage in commercial activity, we adhere to the requirements of PIPEDA. \n\n2. What Personal Information We Collect & How \nWe collect only the personal information needed to deliver and manage our cleaning services. This may include: \n\n  • Name, contact information (address, phone number, e-mail) \n  • Address of premises to be cleaned \n  • Billing/payment information (e.g., credit card or debit card details) \n  • Scheduling and access instructions (e.g., gate codes, building access) \n  • Any special instructions or preferences relevant to the service (e.g., allergies, pets) \nWe collect this information directly through forms on our Site, by phone/email when you book, or during service delivery (e.g., access instructions). \n\n3. Purpose of Collection / Use / Disclosure \nWe use your information to: \n  • Provide and manage the cleaning services you request (scheduling, billing, communication) \n  • Process payments, issue invoices/receipts \n  • Contact you regarding your booking (confirmation, reminders, changes) \n  • Comply with legal or regulatory obligations (e.g., if required by law) \n  • Improve and optimize our services and customer experience (only with your consent) \nWe will not use or disclose your personal information for other purposes without your consent, except as required or permitted by law.   \n\n4. Consent \nWe obtain your consent to collect, use, or disclose your personal information at or before the time of collection. If we change the purpose, we will obtain additional consent before using or disclosing your information for that new purpose. \nYou are not required to consent to uses beyond what’s necessary to deliver the requested services; we will not make consent to additional uses a precondition to providing basic services. \n\n5. Limiting Collection, Use & Retention; Data Minimization \nWe collect only as much information as is reasonably necessary for the stated purposes. We will retain personal information only as long as needed to fulfill those purposes, or as required by law or legitimate business needs (e.g., billing records, service history). After that, we will securely dispose of or anonymize the data.   \n\n6. Safeguards & Security \nWe implement appropriate physical, organizational, and technical safeguards to protect personal information against unauthorized access, disclosure, loss, or theft. Examples may include access controls, secure storage, secure payment processing, password-protected systems, etc.   \n\n7. Openness & Accountability \nWe designate an individual (or team) responsible for compliance with this Policy and with PIPEDA’s principles. Upon request, we will provide you with information about our data practices, including what personal information we hold about you and how it is used or disclosed.   \n\n8. Access & Correction Rights \nYou have the right to request access to your personal information in our possession, and to request corrections if the information is inaccurate or incomplete. We will respond to such requests within a reasonable timeframe.   \n\n9. Third-Party Disclosure & Transfers (if any) \nWe will not share, rent, or sell your personal information to third parties for marketing or other purposes without your explicit consent. \nIf we engage third-party service providers (e.g., payment processors, software platforms), we will ensure they follow appropriate privacy safeguards. If your data will be transferred across provincial or national borders (e.g., cloud storage), we will inform you and obtain consent, if required.   \n\n10. Retention & Deletion \nWe will retain your personal information only as long as necessary for the purposes for which it was collected (service provision, billing, record-keeping), or as required by law. Once no longer needed, we will securely delete or anonymize it. \n\n11. Complaints & Contact Information \nIf you have questions, concerns or believe your personal information is being misused, contact us at [contact email]. We will investigate and address your complaint in a timely manner. If unsatisfied, you may also contact the Office of the Privacy Commissioner of Canada (OPC).   \n\n12. Updates to Privacy Policy \nWe may update this Privacy Policy from time to time. Updated versions will appear on the Site with a revised “Effective Date”. Continued use constitutes acceptance of the updated policy. 	2025-10-03 13:16:00.154	2025-12-15 17:34:27.263	2025-12-15 17:34:27.303	1	1	en
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.questions (id, document_id, question, answer, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	gnhtedstyakm4vpiyhdiwnnp	How do I book a cleaning?	This is a test response	2025-10-13 23:30:40.087	2025-10-13 23:30:40.087	\N	1	1	en
2	gnhtedstyakm4vpiyhdiwnnp	How do I book a cleaning?	This is a test response	2025-10-13 23:30:40.087	2025-10-13 23:30:40.087	2025-10-13 23:30:40.117	1	1	en
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.reviews (id, document_id, author, review, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	fpbyy1mg4olcgj3u6zml5m2l	Jane Doe	This is a sample comment	2025-10-13 23:25:01.22	2025-10-13 23:25:01.22	\N	1	1	en
2	fpbyy1mg4olcgj3u6zml5m2l	Jane Doe	This is a sample comment	2025-10-13 23:25:01.22	2025-10-13 23:25:01.22	2025-10-13 23:25:01.259	1	1	en
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.services (id, document_id, slug, name, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, service_price, sqft_price, worker_time, client_time, extra_bedroom_price, extra_bathroom_price, extra_kitchen_price, extra_bedroom_worker_time, extra_bedroom_client_time, extra_bathroom_worker_time, extra_bathroom_client_time, extra_kitchen_worker_time, extra_kitchen_client_time) FROM stdin;
19	btm00rl02h57kxqk3y19kdhc	staircases	Stairwells	2025-10-13 20:32:34.924	2025-10-27 10:23:23.839	\N	1	3	en	0.20	0.20	11.00	15.00	45.00	45.00	60.00	35.00	45.00	35.00	45.00	50.00	60.00
47	btm00rl02h57kxqk3y19kdhc	staircases	Stairwells	2025-10-13 20:32:34.924	2025-10-27 10:23:23.839	2025-10-27 10:23:23.871	1	3	en	0.20	0.20	11.00	15.00	45.00	45.00	60.00	35.00	45.00	35.00	45.00	50.00	60.00
11	qegsnsrvsqcsqsaziw2zb1na	after-renovation	Renovation	2025-10-13 20:31:32.869	2025-12-03 09:10:09.761	\N	1	3	en	0.00	0.00	465.00	530.00	45.00	45.00	60.00	35.00	45.00	35.00	45.00	50.00	60.00
51	qegsnsrvsqcsqsaziw2zb1na	after-renovation	Renovation	2025-10-13 20:31:32.869	2025-12-03 09:10:09.761	2025-12-03 09:10:09.81	1	3	en	0.00	0.00	465.00	530.00	45.00	45.00	60.00	35.00	45.00	35.00	45.00	50.00	60.00
54	d1cxhbw3810b731u3ekshq7b	painting	Wall painting	2025-12-05 20:56:49.664	2025-12-05 20:56:49.664	\N	1	1	en	1.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
55	d1cxhbw3810b731u3ekshq7b	painting	Wall painting	2025-12-05 20:56:49.664	2025-12-05 20:56:49.664	2025-12-05 20:56:49.701	1	1	en	1.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
60	jf8lz0m2hg0qvzv5q6hbu128	drywall-installation	Drywall Installation	2025-12-05 20:58:14.39	2025-12-05 20:58:14.39	\N	1	1	en	10.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
61	jf8lz0m2hg0qvzv5q6hbu128	drywall-installation	Drywall Installation	2025-12-05 20:58:14.39	2025-12-05 20:58:14.39	2025-12-05 20:58:14.421	1	1	en	10.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
62	bl4x8fxnijaaqe6au8kx20cf	vinyl-siding	Vinyl Siding	2025-12-05 20:58:37.203	2025-12-05 20:58:37.203	\N	1	1	en	10.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
63	bl4x8fxnijaaqe6au8kx20cf	vinyl-siding	Vinyl Siding	2025-12-05 20:58:37.203	2025-12-05 20:58:37.203	2025-12-05 20:58:37.244	1	1	en	10.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
64	hpn1vcu80vxjp7d4rkkyn59h	insulations	Insulations	2025-12-05 20:59:19.876	2025-12-05 20:59:19.876	\N	1	1	en	10.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
65	hpn1vcu80vxjp7d4rkkyn59h	insulations	Insulations	2025-12-05 20:59:19.876	2025-12-05 20:59:19.876	2025-12-05 20:59:19.912	1	1	en	10.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
56	poc1gui3nxtn9u4e2pzi2yc9	laminate-flooring	Laminate Flooring Installation	2025-12-05 20:57:30.361	2025-12-05 20:59:50.513	\N	1	1	en	11.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
66	poc1gui3nxtn9u4e2pzi2yc9	laminate-flooring	Laminate Flooring Installation	2025-12-05 20:57:30.361	2025-12-05 20:59:50.513	2025-12-05 20:59:50.577	1	1	en	11.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
52	jekr2z16syq2kehlssnfrfiy	renovations	Renovations	2025-12-05 20:56:00.402	2025-12-05 21:32:44.428	\N	1	1	en	0.00	0.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
67	jekr2z16syq2kehlssnfrfiy	renovations	Renovations	2025-12-05 20:56:00.402	2025-12-05 21:32:44.428	2025-12-05 21:32:44.474	1	1	en	0.00	0.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
58	qtvrplj3ywtksyoe1zo21gcx	baseboard-installation	Baseboard installation	2025-12-05 20:57:57.957	2025-12-15 23:17:26.218	\N	1	1	en	10.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
69	qtvrplj3ywtksyoe1zo21gcx	baseboard-installation	Baseboard installation	2025-12-05 20:57:57.957	2025-12-15 23:17:26.218	2025-12-15 23:17:26.255	1	1	en	10.00	10.00	100.00	100.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
78	xjzutkf3cno6bymqni7z52dt	move-in	Move‑in/out	2025-10-13 20:31:13.528	2025-12-19 15:43:40.351	2025-12-19 15:43:40.387	1	3	en	410.00	0.00	360.00	360.00	45.00	45.00	60.00	35.00	35.00	35.00	35.00	50.00	50.00
17	xz5zdksja36ruyx4uwdxjrda	office	Offices	2025-10-13 20:32:13.939	2025-12-19 15:44:16.796	\N	1	3	en	0.20	0.20	11.00	11.00	35.00	35.00	50.00	30.00	30.00	30.00	30.00	40.00	40.00
79	xz5zdksja36ruyx4uwdxjrda	office	Offices	2025-10-13 20:32:13.939	2025-12-19 15:44:16.796	2025-12-19 15:44:16.834	1	3	en	0.20	0.20	11.00	11.00	35.00	35.00	50.00	30.00	30.00	30.00	30.00	40.00	40.00
13	s2mi2v1odokraj7xsyk9q2ng	kitchen	Kitchen	2025-10-13 20:31:45.248	2025-12-19 15:42:06.596	\N	1	3	en	330.00	0.00	270.00	270.00	35.00	35.00	330.00	30.00	30.00	30.00	30.00	270.00	270.00
75	s2mi2v1odokraj7xsyk9q2ng	kitchen	Kitchen	2025-10-13 20:31:45.248	2025-12-19 15:42:06.596	2025-12-19 15:42:06.633	1	3	en	330.00	0.00	270.00	270.00	35.00	35.00	330.00	30.00	30.00	30.00	30.00	270.00	270.00
7	qx0i57e6kx7etkiyqllbqafj	deep	Deep	2025-10-13 20:30:52.172	2025-12-19 15:42:36.504	\N	1	3	en	250.00	0.00	210.00	210.00	45.00	45.00	60.00	35.00	35.00	35.00	35.00	50.00	50.00
76	qx0i57e6kx7etkiyqllbqafj	deep	Deep	2025-10-13 20:30:52.172	2025-12-19 15:42:36.504	2025-12-19 15:42:36.543	1	3	en	250.00	0.00	210.00	210.00	45.00	45.00	60.00	35.00	35.00	35.00	35.00	50.00	50.00
5	unno05utaax25ytdz74ryj9w	standard	Standard	2025-10-13 20:26:49.738	2025-12-19 15:43:10.267	\N	1	3	en	150.00	0.00	120.00	120.00	35.00	35.00	50.00	30.00	30.00	30.00	30.00	40.00	40.00
77	unno05utaax25ytdz74ryj9w	standard	Standard	2025-10-13 20:26:49.738	2025-12-19 15:43:10.267	2025-12-19 15:43:10.306	1	3	en	150.00	0.00	120.00	120.00	35.00	35.00	50.00	30.00	30.00	30.00	30.00	40.00	40.00
9	xjzutkf3cno6bymqni7z52dt	move-in	Move‑in/out	2025-10-13 20:31:13.528	2025-12-19 15:43:40.351	\N	1	3	en	410.00	0.00	360.00	360.00	45.00	45.00	60.00	35.00	35.00	35.00	35.00	50.00	50.00
15	tt6n9tvhu9cggeqx2e022kam	windows	Windows	2025-10-13 20:32:01.148	2025-12-19 15:45:59.104	\N	1	3	en	20.00	0.00	15.00	15.00	45.00	45.00	60.00	35.00	35.00	35.00	35.00	50.00	50.00
80	tt6n9tvhu9cggeqx2e022kam	windows	Windows	2025-10-13 20:32:01.148	2025-12-19 15:45:59.104	2025-12-19 15:45:59.149	1	3	en	20.00	0.00	15.00	15.00	45.00	45.00	60.00	35.00	35.00	35.00	35.00	50.00	50.00
\.


--
-- Data for Name: strapi_ai_localization_jobs; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_ai_localization_jobs (id, content_type, related_document_id, source_locale, target_locales, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, encrypted_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
2	yfntu150tq1295ytmqipqb6j	Full Access	A default API token with full access permissions, used for accessing or modifying resources	full-access	d108309d0fc5694be1001c7712954dd244759117c7bf12f9894643baae39f7afad37aca942cde8bd96ee9123648ca5044236540fe190f1f837fbb2d97072568d	v1:4292476ad4e1d503f848e2db9147f627:dc3138f0fca9c203aa4acc60098e56ec75c91402380c0013569b92d5fca4fe5f06ea57bf2def549e6523200e51ab1d41ca2d1967e34f923353c4bf685f28d8e30660c57c8c7b6d133dc1ef2d0ae4160758eab6856505bb1da2d69b30038bc2f47f64ff90b658fd95fa03ec190fb1f98cb297235032cc5060368cde8aaeb21109179bceb4aeae1ecea51e58a48dc1bbdb314ca57fe93347fab6fb85760fa57beda67fa280e296c8113cb376bec6db34d1a087adc2049f8d3da7f61f58f30822920a6355bc6a8796978dba1304f8565023dce68dbcee7d4d3b0ff9ae29c829be950ede7f34e9cc39bfd379373784ea1ef08df7e3470335e90a2e1bfa4423416e7c:f3714484bb744414c33da70164efd642	2025-10-29 14:09:20.872	\N	\N	2025-09-27 03:23:45.757	2025-10-29 14:09:20.872	2025-09-27 03:23:45.757	\N	\N	\N
1	qck67bdz7exvmr2ka4f39ggo	Read Only	A default API token with read-only permissions, only used for accessing resources	read-only	35cb95637c642670b1c4eef30160a93557f279e7a39ff1c252345c4c01602db6e2f86aed93b52a176de661ecb846cba02ed4755d89792ba017185eea49457072	v1:6da71f17fff74848feed66572dcd5f9e:6864f8cb5a2f43a9e4ce889831ed55a74602abd64494957d808e17d94c5881b76ce132b1bf2736245ba4a3aede53ed6755e5901280f6d181d7de10c4f8660d7739811f5b5cc8e57e5b9f23481cada28723e1e8012cc295507e3a8351eb96947edfc29da50f9d5dab1eece4b8f027a0546aca295a78124ac7ca69063f76dbcf308bfc0c3c2ab1e2beb35737ad22564a92e70d451aa07127fccc6896765238ced22e2e7fad5ba21b5c92baaf8424a27b54ab956d74bf7bea56bccd573a06738996083ffd361f1d58af2d39f72c7f0fba3b463f3de61393c7435f195bea46eec928cf444e75dc7e13468b169c36142f402ed2e1635a288ce48c1b94d2139155b7e4:c72b564b4dd85c0119235cbc3e4f346e	2025-12-06 14:52:18.365	\N	\N	2025-09-27 03:23:45.571	2025-12-06 14:52:18.365	2025-09-27 03:23:45.572	\N	\N	\N
3	dmrz9hrirepjfzsrg85nllrj	Yevhen's Dev Token		read-only	0f6f69540358fb1b587ed48444c4169e08bc8a2bdf1cb43c5e657ebb2a18623092458fcdbd430c70046f269995e444a70fa9d52478d23ce483a3010bc79f1c30	v1:8206643ad4a02d1640a04378db98fe7e:1fccb81396bf894ed237c7b514c93e050a3387077e21f5a420f199357fe26ae2f7f79c262d705561dffbc6c3b087b270a7db4ee42203e2bfd985d114427cbec497a31123123cb9dbfc09c9821ccef6bac886668e6ab2f8fb89a6cb0e4d2ae3ba04c051048583d27776007bca8dfe4a61e26214147eef64ccfa66e324aed9f368d1216ce75726a9bd6f6f4d9bb6db6796a796387c7b0b9bb484b9a1dbe526a73a1480254af7bfa4f9e48a4b1273aa5cc0553e85c28e9f9aa256734d5604056cc0ee172ddb2b5a0294fb3cfbc10dfe874b631ca49224adf09c2422af7b96e5c53a5b62e1be81f45319517485b6df1b2b5100c6b960efc1599ecd18c1760e2c52a2:6a96a8429ad2cbd9e460fabb21bc1274	2025-12-11 22:09:09.504	\N	\N	2025-10-30 22:04:04.439	2025-12-11 22:09:09.505	2025-10-30 22:04:04.44	\N	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
1	strapi_unidirectional-join-table-repair-ran	true	boolean	\N	\N
3	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
2	strapi_content_types_schema	{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"api::addon.addon":{"kind":"collectionType","collectionName":"addons","info":{"singularName":"addon","pluralName":"addons","displayName":"Addon"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"slug":{"type":"enumeration","pluginOptions":{"i18n":{"localized":false}},"required":true,"enum":["oven","range-hood","kitchen-cabinets","dishwashing","fridge","microwave","balcony","window","ironing","litter-box","extra-hours","closet","dishwasher-machine","vacuum-cleaner","laundry","gardines","pet-cleaning"]},"name":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":1,"min":0},"worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::addon.addon","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"addons"}}},"apiName":"addon","globalId":"Addon","uid":"api::addon.addon","modelType":"contentType","__schema__":{"collectionName":"addons","info":{"singularName":"addon","pluralName":"addons","displayName":"Addon"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"slug":{"type":"enumeration","pluginOptions":{"i18n":{"localized":false}},"required":true,"enum":["oven","range-hood","kitchen-cabinets","dishwashing","fridge","microwave","balcony","window","ironing","litter-box","extra-hours","closet","dishwasher-machine","vacuum-cleaner","laundry","gardines","pet-cleaning"]},"name":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":1,"min":0},"worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0}},"kind":"collectionType"},"modelName":"addon","actions":{},"lifecycles":{}},"api::advantage.advantage":{"kind":"collectionType","collectionName":"advantages","info":{"singularName":"advantage","pluralName":"advantages","displayName":"Advantage"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"icon_slug":{"type":"string","pluginOptions":{"i18n":{"localized":false}},"required":true,"regex":"^[a-z\\\\-]+$"},"title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"description":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::advantage.advantage","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"advantages"}}},"apiName":"advantage","globalId":"Advantage","uid":"api::advantage.advantage","modelType":"contentType","__schema__":{"collectionName":"advantages","info":{"singularName":"advantage","pluralName":"advantages","displayName":"Advantage"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"icon_slug":{"type":"string","pluginOptions":{"i18n":{"localized":false}},"required":true,"regex":"^[a-z\\\\-]+$"},"title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"description":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true}},"kind":"collectionType"},"modelName":"advantage","actions":{},"lifecycles":{}},"api::coefficient.coefficient":{"kind":"collectionType","collectionName":"coefficients","info":{"singularName":"coefficient","pluralName":"coefficients","displayName":"Coefficient"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"slug":{"type":"enumeration","required":true,"enum":["discount-once","discount-weekly","discount-biweekly","discount-monthly","house","suburbs"]},"coefficient":{"type":"decimal","required":true,"default":1,"min":0},"applies_to":{"type":"enumeration","required":true,"enum":["base","total"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::coefficient.coefficient","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"coefficients"}}},"apiName":"coefficient","globalId":"Coefficient","uid":"api::coefficient.coefficient","modelType":"contentType","__schema__":{"collectionName":"coefficients","info":{"singularName":"coefficient","pluralName":"coefficients","displayName":"Coefficient"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"slug":{"type":"enumeration","required":true,"enum":["discount-once","discount-weekly","discount-biweekly","discount-monthly","house","suburbs"]},"coefficient":{"type":"decimal","required":true,"default":1,"min":0},"applies_to":{"type":"enumeration","required":true,"enum":["base","total"]}},"kind":"collectionType"},"modelName":"coefficient","actions":{},"lifecycles":{}},"api::contact.contact":{"kind":"collectionType","collectionName":"contacts","info":{"singularName":"contact","pluralName":"contacts","displayName":"Contact"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"slug":{"type":"enumeration","pluginOptions":{"i18n":{"localized":false}},"required":true,"enum":["telegram","messenger","whatsapp"]},"title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"link":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::contact.contact","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"contacts"}}},"apiName":"contact","globalId":"Contact","uid":"api::contact.contact","modelType":"contentType","__schema__":{"collectionName":"contacts","info":{"singularName":"contact","pluralName":"contacts","displayName":"Contact"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"slug":{"type":"enumeration","pluginOptions":{"i18n":{"localized":false}},"required":true,"enum":["telegram","messenger","whatsapp"]},"title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"link":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true}},"kind":"collectionType"},"modelName":"contact","actions":{},"lifecycles":{}},"api::cookie-policy.cookie-policy":{"kind":"singleType","collectionName":"cookie_policies","info":{"singularName":"cookie-policy","pluralName":"cookie-policies","displayName":"Cookie Policy"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"effective_date":{"type":"string"},"content":{"type":"text"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::cookie-policy.cookie-policy","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"cookie_policies"}}},"apiName":"cookie-policy","globalId":"CookiePolicy","uid":"api::cookie-policy.cookie-policy","modelType":"contentType","__schema__":{"collectionName":"cookie_policies","info":{"singularName":"cookie-policy","pluralName":"cookie-policies","displayName":"Cookie Policy"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"effective_date":{"type":"string"},"content":{"type":"text"}},"kind":"singleType"},"modelName":"cookie-policy","actions":{},"lifecycles":{}},"api::feature.feature":{"kind":"collectionType","collectionName":"features","info":{"singularName":"feature","pluralName":"features","displayName":"Included Feature"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"slug":{"type":"enumeration","pluginOptions":{"i18n":{"localized":false}},"required":true,"enum":["room","bathroom","kitchen","hallway"]},"title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"image_desktop":{"type":"media","pluginOptions":{"i18n":{"localized":true}},"multiple":false,"required":true,"allowedTypes":["images"]},"image_mobile":{"type":"media","pluginOptions":{"i18n":{"localized":false}},"multiple":false,"required":true,"allowedTypes":["images"]},"options":{"type":"relation","relation":"oneToMany","target":"api::feature-option.feature-option"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::feature.feature","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"features"}}},"apiName":"feature","globalId":"Feature","uid":"api::feature.feature","modelType":"contentType","__schema__":{"collectionName":"features","info":{"singularName":"feature","pluralName":"features","displayName":"Included Feature"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"slug":{"type":"enumeration","pluginOptions":{"i18n":{"localized":false}},"required":true,"enum":["room","bathroom","kitchen","hallway"]},"title":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"image_desktop":{"type":"media","pluginOptions":{"i18n":{"localized":true}},"multiple":false,"required":true,"allowedTypes":["images"]},"image_mobile":{"type":"media","pluginOptions":{"i18n":{"localized":false}},"multiple":false,"required":true,"allowedTypes":["images"]},"options":{"type":"relation","relation":"oneToMany","target":"api::feature-option.feature-option"}},"kind":"collectionType"},"modelName":"feature","actions":{},"lifecycles":{}},"api::feature-option.feature-option":{"kind":"collectionType","collectionName":"feature_options","info":{"singularName":"feature-option","pluralName":"feature-options","displayName":"Included Feature Option"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"text":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::feature-option.feature-option","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"feature_options"}}},"apiName":"feature-option","globalId":"FeatureOption","uid":"api::feature-option.feature-option","modelType":"contentType","__schema__":{"collectionName":"feature_options","info":{"singularName":"feature-option","pluralName":"feature-options","displayName":"Included Feature Option"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"text":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true}},"kind":"collectionType"},"modelName":"feature-option","actions":{},"lifecycles":{}},"api::home-page.home-page":{"kind":"singleType","collectionName":"home_pages","info":{"singularName":"home-page","pluralName":"home-pages","displayName":"Home Page"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"price_from":{"type":"integer","pluginOptions":{"i18n":{"localized":false}},"required":true},"hero_background":{"type":"media","pluginOptions":{"i18n":{"localized":false}},"multiple":false,"required":true,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::home-page.home-page","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"home_pages"}}},"apiName":"home-page","globalId":"HomePage","uid":"api::home-page.home-page","modelType":"contentType","__schema__":{"collectionName":"home_pages","info":{"singularName":"home-page","pluralName":"home-pages","displayName":"Home Page"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"price_from":{"type":"integer","pluginOptions":{"i18n":{"localized":false}},"required":true},"hero_background":{"type":"media","pluginOptions":{"i18n":{"localized":false}},"multiple":false,"required":true,"allowedTypes":["images"]}},"kind":"singleType"},"modelName":"home-page","actions":{},"lifecycles":{}},"api::login-page.login-page":{"kind":"singleType","collectionName":"login_pages","info":{"singularName":"login-page","pluralName":"login-pages","displayName":"Login Page"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"login_background":{"type":"media","pluginOptions":{"i18n":{"localized":false}},"multiple":false,"required":true,"allowedTypes":["images"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::login-page.login-page","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"login_pages"}}},"apiName":"login-page","globalId":"LoginPage","uid":"api::login-page.login-page","modelType":"contentType","__schema__":{"collectionName":"login_pages","info":{"singularName":"login-page","pluralName":"login-pages","displayName":"Login Page"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"login_background":{"type":"media","pluginOptions":{"i18n":{"localized":false}},"multiple":false,"required":true,"allowedTypes":["images"]}},"kind":"singleType"},"modelName":"login-page","actions":{},"lifecycles":{}},"api::privacy-policy.privacy-policy":{"kind":"singleType","collectionName":"privacy_policies","info":{"singularName":"privacy-policy","pluralName":"privacy-policies","displayName":"Privacy Policy"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"effective_date":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"content":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::privacy-policy.privacy-policy","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"privacy_policies"}}},"apiName":"privacy-policy","globalId":"PrivacyPolicy","uid":"api::privacy-policy.privacy-policy","modelType":"contentType","__schema__":{"collectionName":"privacy_policies","info":{"singularName":"privacy-policy","pluralName":"privacy-policies","displayName":"Privacy Policy"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"effective_date":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"content":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true}},"kind":"singleType"},"modelName":"privacy-policy","actions":{},"lifecycles":{}},"api::question.question":{"kind":"collectionType","collectionName":"questions","info":{"singularName":"question","pluralName":"questions","displayName":"Question"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"question":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"answer":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::question.question","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"questions"}}},"apiName":"question","globalId":"Question","uid":"api::question.question","modelType":"contentType","__schema__":{"collectionName":"questions","info":{"singularName":"question","pluralName":"questions","displayName":"Question"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"question":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"answer":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true}},"kind":"collectionType"},"modelName":"question","actions":{},"lifecycles":{}},"api::review.review":{"kind":"collectionType","collectionName":"reviews","info":{"singularName":"review","pluralName":"reviews","displayName":"Review"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"author":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"review":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::review.review","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"reviews"}}},"apiName":"review","globalId":"Review","uid":"api::review.review","modelType":"contentType","__schema__":{"collectionName":"reviews","info":{"singularName":"review","pluralName":"reviews","displayName":"Review"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"author":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"review":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true}},"kind":"collectionType"},"modelName":"review","actions":{},"lifecycles":{}},"api::service.service":{"kind":"collectionType","collectionName":"services","info":{"singularName":"service","pluralName":"services","displayName":"Service"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"slug":{"type":"enumeration","pluginOptions":{"i18n":{"localized":false}},"required":true,"enum":["standard","deep","move-in","after-renovation","kitchen","office","windows","staircases","renovations","painting","laminate-flooring","baseboard-installation","drywall-installation","vinyl-siding","insulations"]},"name":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"service_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":1,"min":0},"sqft_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"default":0,"min":0},"worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bedroom_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bedroom_worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bedroom_client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bathroom_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bathroom_worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bathroom_client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_kitchen_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_kitchen_worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_kitchen_client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::service.service","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"services"}}},"apiName":"service","globalId":"Service","uid":"api::service.service","modelType":"contentType","__schema__":{"collectionName":"services","info":{"singularName":"service","pluralName":"services","displayName":"Service"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"slug":{"type":"enumeration","pluginOptions":{"i18n":{"localized":false}},"required":true,"enum":["standard","deep","move-in","after-renovation","kitchen","office","windows","staircases","renovations","painting","laminate-flooring","baseboard-installation","drywall-installation","vinyl-siding","insulations"]},"name":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"service_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":1,"min":0},"sqft_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"default":0,"min":0},"worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bedroom_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bedroom_worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bedroom_client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bathroom_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bathroom_worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_bathroom_client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_kitchen_price":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_kitchen_worker_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0},"extra_kitchen_client_time":{"type":"decimal","pluginOptions":{"i18n":{"localized":false}},"required":true,"default":0,"min":0}},"kind":"collectionType"},"modelName":"service","actions":{},"lifecycles":{}},"api::tax.tax":{"kind":"singleType","collectionName":"taxes","info":{"singularName":"tax","pluralName":"taxes","displayName":"Tax"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"vat":{"type":"decimal","required":true,"unique":false,"default":0,"min":0},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::tax.tax","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"taxes"}}},"apiName":"tax","globalId":"Tax","uid":"api::tax.tax","modelType":"contentType","__schema__":{"collectionName":"taxes","info":{"singularName":"tax","pluralName":"taxes","displayName":"Tax"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"vat":{"type":"decimal","required":true,"unique":false,"default":0,"min":0}},"kind":"singleType"},"modelName":"tax","actions":{},"lifecycles":{}},"api::terms-of-service.terms-of-service":{"kind":"singleType","collectionName":"terms_of_services","info":{"singularName":"terms-of-service","pluralName":"terms-of-services","displayName":"Terms of Service"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"effective_date":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"content":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::terms-of-service.terms-of-service","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"terms_of_services"}}},"apiName":"terms-of-service","globalId":"TermsOfService","uid":"api::terms-of-service.terms-of-service","modelType":"contentType","__schema__":{"collectionName":"terms_of_services","info":{"singularName":"terms-of-service","pluralName":"terms-of-services","displayName":"Terms of Service"},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"effective_date":{"type":"string","pluginOptions":{"i18n":{"localized":true}},"required":true},"content":{"type":"text","pluginOptions":{"i18n":{"localized":true}},"required":true}},"kind":"singleType"},"modelName":"terms-of-service","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"},"admin::session":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::session","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_sessions"}}},"plugin":"admin","globalId":"AdminSession","uid":"admin::session","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"session"}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
26	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
18	plugin_content_manager_configuration_content_types::api::question.question	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"question","defaultSortBy":"question","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"question":{"edit":{"label":"question","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"question","searchable":true,"sortable":true}},"answer":{"edit":{"label":"answer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"answer","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","question","answer","createdAt"],"edit":[[{"name":"question","size":6},{"name":"answer","size":6}]]},"uid":"api::question.question"}	object	\N	\N
19	plugin_content_manager_configuration_content_types::api::review.review	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"author","defaultSortBy":"author","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"author":{"edit":{"label":"author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"author","searchable":true,"sortable":true}},"review":{"edit":{"label":"review","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"review","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","author","review","createdAt"],"edit":[[{"name":"author","size":6},{"name":"review","size":6}]]},"uid":"api::review.review"}	object	\N	\N
27	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"encryptedKey":{"edit":{"label":"encryptedKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"encryptedKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"encryptedKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
22	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
28	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false,"aiMetadata":true}	object	\N	\N
24	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
31	plugin_i18n_default_locale	"en"	string	\N	\N
33	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
34	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":false,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":"","default_role":"authenticated"}	object	\N	\N
36	plugin_content_manager_configuration_content_types::api::addon.addon	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":100,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Slug (ID)","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"price":{"edit":{"label":"Addon price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price","searchable":true,"sortable":true}},"worker_time":{"edit":{"label":"Worker time","description":"Time spent by cleaner to do addon","placeholder":"","visible":true,"editable":true},"list":{"label":"worker_time","searchable":true,"sortable":true}},"client_time":{"edit":{"label":"Client time","description":"Time shown to client in estimation","placeholder":"","visible":true,"editable":true},"list":{"label":"client_time","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"slug","size":6},{"name":"name","size":6}],[{"name":"price","size":4},{"name":"worker_time","size":4},{"name":"client_time","size":4}]],"list":["id","slug","name","price","worker_time","client_time"]},"uid":"api::addon.addon"}	object	\N	\N
29	plugin_upload_view_configuration	{"pageSize":100,"sort":"name:ASC"}	object	\N	\N
37	plugin_content_manager_configuration_content_types::api::privacy-policy.privacy-policy	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"effective_date","defaultSortBy":"effective_date","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"effective_date":{"edit":{"label":"effective_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"effective_date","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","effective_date","content","createdAt"],"edit":[[{"name":"effective_date","size":6},{"name":"content","size":6}]]},"uid":"api::privacy-policy.privacy-policy"}	object	\N	\N
32	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
30	plugin_upload_metrics	{"weeklySchedule":"49 23 3 * * 6","lastWeeklyUpdate":1766201029029}	object	\N	\N
35	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
38	plugin_content_manager_configuration_content_types::api::service.service	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Slug (ID)","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"service_price":{"edit":{"label":"Service Price (per unit)","description":"Price for home services or cleaning windows","placeholder":"","visible":true,"editable":true},"list":{"label":"service_price","searchable":true,"sortable":true}},"sqft_price":{"edit":{"label":"Square Feet Price","description":"Price for business services (office cleaning, etc.)","placeholder":"","visible":true,"editable":true},"list":{"label":"sqft_price","searchable":true,"sortable":true}},"worker_time":{"edit":{"label":"Worker time","description":"Time spent by cleaner to do base service","placeholder":"","visible":true,"editable":true},"list":{"label":"worker_time","searchable":true,"sortable":true}},"client_time":{"edit":{"label":"Client time","description":"Time shown to client in estimation","placeholder":"","visible":true,"editable":true},"list":{"label":"client_time","searchable":true,"sortable":true}},"extra_bedroom_price":{"edit":{"label":"Bedroom price","description":"Price for extra bedroom","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_bedroom_price","searchable":true,"sortable":true}},"extra_bedroom_worker_time":{"edit":{"label":"Bedroom worker time","description":"Time spent by cleaner to do it","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_bedroom_worker_time","searchable":true,"sortable":true}},"extra_bedroom_client_time":{"edit":{"label":"Bedroom client time","description":"Time shown to client to do it","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_bedroom_client_time","searchable":true,"sortable":true}},"extra_bathroom_price":{"edit":{"label":"Bathroom price","description":"Price for extra bathroom","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_bathroom_price","searchable":true,"sortable":true}},"extra_bathroom_worker_time":{"edit":{"label":"Bathroom worker time","description":"Time spent by cleaner to do it","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_bathroom_worker_time","searchable":true,"sortable":true}},"extra_bathroom_client_time":{"edit":{"label":"Bathroom client time","description":"Time shown to client to do it","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_bathroom_client_time","searchable":true,"sortable":true}},"extra_kitchen_price":{"edit":{"label":"Kitchen price","description":"Price for extra kitchen","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_kitchen_price","searchable":true,"sortable":true}},"extra_kitchen_worker_time":{"edit":{"label":"Kitchen worker time","description":"Time spent by cleaner to do it","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_kitchen_worker_time","searchable":true,"sortable":true}},"extra_kitchen_client_time":{"edit":{"label":"Kitchen client time","description":"Time shown to client to do it","placeholder":"","visible":true,"editable":true},"list":{"label":"extra_kitchen_client_time","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"slug","size":6},{"name":"name","size":6}],[{"name":"service_price","size":6},{"name":"sqft_price","size":6}],[{"name":"client_time","size":6},{"name":"worker_time","size":6}],[{"name":"extra_bedroom_price","size":4},{"name":"extra_bedroom_worker_time","size":4},{"name":"extra_bedroom_client_time","size":4}],[{"name":"extra_bathroom_price","size":4},{"name":"extra_bathroom_worker_time","size":4},{"name":"extra_bathroom_client_time","size":4}],[{"name":"extra_kitchen_price","size":4},{"name":"extra_kitchen_worker_time","size":4},{"name":"extra_kitchen_client_time","size":4}]],"list":["id","slug","name","service_price"]},"uid":"api::service.service"}	object	\N	\N
40	plugin_content_manager_configuration_content_types::api::terms-of-service.terms-of-service	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"effective_date","defaultSortBy":"effective_date","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"effective_date":{"edit":{"label":"effective_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"effective_date","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","effective_date","content","createdAt"],"edit":[[{"name":"effective_date","size":6},{"name":"content","size":6}]]},"uid":"api::terms-of-service.terms-of-service"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::api::advantage.advantage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"icon_slug","defaultSortBy":"icon_slug","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"icon_slug":{"edit":{"label":"icon_slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"icon_slug","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","icon_slug","title","description"],"edit":[[{"name":"icon_slug","size":6},{"name":"title","size":6}],[{"name":"description","size":6}]]},"uid":"api::advantage.advantage"}	object	\N	\N
23	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
41	plugin_content_manager_configuration_content_types::api::coefficient.coefficient	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"coefficient":{"edit":{"label":"coefficient","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"coefficient","searchable":true,"sortable":true}},"applies_to":{"edit":{"label":"applies_to","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"applies_to","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","slug","coefficient","applies_to"],"edit":[[{"name":"slug","size":6},{"name":"coefficient","size":4}],[{"name":"applies_to","size":6}]]},"uid":"api::coefficient.coefficient"}	object	\N	\N
42	plugin_content_manager_configuration_content_types::api::login-page.login-page	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"login_background":{"edit":{"label":"login_background","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"login_background","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","login_background","createdAt","updatedAt"],"edit":[[{"name":"login_background","size":6}]]},"uid":"api::login-page.login-page"}	object	\N	\N
43	plugin_content_manager_configuration_content_types::api::tax.tax	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"vat":{"edit":{"label":"vat","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"vat","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","vat","createdAt","updatedAt"],"edit":[[{"name":"vat","size":4}]]},"uid":"api::tax.tax"}	object	\N	\N
20	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::api::contact.contact	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"link":{"edit":{"label":"link","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"link","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","link","slug"],"edit":[[{"name":"title","size":6},{"name":"link","size":6}],[{"name":"slug","size":6}]]},"uid":"api::contact.contact"}	object	\N	\N
21	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
15	plugin_content_manager_configuration_content_types::api::feature-option.feature-option	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"text","defaultSortBy":"text","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"text":{"edit":{"label":"text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"text","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","text","createdAt","updatedAt"],"edit":[[{"name":"text","size":6}]]},"uid":"api::feature-option.feature-option"}	object	\N	\N
25	plugin_content_manager_configuration_content_types::admin::session	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"userId","defaultSortBy":"userId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"userId":{"edit":{"label":"userId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"userId","searchable":true,"sortable":true}},"sessionId":{"edit":{"label":"sessionId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sessionId","searchable":true,"sortable":true}},"childId":{"edit":{"label":"childId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"childId","searchable":true,"sortable":true}},"deviceId":{"edit":{"label":"deviceId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"deviceId","searchable":true,"sortable":true}},"origin":{"edit":{"label":"origin","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"origin","searchable":true,"sortable":true}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"absoluteExpiresAt":{"edit":{"label":"absoluteExpiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"absoluteExpiresAt","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","userId","sessionId","childId"],"edit":[[{"name":"userId","size":6},{"name":"sessionId","size":6}],[{"name":"childId","size":6},{"name":"deviceId","size":6}],[{"name":"origin","size":6},{"name":"expiresAt","size":6}],[{"name":"absoluteExpiresAt","size":6},{"name":"status","size":6}],[{"name":"type","size":6}]]},"uid":"admin::session"}	object	\N	\N
44	core_admin_homepage-layout:1	{"version":1,"widgets":[{"uid":"plugin::admin.key-statistics","width":12},{"uid":"plugin::content-manager.last-edited-entries","width":6},{"uid":"plugin::content-manager.last-published-entries","width":6},{"uid":"plugin::admin.profile-info","width":6},{"uid":"plugin::content-manager.chart-entries","width":6}],"updatedAt":"2025-10-31T16:42:02.053Z"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::api::feature.feature	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":100,"mainField":"slug","defaultSortBy":"slug","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"image_desktop":{"edit":{"label":"image_desktop","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image_desktop","searchable":false,"sortable":false}},"image_mobile":{"edit":{"label":"image_mobile","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image_mobile","searchable":false,"sortable":false}},"options":{"edit":{"label":"options","description":"","placeholder":"","visible":true,"editable":true,"mainField":"text"},"list":{"label":"options","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"slug","size":6},{"name":"title","size":6}],[{"name":"image_desktop","size":6},{"name":"image_mobile","size":6}],[{"name":"options","size":6}]],"list":["id","slug","title","image_desktop","image_mobile","options"]},"uid":"api::feature.feature"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::api::home-page.home-page	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"documentId","defaultSortBy":"documentId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"price_from":{"edit":{"label":"price_from","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price_from","searchable":true,"sortable":true}},"hero_background":{"edit":{"label":"hero_background","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hero_background","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","price_from","createdAt","updatedAt"],"edit":[[{"name":"price_from","size":4},{"name":"hero_background","size":6}]]},"uid":"api::home-page.home-page"}	object	\N	\N
45	plugin_content_manager_configuration_content_types::api::cookie-policy.cookie-policy	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"effective_date","defaultSortBy":"effective_date","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"effective_date":{"edit":{"label":"effective_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"effective_date","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","effective_date","content","createdAt"],"edit":[[{"name":"effective_date","size":6},{"name":"content","size":6}]]},"uid":"api::cookie-policy.cookie-policy"}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
7	{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"addons","indexes":[{"name":"addons_documents_idx","columns":["document_id","locale","published_at"]},{"name":"addons_created_by_id_fk","columns":["created_by_id"]},{"name":"addons_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"addons_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"addons_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"worker_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"client_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"advantages","indexes":[{"name":"advantages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"advantages_created_by_id_fk","columns":["created_by_id"]},{"name":"advantages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"advantages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"advantages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"icon_slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"coefficients","indexes":[{"name":"coefficients_documents_idx","columns":["document_id","locale","published_at"]},{"name":"coefficients_created_by_id_fk","columns":["created_by_id"]},{"name":"coefficients_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"coefficients_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"coefficients_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"coefficient","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"applies_to","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"contacts","indexes":[{"name":"contacts_documents_idx","columns":["document_id","locale","published_at"]},{"name":"contacts_created_by_id_fk","columns":["created_by_id"]},{"name":"contacts_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"contacts_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"contacts_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"link","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"cookie_policies","indexes":[{"name":"cookie_policies_documents_idx","columns":["document_id","locale","published_at"]},{"name":"cookie_policies_created_by_id_fk","columns":["created_by_id"]},{"name":"cookie_policies_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"cookie_policies_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"cookie_policies_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"effective_date","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"features","indexes":[{"name":"features_documents_idx","columns":["document_id","locale","published_at"]},{"name":"features_created_by_id_fk","columns":["created_by_id"]},{"name":"features_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"features_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"features_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"feature_options","indexes":[{"name":"feature_options_documents_idx","columns":["document_id","locale","published_at"]},{"name":"feature_options_created_by_id_fk","columns":["created_by_id"]},{"name":"feature_options_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"feature_options_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"feature_options_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"home_pages","indexes":[{"name":"home_pages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"home_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"home_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"home_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"home_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price_from","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"login_pages","indexes":[{"name":"login_pages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"login_pages_created_by_id_fk","columns":["created_by_id"]},{"name":"login_pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"login_pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"login_pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"privacy_policies","indexes":[{"name":"privacy_policies_documents_idx","columns":["document_id","locale","published_at"]},{"name":"privacy_policies_created_by_id_fk","columns":["created_by_id"]},{"name":"privacy_policies_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"privacy_policies_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"privacy_policies_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"effective_date","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"questions","indexes":[{"name":"questions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"questions_created_by_id_fk","columns":["created_by_id"]},{"name":"questions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"questions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"questions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"question","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"answer","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"reviews","indexes":[{"name":"reviews_documents_idx","columns":["document_id","locale","published_at"]},{"name":"reviews_created_by_id_fk","columns":["created_by_id"]},{"name":"reviews_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"reviews_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"reviews_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"author","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"review","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"services","indexes":[{"name":"services_documents_idx","columns":["document_id","locale","published_at"]},{"name":"services_created_by_id_fk","columns":["created_by_id"]},{"name":"services_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"services_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"services_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"service_price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sqft_price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"worker_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"client_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_bedroom_price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_bedroom_worker_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_bedroom_client_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_bathroom_price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_bathroom_worker_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_bathroom_client_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_kitchen_price","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_kitchen_worker_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"extra_kitchen_client_time","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"taxes","indexes":[{"name":"taxes_documents_idx","columns":["document_id","locale","published_at"]},{"name":"taxes_created_by_id_fk","columns":["created_by_id"]},{"name":"taxes_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"taxes_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"taxes_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"vat","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"terms_of_services","indexes":[{"name":"terms_of_services_documents_idx","columns":["document_id","locale","published_at"]},{"name":"terms_of_services_created_by_id_fk","columns":["created_by_id"]},{"name":"terms_of_services_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"terms_of_services_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"terms_of_services_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"effective_date","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"encrypted_key","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_sessions","indexes":[{"name":"strapi_sessions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"session_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"child_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"device_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"origin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"absolute_expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_ai_localization_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"source_locale","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"target_locales","type":"jsonb","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"features_options_lnk","indexes":[{"name":"features_options_lnk_fk","columns":["feature_id"]},{"name":"features_options_lnk_ifk","columns":["feature_option_id"]},{"name":"features_options_lnk_uq","columns":["feature_id","feature_option_id"],"type":"unique"},{"name":"features_options_lnk_ofk","columns":["feature_option_ord"]}],"foreignKeys":[{"name":"features_options_lnk_fk","columns":["feature_id"],"referencedColumns":["id"],"referencedTable":"features","onDelete":"CASCADE"},{"name":"features_options_lnk_ifk","columns":["feature_option_id"],"referencedColumns":["id"],"referencedTable":"feature_options","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"feature_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"feature_option_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"feature_option_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2025-12-15 21:48:00.42	f34e9380330bf14c4bd2ce08264dd08575ddfa099f8fa1b6997c4d9d2322ecf7
\.


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2025-09-27 03:19:43.494
2	5.0.0-02-created-document-id	2025-09-27 03:19:45.181
3	5.0.0-03-created-locale	2025-09-27 03:19:46.868
4	5.0.0-04-created-published-at	2025-09-27 03:19:48.569
5	5.0.0-05-drop-slug-fields-index	2025-09-27 03:19:50.258
6	core::5.0.0-discard-drafts	2025-09-27 03:19:58.948
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_sessions; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_sessions (id, document_id, user_id, session_id, child_id, device_id, origin, expires_at, absolute_expires_at, status, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	h0p4ytxegjfqs7emnlby71e8	1	527ea3ffad369ccdc7d34a4f86f2aabc	\N	c7f8d922-d9ce-4f99-82f6-0e65a3593c28	admin	2025-09-27 03:03:22.283	2025-10-27 01:03:22.283	active	session	2025-09-27 01:03:22.283	2025-09-27 01:03:22.283	2025-09-27 01:03:22.284	\N	\N	\N
2	hc1z2lvplefe2b6ac1gxjzcb	1	154059da781bd870a0de78ad5d471c0c	\N	c7f8d922-d9ce-4f99-82f6-0e65a3593c28	admin	2025-10-11 16:03:37.855	2025-10-27 16:03:37.855	active	refresh	2025-09-27 16:03:37.855	2025-09-27 16:03:37.855	2025-09-27 16:03:37.859	\N	\N	\N
24	ep6dg010a5z4tawdayq5nm5d	3	2764f38790349a4a0a82118f913d8fbd	a757d0776153de2a5efc433b223d8147	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-10-31 07:11:28.871	2025-11-16 07:11:28.871	rotated	refresh	2025-10-17 07:11:28.871	2025-10-17 08:11:18.753	2025-10-17 07:11:28.873	\N	\N	\N
11	zdshqxipclbtnoai73sirbro	1	bc0dc892489cc2faf3d86e05bcb2ee7d	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-13 22:29:14.594	2025-11-12 20:29:14.594	active	session	2025-10-13 20:29:14.594	2025-10-13 20:29:14.594	2025-10-13 20:29:14.594	\N	\N	\N
25	kd4ljfv048cspmoh6lru8aga	3	a757d0776153de2a5efc433b223d8147	614b35b8bde30ca9bcd4e46486186a8f	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-10-31 08:11:18.742	2025-11-16 07:11:28.871	rotated	refresh	2025-10-17 08:11:18.743	2025-10-17 08:46:45.024	2025-10-17 08:11:18.743	\N	\N	\N
33	thcfi846jhhgmixn675pdu5j	3	614b35b8bde30ca9bcd4e46486186a8f	3a366f17c47c91c2711e96927837e094	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-10-31 08:46:45.015	2025-11-16 07:11:28.871	rotated	refresh	2025-10-17 08:46:45.015	2025-10-17 09:25:19.77	2025-10-17 08:46:45.015	\N	\N	\N
32	v1po16jag6r7t840bom4qds2	1	39440ae912ae5a85d0746b75f0dae08e	746805eb37745583fbccee57c3e2d874	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-10-31 08:24:27.607	2025-11-16 08:24:27.607	rotated	refresh	2025-10-17 08:24:27.607	2025-10-17 09:59:01.835	2025-10-17 08:24:27.607	\N	\N	\N
34	m0a44dkgvo2gdu0s3x144hze	3	3a366f17c47c91c2711e96927837e094	f089ee15b2cc91edbe91d4bfddfade66	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-10-31 09:25:19.759	2025-11-16 07:11:28.871	rotated	refresh	2025-10-17 09:25:19.76	2025-10-17 10:29:07.637	2025-10-17 09:25:19.76	\N	\N	\N
36	ccv620yjde9alpi0ckm9ot13	3	f089ee15b2cc91edbe91d4bfddfade66	9ff2f6ed67d90698091bedb68d6c9613	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-10-31 10:29:07.621	2025-11-16 07:11:28.871	rotated	refresh	2025-10-17 10:29:07.621	2025-10-17 14:54:29.079	2025-10-17 10:29:07.621	\N	\N	\N
35	u8u3npoooymvsirh16lpt9wb	1	746805eb37745583fbccee57c3e2d874	107c269b720813a0035a3cc9330ed498	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-10-31 09:59:01.823	2025-11-16 08:24:27.607	rotated	refresh	2025-10-17 09:59:01.824	2025-10-19 18:01:44.182	2025-10-17 09:59:01.824	\N	\N	\N
37	wdorvl0rxprow4gw0iyajlgr	3	9ff2f6ed67d90698091bedb68d6c9613	f3246a3ac22fd14d0e1b2ff882d7526b	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-10-31 14:54:29.045	2025-11-16 07:11:28.871	rotated	refresh	2025-10-17 14:54:29.047	2025-10-21 07:19:32.704	2025-10-17 14:54:29.048	\N	\N	\N
39	ni1ay8cwsi7do2phkustyrs7	3	f3246a3ac22fd14d0e1b2ff882d7526b	162f6cffead0833da3a1c39d8f3b8d32	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-04 07:19:32.693	2025-11-16 07:11:28.871	rotated	refresh	2025-10-21 07:19:32.695	2025-10-21 07:54:04.517	2025-10-21 07:19:32.696	\N	\N	\N
38	iaorksj1ah3sm14f6oji0221	1	107c269b720813a0035a3cc9330ed498	3450180df07ab6f7ee3592236ee4f4d1	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-02 18:01:44.156	2025-11-16 08:24:27.607	rotated	refresh	2025-10-19 18:01:44.158	2025-10-22 13:07:52.693	2025-10-19 18:01:44.161	\N	\N	\N
41	j8an5xrnvvn5rlminqooh21d	1	3450180df07ab6f7ee3592236ee4f4d1	499a3c8e34246a346a41b46ff8f1aa87	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-05 13:07:52.676	2025-11-16 08:24:27.607	rotated	refresh	2025-10-22 13:07:52.679	2025-10-22 19:00:33.171	2025-10-22 13:07:52.681	\N	\N	\N
42	t38z6w1uupv6oxco9ukjffgn	1	499a3c8e34246a346a41b46ff8f1aa87	e6d00f18dc2842c5e3d2d0b127c264e1	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-05 19:00:33.159	2025-11-16 08:24:27.607	rotated	refresh	2025-10-22 19:00:33.159	2025-10-22 22:41:00.138	2025-10-22 19:00:33.159	\N	\N	\N
40	cpjmjgzornxl6oajf4gzyt20	3	162f6cffead0833da3a1c39d8f3b8d32	669c79cc21adf6f4e29ddc638c1a4fd9	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-04 07:54:04.504	2025-11-16 07:11:28.871	rotated	refresh	2025-10-21 07:54:04.505	2025-10-23 08:40:00.216	2025-10-21 07:54:04.506	\N	\N	\N
44	oeczfnyk9bsb1matnjw32hbf	3	669c79cc21adf6f4e29ddc638c1a4fd9	1959832fd6420695f6dd0f332eeaf332	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-06 08:40:00.202	2025-11-16 07:11:28.871	rotated	refresh	2025-10-23 08:40:00.203	2025-10-23 09:11:39.173	2025-10-23 08:40:00.205	\N	\N	\N
45	w6vim4v8hn9wrk4irb61t2v8	3	1959832fd6420695f6dd0f332eeaf332	a741e5e543a9b84f151eb553f9a3b29a	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-06 09:11:39.161	2025-11-16 07:11:28.871	rotated	refresh	2025-10-23 09:11:39.162	2025-10-23 09:58:53.09	2025-10-23 09:11:39.164	\N	\N	\N
46	sgdersws3xiuht7gg79ow2u2	3	a741e5e543a9b84f151eb553f9a3b29a	f66068cb9397ebfae8c2ab5469f0bc0b	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-06 09:58:53.078	2025-11-16 07:11:28.871	rotated	refresh	2025-10-23 09:58:53.079	2025-10-23 10:33:50.557	2025-10-23 09:58:53.08	\N	\N	\N
47	e46s3ev6uysswfc1xjck2qy3	3	f66068cb9397ebfae8c2ab5469f0bc0b	6242634a731b79317a3ff3b7a02e39c8	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-06 10:33:50.549	2025-11-16 07:11:28.871	rotated	refresh	2025-10-23 10:33:50.549	2025-10-23 11:32:59.367	2025-10-23 10:33:50.55	\N	\N	\N
43	ve7tb1fz72ldt6o9gfmoat75	1	e6d00f18dc2842c5e3d2d0b127c264e1	625107562f3802bfc11cf7bc84b1fffa	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-05 22:41:00.116	2025-11-16 08:24:27.607	rotated	refresh	2025-10-22 22:41:00.117	2025-10-23 13:00:46.354	2025-10-22 22:41:00.121	\N	\N	\N
49	q9rr5lai8lfd78fnk0yo1z2h	1	625107562f3802bfc11cf7bc84b1fffa	82f90c79da2c3c78fb627416891b8c3e	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-06 13:00:46.326	2025-11-16 08:24:27.607	rotated	refresh	2025-10-23 13:00:46.327	2025-10-23 15:23:11.744	2025-10-23 13:00:46.328	\N	\N	\N
48	mnx8wd3hc0jbgvwbx5w2skun	3	6242634a731b79317a3ff3b7a02e39c8	4c097f363c180b5929c7b2e008543958	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-06 11:32:59.36	2025-11-16 07:11:28.871	rotated	refresh	2025-10-23 11:32:59.361	2025-10-24 06:47:48.442	2025-10-23 11:32:59.361	\N	\N	\N
50	zgycy2h1pbxe8o9fsbejrway	1	82f90c79da2c3c78fb627416891b8c3e	f4de607632a62af6b5f465dfb79e7ca5	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-06 15:23:11.727	2025-11-16 08:24:27.607	rotated	refresh	2025-10-23 15:23:11.727	2025-10-24 15:29:47.969	2025-10-23 15:23:11.729	\N	\N	\N
52	nmn9l0a77gioxiq3mseinwn1	1	f4de607632a62af6b5f465dfb79e7ca5	1db0e395b368479878e3086abb5ae1a1	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-07 15:29:47.951	2025-11-16 08:24:27.607	rotated	refresh	2025-10-24 15:29:47.951	2025-10-24 20:23:49.996	2025-10-24 15:29:47.955	\N	\N	\N
55	xk9us6uqe0rz4cepdzkl6tqn	1	909286a98a9e9e1b5715691680d58fb0	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-24 23:24:59.09	2025-11-23 20:54:26.609	active	session	2025-10-24 21:24:59.091	2025-10-24 21:24:59.091	2025-10-24 21:24:59.098	\N	\N	\N
54	l0hxyqabbf17z55pstk0dkb9	1	baf93250ea785967c81cd45e8a938816	909286a98a9e9e1b5715691680d58fb0	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-24 22:54:26.609	2025-11-23 20:54:26.609	rotated	session	2025-10-24 20:54:26.61	2025-10-24 21:24:59.119	2025-10-24 20:54:26.611	\N	\N	\N
53	fhrz7th5sfg698sm9t49680q	1	1db0e395b368479878e3086abb5ae1a1	72d9556c411b179db5a55ddcc1e8f016	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-07 20:23:49.984	2025-11-16 08:24:27.607	rotated	refresh	2025-10-24 20:23:49.985	2025-10-24 21:35:07.159	2025-10-24 20:23:49.986	\N	\N	\N
57	ofvevc7fjtekq9qxxpvazjfw	1	eccd323b003d5553a1a873e4ed613772	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-25 09:43:07.747	2025-11-24 07:43:07.747	active	session	2025-10-25 07:43:07.748	2025-10-25 07:43:07.748	2025-10-25 07:43:07.753	\N	\N	\N
58	ul6hd1is2fkuetisuf78g17c	1	a9e4a52e290a2ca2169ff2351c1602d2	94d90ac5916a3bbc8e2f4e4879977104	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-25 13:59:49.415	2025-11-24 11:59:49.415	rotated	session	2025-10-25 11:59:49.415	2025-10-25 12:34:10.109	2025-10-25 11:59:49.417	\N	\N	\N
59	y9g951q8exvfb6361n8t5950	1	94d90ac5916a3bbc8e2f4e4879977104	7712f612c8e80ef32198ab9dffe3f0dc	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-25 14:34:10.1	2025-11-24 11:59:49.415	rotated	session	2025-10-25 12:34:10.1	2025-10-25 14:16:22.176	2025-10-25 12:34:10.101	\N	\N	\N
60	r1vhu3rj7qc48theyni8pkme	1	946e8fb5cc2c44e4172b35f4924cb7ad	d9b81edb57df4aa544ff22b88693dc15	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-08 14:16:14.248	2025-11-16 08:24:27.607	rotated	refresh	2025-10-25 14:16:14.249	2025-10-25 18:14:36.665	2025-10-25 14:16:14.251	\N	\N	\N
51	sswlroqgvsp1vizr6o4yq9go	3	4c097f363c180b5929c7b2e008543958	1757c48630f454c11788b2d061740422	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-07 06:47:48.432	2025-11-16 07:11:28.871	rotated	refresh	2025-10-24 06:47:48.433	2025-10-27 09:44:46.13	2025-10-24 06:47:48.434	\N	\N	\N
56	w7ittdzifz3hy2pg0plru475	1	72d9556c411b179db5a55ddcc1e8f016	946e8fb5cc2c44e4172b35f4924cb7ad	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-07 21:35:07.138	2025-11-16 08:24:27.607	rotated	refresh	2025-10-24 21:35:07.139	2025-10-25 14:16:14.268	2025-10-24 21:35:07.142	\N	\N	\N
62	medpzpbokgy9cdnfw4t0k4hb	1	fef853f4293f43634cb7d15b17055039	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-25 16:47:21.756	2025-11-24 11:59:49.415	active	session	2025-10-25 14:47:21.757	2025-10-25 14:47:21.757	2025-10-25 14:47:21.761	\N	\N	\N
61	v0fyhj4t0bevj60utmymssuz	1	7712f612c8e80ef32198ab9dffe3f0dc	fef853f4293f43634cb7d15b17055039	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-25 16:16:22.151	2025-11-24 11:59:49.415	rotated	session	2025-10-25 14:16:22.151	2025-10-25 14:47:21.772	2025-10-25 14:16:22.152	\N	\N	\N
64	hpbs8dohr0ha3lx7pi19ljfi	1	730cb05450daa0b01fec222ed6a90d0f	1945f37218b87ff5c639d85c9d424d06	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-25 22:50:40.132	2025-11-24 20:50:40.132	rotated	session	2025-10-25 20:50:40.132	2025-10-25 21:39:18.28	2025-10-25 20:50:40.134	\N	\N	\N
66	bt8kpw75zk4sj28410rqip75	1	32144c56975d60c1ecfa0f838bd129e9	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-26 00:34:11.796	2025-11-24 20:50:40.132	active	session	2025-10-25 22:34:11.796	2025-10-25 22:34:11.796	2025-10-25 22:34:11.796	\N	\N	\N
65	qdmo82rksbzh1dotepwt8tuy	1	1945f37218b87ff5c639d85c9d424d06	32144c56975d60c1ecfa0f838bd129e9	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-25 23:39:18.268	2025-11-24 20:50:40.132	rotated	session	2025-10-25 21:39:18.269	2025-10-25 22:34:11.803	2025-10-25 21:39:18.27	\N	\N	\N
67	ndg77wxrrkijm42lhfg3h75v	1	42657391700f210d6ab4e315fd849b1c	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-26 15:49:45.589	2025-11-25 13:49:45.589	active	session	2025-10-26 13:49:45.589	2025-10-26 13:49:45.589	2025-10-26 13:49:45.593	\N	\N	\N
68	cjh5xxpbx4nt4043g9r6xw0p	1	570f29c5a25e5a43cac02f4f9946866b	\N	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-10 03:07:05.401	2025-11-16 08:24:27.607	active	refresh	2025-10-27 03:07:05.401	2025-10-27 03:07:05.401	2025-10-27 03:07:05.402	\N	\N	\N
63	z8ahgufkhpufdaizkwlbtc86	1	d9b81edb57df4aa544ff22b88693dc15	570f29c5a25e5a43cac02f4f9946866b	df1c5203-8eba-4039-8dc4-31ca5a0a4834	admin	2025-11-08 18:14:36.651	2025-11-16 08:24:27.607	rotated	refresh	2025-10-25 18:14:36.652	2025-10-27 03:07:05.417	2025-10-25 18:14:36.653	\N	\N	\N
69	lq8ui1ywqtt8h1rmeylx98le	3	1757c48630f454c11788b2d061740422	d7b382b4015992743834d0eec4c48f30	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-10 09:44:46.12	2025-11-16 07:11:28.871	rotated	refresh	2025-10-27 09:44:46.12	2025-10-27 10:21:45.896	2025-10-27 09:44:46.121	\N	\N	\N
71	o5zxff55piubxnzwgvqsd5oa	1	10eb71d618a1573dcd862b6fbb07ad88	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-27 17:54:14.198	2025-11-26 15:54:14.198	active	session	2025-10-27 15:54:14.198	2025-10-27 15:54:14.198	2025-10-27 15:54:14.199	\N	\N	\N
70	oe3m35vu9ikumus5w1jx27dj	3	d7b382b4015992743834d0eec4c48f30	1effd2c2d615425bf078c27a012276a7	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-10 10:21:45.872	2025-11-16 07:11:28.871	rotated	refresh	2025-10-27 10:21:45.872	2025-10-28 13:02:06.414	2025-10-27 10:21:45.875	\N	\N	\N
72	knjypuzlarv8av048cdxq162	1	800a9771624390392c17ba4422dc0b7f	824448f3d99350054abffd7a10998b85	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-10 16:06:15.591	2025-11-26 16:06:15.591	rotated	refresh	2025-10-27 16:06:15.591	2025-10-28 13:25:03.367	2025-10-27 16:06:15.591	\N	\N	\N
74	f5fvc9szi3pakq8ylvcql1kd	1	824448f3d99350054abffd7a10998b85	4368b374b5dc2a602e45ae6ad633e3b4	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-11 13:25:03.335	2025-11-26 16:06:15.591	rotated	refresh	2025-10-28 13:25:03.336	2025-10-29 00:52:56.779	2025-10-28 13:25:03.337	\N	\N	\N
73	wl4da7d0rfb66yt3i7s6nocd	3	1effd2c2d615425bf078c27a012276a7	4f3273456014afa2ee0bee101fe1b0b3	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-11 13:02:06.392	2025-11-16 07:11:28.871	rotated	refresh	2025-10-28 13:02:06.393	2025-10-29 10:41:59.329	2025-10-28 13:02:06.398	\N	\N	\N
75	d0v6htqkjomroi78jsm9prr9	1	4368b374b5dc2a602e45ae6ad633e3b4	7f7860e64d74335e396c8537f869ec2f	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-12 00:52:56.757	2025-11-26 16:06:15.591	rotated	refresh	2025-10-29 00:52:56.757	2025-10-29 14:19:56.92	2025-10-29 00:52:56.761	\N	\N	\N
77	f6h8h16i9fesdudx25m4uuy1	1	7f7860e64d74335e396c8537f869ec2f	649050fdfe9b2bf25baac564f1395292	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-12 14:19:56.905	2025-11-26 16:06:15.591	rotated	refresh	2025-10-29 14:19:56.906	2025-10-29 14:50:33.545	2025-10-29 14:19:56.906	\N	\N	\N
76	w0womo20xcysdljxyk1rc25b	3	4f3273456014afa2ee0bee101fe1b0b3	96149ab111561e3062c91ebe05924a84	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-12 10:41:59.316	2025-11-16 07:11:28.871	rotated	refresh	2025-10-29 10:41:59.317	2025-10-29 16:01:16.21	2025-10-29 10:41:59.319	\N	\N	\N
79	ikvjlm12cx8g84a7zx1fu1pp	3	96149ab111561e3062c91ebe05924a84	961a445654336f965df5617addae92ce	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-12 16:01:16.202	2025-11-16 07:11:28.871	rotated	refresh	2025-10-29 16:01:16.202	2025-10-29 16:31:53.531	2025-10-29 16:01:16.202	\N	\N	\N
80	jmms0kxiy7j16ysxsqranb5y	3	961a445654336f965df5617addae92ce	1267a65961d6d761d50576642da6747d	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-12 16:31:53.521	2025-11-16 07:11:28.871	rotated	refresh	2025-10-29 16:31:53.521	2025-10-29 21:35:12.012	2025-10-29 16:31:53.522	\N	\N	\N
78	bu1n77ard0u9vpicyqk01i4a	1	649050fdfe9b2bf25baac564f1395292	2e8f08efe63f47b94d019a4a8e71ff04	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-12 14:50:33.526	2025-11-26 16:06:15.591	rotated	refresh	2025-10-29 14:50:33.526	2025-10-30 07:09:21.308	2025-10-29 14:50:33.527	\N	\N	\N
82	kc3kp53q1nxvv5rw3h7ur8a4	1	2e8f08efe63f47b94d019a4a8e71ff04	62a484a0512c971740e6e9e43a192aaa	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-13 07:09:21.265	2025-11-26 16:06:15.591	rotated	refresh	2025-10-30 07:09:21.267	2025-10-30 07:42:02.687	2025-10-30 07:09:21.273	\N	\N	\N
84	a1ys8iw58u29vkfbfrgq1pn1	1	1ce982b02fe145d7b0b991ff3981dd96	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-30 11:52:01.574	2025-11-29 09:52:01.574	active	session	2025-10-30 09:52:01.575	2025-10-30 09:52:01.575	2025-10-30 09:52:01.576	\N	\N	\N
81	kmrll1d7yjqvu609g1ks4t36	3	1267a65961d6d761d50576642da6747d	75ee4fe09f79daa3ae732978e7ab8e43	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-12 21:35:12.001	2025-11-16 07:11:28.871	rotated	refresh	2025-10-29 21:35:12.002	2025-10-30 14:37:41.385	2025-10-29 21:35:12.003	\N	\N	\N
83	ngfwznpydpezolphl5reqgts	1	62a484a0512c971740e6e9e43a192aaa	e8838acc8e317b0b2dc05c6ccccb6f8e	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-13 07:42:02.668	2025-11-26 16:06:15.591	rotated	refresh	2025-10-30 07:42:02.669	2025-10-30 22:00:41.083	2025-10-30 07:42:02.671	\N	\N	\N
86	q60xda68uc0l8s4aolzf9g89	1	e8838acc8e317b0b2dc05c6ccccb6f8e	d98003b0f97d47f2fda6f15959398ed0	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-13 22:00:41.063	2025-11-26 16:06:15.591	rotated	refresh	2025-10-30 22:00:41.064	2025-10-31 14:17:41.344	2025-10-30 22:00:41.066	\N	\N	\N
87	aaf5huylb1gqy2qw4cbk6edm	1	d98003b0f97d47f2fda6f15959398ed0	1f6d66b2f03a6a0c49a66633008dc4e5	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-14 14:17:41.308	2025-11-26 16:06:15.591	rotated	refresh	2025-10-31 14:17:41.313	2025-10-31 14:48:52.307	2025-10-31 14:17:41.318	\N	\N	\N
89	r2p7qx2nt4t6mzl60ofve6wu	1	362dcc27f9ca6407649fc71f9264af03	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-10-31 16:49:55.956	2025-11-30 14:49:55.956	active	session	2025-10-31 14:49:55.956	2025-10-31 14:49:55.956	2025-10-31 14:49:55.957	\N	\N	\N
88	bto2lpzn0cupxrok3fs8rjmv	1	1f6d66b2f03a6a0c49a66633008dc4e5	d353216a4c860f842fb9d64171dc7893	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-14 14:48:52.275	2025-11-26 16:06:15.591	rotated	refresh	2025-10-31 14:48:52.277	2025-10-31 15:30:27.292	2025-10-31 14:48:52.284	\N	\N	\N
90	sfgdqqsoadp9tiqsebq5bbbd	1	d353216a4c860f842fb9d64171dc7893	f671dd9fb96c2a3976dc6fde7921e58a	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-14 15:30:27.147	2025-11-26 16:06:15.591	rotated	refresh	2025-10-31 15:30:27.153	2025-10-31 16:04:48.273	2025-10-31 15:30:27.16	\N	\N	\N
91	oyyn8w2zceqm733b8jf1hvie	1	f671dd9fb96c2a3976dc6fde7921e58a	29765400d59d20c31ce39e687c2e6799	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-14 16:04:48.252	2025-11-26 16:06:15.591	rotated	refresh	2025-10-31 16:04:48.253	2025-10-31 16:39:44.615	2025-10-31 16:04:48.255	\N	\N	\N
92	dju4yi42paem19qdgk6vjo83	1	29765400d59d20c31ce39e687c2e6799	632bc1bf57cdf35bf70e600a5d6f2993	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-14 16:39:44.592	2025-11-26 16:06:15.591	rotated	refresh	2025-10-31 16:39:44.593	2025-10-31 17:20:15.294	2025-10-31 16:39:44.594	\N	\N	\N
85	cn9qt27q2hl7i2xpg87in85m	3	75ee4fe09f79daa3ae732978e7ab8e43	98e33172b5108d155b8fcc2b5439d143	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-13 14:37:41.35	2025-11-16 07:11:28.871	rotated	refresh	2025-10-30 14:37:41.351	2025-11-03 10:45:44.124	2025-10-30 14:37:41.353	\N	\N	\N
94	pg14mzs8h8yvfy4mwi1uth0k	3	98e33172b5108d155b8fcc2b5439d143	d38a024f4657d1e7be574ed6e1c9a3f9	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-17 10:45:44.079	2025-11-16 07:11:28.871	rotated	refresh	2025-11-03 10:45:44.081	2025-11-03 16:28:14.903	2025-11-03 10:45:44.091	\N	\N	\N
95	nn9rllja6inzo5qarbfgdeha	3	d38a024f4657d1e7be574ed6e1c9a3f9	21f287075a6a2a090da16feca9fc4fae	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-17 16:28:14.884	2025-11-16 07:11:28.871	rotated	refresh	2025-11-03 16:28:14.884	2025-11-04 10:12:06.895	2025-11-03 16:28:14.887	\N	\N	\N
96	kjod04xf34eolb7esm0dif0n	1	4ca4b26b3b14816c87f810e37c321706	2c59209e7a034e53ac391b3ff78bde0f	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-18 01:37:34.831	2025-11-26 16:06:15.591	rotated	refresh	2025-11-04 01:37:34.831	2025-11-04 11:47:47.634	2025-11-04 01:37:34.844	\N	\N	\N
93	pa4chfrr6xi8rvklbpn9b6cc	1	632bc1bf57cdf35bf70e600a5d6f2993	4ca4b26b3b14816c87f810e37c321706	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-14 17:20:15.273	2025-11-26 16:06:15.591	rotated	refresh	2025-10-31 17:20:15.274	2025-11-04 01:37:34.937	2025-10-31 17:20:15.275	\N	\N	\N
97	q3i0epn6tnsa08k11sbnumjk	3	21f287075a6a2a090da16feca9fc4fae	389c91748002704d6dec9b65835116ca	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-18 10:12:06.843	2025-11-16 07:11:28.871	rotated	refresh	2025-11-04 10:12:06.848	2025-11-04 11:44:20.022	2025-11-04 10:12:06.852	\N	\N	\N
99	ocwiwftmqeo88ntiizt07tco	1	2c59209e7a034e53ac391b3ff78bde0f	47c2e0f2c41dd75d17a1abdb46122795	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-18 11:47:47.619	2025-11-26 16:06:15.591	rotated	refresh	2025-11-04 11:47:47.619	2025-11-04 12:55:14.792	2025-11-04 11:47:47.62	\N	\N	\N
100	ze1iqzl4m1rjzwrm9q8clop4	1	47c2e0f2c41dd75d17a1abdb46122795	3bc9807b6a237cb0d2e729797d781028	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-18 12:55:14.768	2025-11-26 16:06:15.591	rotated	refresh	2025-11-04 12:55:14.769	2025-11-04 16:51:57.74	2025-11-04 12:55:14.773	\N	\N	\N
102	tz4vnc6r2598sh40073422r7	1	bc0398bc2d857932311a9cc5c4bc42df	192695ceecbee5912ed3f0774c9f38d8	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-05 14:04:09.334	2025-12-05 12:04:09.334	rotated	session	2025-11-05 12:04:09.335	2025-11-05 13:16:09.853	2025-11-05 12:04:09.341	\N	\N	\N
104	my98yl4y0k4ewudhwdy39xjn	1	23d205cf9295b7710c9a6769b5ef244c	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-05 16:08:42.065	2025-12-05 12:04:09.334	active	session	2025-11-05 14:08:42.065	2025-11-05 14:08:42.065	2025-11-05 14:08:42.067	\N	\N	\N
103	bcb4vck5yk82wk21neuxrb95	1	192695ceecbee5912ed3f0774c9f38d8	23d205cf9295b7710c9a6769b5ef244c	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-05 15:16:09.841	2025-12-05 12:04:09.334	rotated	session	2025-11-05 13:16:09.841	2025-11-05 14:08:42.078	2025-11-05 13:16:09.843	\N	\N	\N
105	nxpzr4kfcl6k9eexdz9rpcv8	1	ffc87b326855859f0e174f070f553a23	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-05 19:04:10.426	2025-12-05 17:04:10.426	active	session	2025-11-05 17:04:10.426	2025-11-05 17:04:10.426	2025-11-05 17:04:10.428	\N	\N	\N
106	hchycdvpm3xwb5neqwhe6q5u	1	2b1560b3964a12f0e6d101f44fbe8943	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-06 00:04:12.707	2025-12-05 22:04:12.707	active	session	2025-11-05 22:04:12.708	2025-11-05 22:04:12.708	2025-11-05 22:04:12.708	\N	\N	\N
98	x1wg9c6dlmh0suy2uphiordd	3	389c91748002704d6dec9b65835116ca	51f1590b2ba93c7703831ed0f7743a61	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-18 11:44:20.002	2025-11-16 07:11:28.871	rotated	refresh	2025-11-04 11:44:20.004	2025-11-06 13:43:24.518	2025-11-04 11:44:20.007	\N	\N	\N
108	v1qaiwny6qfdz4rp4tmhd4x4	1	ddb0fe37c8a2e4fe8dc761174a819e33	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-06 16:33:27.727	2025-12-06 14:33:27.727	active	session	2025-11-06 14:33:27.727	2025-11-06 14:33:27.727	2025-11-06 14:33:27.727	\N	\N	\N
109	f30wh1gh3k2hhl5ib5rwbftq	1	285765b3b6f724ba3494d3e7fe923017	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-06 22:03:30.458	2025-12-06 20:03:30.458	active	session	2025-11-06 20:03:30.458	2025-11-06 20:03:30.458	2025-11-06 20:03:30.46	\N	\N	\N
107	eh4jgqj8jbib3hkpou7u8iwy	3	51f1590b2ba93c7703831ed0f7743a61	39e3528c57e069bb6fef7b7488c75d76	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-20 13:43:24.492	2025-11-16 07:11:28.871	rotated	refresh	2025-11-06 13:43:24.493	2025-11-07 07:16:41.333	2025-11-06 13:43:24.494	\N	\N	\N
101	pg16gptm5qqq9y0e7e0m6xti	1	3bc9807b6a237cb0d2e729797d781028	053b2932e5519c6beb1025bb73656db5	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-18 16:51:57.727	2025-11-26 16:06:15.591	rotated	refresh	2025-11-04 16:51:57.728	2025-11-07 13:05:33.623	2025-11-04 16:51:57.729	\N	\N	\N
110	mql7aq93m28spdasocicq9gm	3	39e3528c57e069bb6fef7b7488c75d76	92f94322455df8ed11cf6ae843d97360	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-21 07:16:41.32	2025-11-16 07:11:28.871	rotated	refresh	2025-11-07 07:16:41.321	2025-11-07 14:12:39.827	2025-11-07 07:16:41.322	\N	\N	\N
112	nw895fqwi3l7nunu7fegyxco	3	92f94322455df8ed11cf6ae843d97360	7f001b1b8035888589b9e615783ebf4d	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-21 14:12:39.816	2025-11-16 07:11:28.871	rotated	refresh	2025-11-07 14:12:39.816	2025-11-07 14:12:40.068	2025-11-07 14:12:39.817	\N	\N	\N
114	ppwsgjrg993m2rxuehsqhfqf	1	bbf79901214ffad3209107a5e4c93c66	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-07 19:55:37.371	2025-12-07 17:55:37.371	active	session	2025-11-07 17:55:37.372	2025-11-07 17:55:37.372	2025-11-07 17:55:37.373	\N	\N	\N
115	n02ynfmrq4qroc6l5tlc2avs	1	4605f40129f98bd88c47e3398420f051	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-09 21:01:17.866	2025-12-09 19:01:17.866	active	session	2025-11-09 19:01:17.867	2025-11-09 19:01:17.867	2025-11-09 19:01:17.869	\N	\N	\N
111	s1wp2xsqkeo0j2np8wl86qtr	1	053b2932e5519c6beb1025bb73656db5	b5cedcabd14aa62b3116f2272ee2534a	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-21 13:05:33.606	2025-11-26 16:06:15.591	rotated	refresh	2025-11-07 13:05:33.606	2025-11-09 20:16:05.507	2025-11-07 13:05:33.607	\N	\N	\N
113	wzdu7c98npmpvkjthop70ilk	3	7f001b1b8035888589b9e615783ebf4d	17bc5ff76c366f1698691ed23f8f4209	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-21 14:12:40.06	2025-11-16 07:11:28.871	rotated	refresh	2025-11-07 14:12:40.06	2025-11-09 20:26:54.706	2025-11-07 14:12:40.061	\N	\N	\N
117	vxq4o41y7zwh9vcsos0fhb8x	3	17bc5ff76c366f1698691ed23f8f4209	8348233a595cd4c47203d33f29afc9d9	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-23 20:26:54.695	2025-11-16 07:11:28.871	rotated	refresh	2025-11-09 20:26:54.695	2025-11-10 10:20:09.511	2025-11-09 20:26:54.696	\N	\N	\N
119	c6uskarj44fw5qly2j7mgwlu	1	0767715ed176dc1a4a3263fa3eb4f4ab	3fd62f3a2a6c11a958ad5ea3e34d1d64	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-10 17:59:26.051	2025-12-10 15:59:26.051	rotated	session	2025-11-10 15:59:26.051	2025-11-10 16:42:12.489	2025-11-10 15:59:26.052	\N	\N	\N
121	vdc09s13vzwy6d0wj6w3ybx7	1	559abaf15b81a4f8dceea614f278bd81	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-10 19:14:17.573	2025-12-10 15:59:26.051	active	session	2025-11-10 17:14:17.573	2025-11-10 17:14:17.573	2025-11-10 17:14:17.574	\N	\N	\N
120	kn2959iz6881vlks0u99u1kn	1	3fd62f3a2a6c11a958ad5ea3e34d1d64	559abaf15b81a4f8dceea614f278bd81	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-10 18:42:12.476	2025-12-10 15:59:26.051	rotated	session	2025-11-10 16:42:12.477	2025-11-10 17:14:17.583	2025-11-10 16:42:12.478	\N	\N	\N
116	wrlf1ngrr885a8hi3pjvoo6d	1	b5cedcabd14aa62b3116f2272ee2534a	556a16538f639b4a7f962f94387be01a	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-23 20:16:05.441	2025-11-26 16:06:15.591	rotated	refresh	2025-11-09 20:16:05.441	2025-11-10 19:01:00.884	2025-11-09 20:16:05.442	\N	\N	\N
122	da16z8uqnymcu9h9wdapb3fz	1	556a16538f639b4a7f962f94387be01a	025600d436db9cbd33581362a2428132	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-24 19:01:00.809	2025-11-26 16:06:15.591	rotated	refresh	2025-11-10 19:01:00.81	2025-11-10 21:07:15.132	2025-11-10 19:01:00.81	\N	\N	\N
124	d59m8g61cb8wbi1olt0gt8k4	1	a1d8d51aec2d5cdd03e06167e9602388	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-11 16:04:12.401	2025-12-11 14:04:12.401	active	session	2025-11-11 14:04:12.401	2025-11-11 14:04:12.401	2025-11-11 14:04:12.402	\N	\N	\N
125	zhyx2lfh1d4po5lsv3epo0xb	1	23819b45c68f1fa6c6054bd9adff1f39	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-12 13:54:04.591	2025-12-12 11:54:04.591	active	session	2025-11-12 11:54:04.591	2025-11-12 11:54:04.591	2025-11-12 11:54:04.592	\N	\N	\N
126	elgyhjtlyvu26440kw59nb4q	1	bd97632c096bf8297dbb88766a0e70f5	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-12 16:24:16.035	2025-12-12 14:24:16.035	active	session	2025-11-12 14:24:16.035	2025-11-12 14:24:16.035	2025-11-12 14:24:16.036	\N	\N	\N
127	e5gc2jyrssxqh07qeydk3a5g	1	1541bf66d6bb9f41249dba648592ee76	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-12 19:22:47.488	2025-12-12 17:22:47.488	active	session	2025-11-12 17:22:47.488	2025-11-12 17:22:47.488	2025-11-12 17:22:47.489	\N	\N	\N
123	caek94sq22nb1x3hx4ypoof1	1	025600d436db9cbd33581362a2428132	53eddb2079deeb497106da672cd16a25	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-24 21:07:15.121	2025-11-26 16:06:15.591	rotated	refresh	2025-11-10 21:07:15.122	2025-11-13 14:18:34.885	2025-11-10 21:07:15.123	\N	\N	\N
129	x07ispxaookkur59bpqwlsgj	3	a5373a55a5b465b2f48fc3c3cec5b3e1	\N	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-27 14:20:55.738	2025-11-16 07:11:28.871	active	refresh	2025-11-13 14:20:55.738	2025-11-13 14:20:55.738	2025-11-13 14:20:55.739	\N	\N	\N
118	d325vrn3ne2va9pczyqdvq2a	3	8348233a595cd4c47203d33f29afc9d9	a5373a55a5b465b2f48fc3c3cec5b3e1	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-24 10:20:09.49	2025-11-16 07:11:28.871	rotated	refresh	2025-11-10 10:20:09.491	2025-11-13 14:20:55.747	2025-11-10 10:20:09.493	\N	\N	\N
128	fdrb7u8b24ek6z48nq3alh81	1	53eddb2079deeb497106da672cd16a25	b40533477fb47a7e485f6d4206fee088	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-27 14:18:34.863	2025-11-26 16:06:15.591	rotated	refresh	2025-11-13 14:18:34.864	2025-11-13 15:36:50.804	2025-11-13 14:18:34.865	\N	\N	\N
131	rshme528h3p3tjv99xdjnx3w	1	0553d5d10ba663aaa250196c12b89501	d920841961b8c1b18f03df189f4405d6	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-13 17:16:16.158	2025-12-13 14:35:30.635	rotated	session	2025-11-13 15:16:16.158	2025-11-13 16:58:41.823	2025-11-13 15:16:16.159	\N	\N	\N
130	axl1tonmjcle2jc33syk4za9	1	45351edba774164ed6121b6351e6e2a4	0553d5d10ba663aaa250196c12b89501	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-13 16:35:30.635	2025-12-13 14:35:30.635	rotated	session	2025-11-13 14:35:30.635	2025-11-13 15:16:16.17	2025-11-13 14:35:30.636	\N	\N	\N
132	kpns9rdigd62r1sfzhrwoyz6	1	b40533477fb47a7e485f6d4206fee088	371d917439042edde1d3c82ebe720922	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-27 15:36:50.788	2025-11-26 16:06:15.591	rotated	refresh	2025-11-13 15:36:50.788	2025-11-13 16:17:47.36	2025-11-13 15:36:50.788	\N	\N	\N
134	etocgx30kz3myoqx4op5n7s1	1	d920841961b8c1b18f03df189f4405d6	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-13 18:58:41.815	2025-12-13 14:35:30.635	active	session	2025-11-13 16:58:41.815	2025-11-13 16:58:41.815	2025-11-13 16:58:41.816	\N	\N	\N
133	hf9mxu1dj8ja51trnl95pd43	1	371d917439042edde1d3c82ebe720922	ce2d027069e3e6c5e5b202291c0f3526	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-27 16:17:47.35	2025-11-26 16:06:15.591	rotated	refresh	2025-11-13 16:17:47.35	2025-11-13 19:44:34.622	2025-11-13 16:17:47.35	\N	\N	\N
135	p2pdgk6pcwkalrth2jsqo09v	1	ce2d027069e3e6c5e5b202291c0f3526	806dc5243c513bd143ce5a5da38ff199	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-27 19:44:34.609	2025-11-26 16:06:15.591	rotated	refresh	2025-11-13 19:44:34.609	2025-11-13 20:26:19.653	2025-11-13 19:44:34.61	\N	\N	\N
136	pon1b4iitx9sdqxew2ddtl85	1	806dc5243c513bd143ce5a5da38ff199	f71a300167d99947e558478b7cf2f38c	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-27 20:26:19.642	2025-11-26 16:06:15.591	rotated	refresh	2025-11-13 20:26:19.643	2025-11-13 22:49:01.866	2025-11-13 20:26:19.643	\N	\N	\N
138	y9a2tho75uknyest3uamivap	1	21d8e880a914fc4a3104db7f62d8371f	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-14 16:26:49.028	2025-12-14 14:26:49.028	active	session	2025-11-14 14:26:49.028	2025-11-14 14:26:49.028	2025-11-14 14:26:49.029	\N	\N	\N
140	s3wkf6ldm5tmzqvwv009116v	1	e014ab20f7e1a8e6a88143dbde5f84be	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-14 19:49:36.417	2025-12-14 16:51:16.447	active	session	2025-11-14 17:49:36.417	2025-11-14 17:49:36.417	2025-11-14 17:49:36.418	\N	\N	\N
139	uy90bcpwaahure29d3mjbk3l	1	f7179f41b10e4e34332cf92b0a3af825	e014ab20f7e1a8e6a88143dbde5f84be	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-14 18:51:16.447	2025-12-14 16:51:16.447	rotated	session	2025-11-14 16:51:16.447	2025-11-14 17:49:36.427	2025-11-14 16:51:16.447	\N	\N	\N
137	k9ug35xfwx10woypp9kxegkg	1	f71a300167d99947e558478b7cf2f38c	a27aed08392c2e116d4ba8d2648d2698	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-27 22:49:01.838	2025-11-26 16:06:15.591	rotated	refresh	2025-11-13 22:49:01.838	2025-11-14 18:29:20.185	2025-11-13 22:49:01.839	\N	\N	\N
142	uh6e3e3yql6strrp527c8537	3	ab19436be3837ff71f0a9f84b46a5b51	\N	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-19 15:25:53.81	2025-12-19 13:25:53.81	active	session	2025-11-19 13:25:53.811	2025-11-19 13:25:53.811	2025-11-19 13:25:53.817	\N	\N	\N
143	anmgbtqppltnzx3vzck626yw	1	e0c62b1564c3a3f17e9bc89a1200e6c8	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-20 18:12:14.669	2025-12-20 16:12:14.669	active	session	2025-11-20 16:12:14.669	2025-11-20 16:12:14.669	2025-11-20 16:12:14.67	\N	\N	\N
145	vp1c9xt0ftsejrww3r2g4bh2	1	deef33054829e9bfc80eddce5a5806bc	\N	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-12-05 13:52:25.749	2025-11-26 16:06:15.591	active	refresh	2025-11-21 13:52:25.749	2025-11-21 13:52:25.749	2025-11-21 13:52:25.751	\N	\N	\N
141	tvf75iw3txx6ee45s12kbl45	1	a27aed08392c2e116d4ba8d2648d2698	deef33054829e9bfc80eddce5a5806bc	0d7ecbd3-a553-493a-8537-c73e0b91d554	admin	2025-11-28 18:29:20.176	2025-11-26 16:06:15.591	rotated	refresh	2025-11-14 18:29:20.176	2025-11-21 13:52:25.766	2025-11-14 18:29:20.177	\N	\N	\N
146	pkzlgovfln19ehq5huf7p4uj	1	cbbb96ba4b1dc51c323b6729107321a8	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-21 15:59:40.106	2025-12-21 13:11:24.92	active	session	2025-11-21 13:59:40.106	2025-11-21 13:59:40.106	2025-11-21 13:59:40.107	\N	\N	\N
144	il2lx12yq9s1n4q3j6yvf4e7	1	4147bf0fda292c9f07afba85f23d6fd7	cbbb96ba4b1dc51c323b6729107321a8	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-21 15:11:24.92	2025-12-21 13:11:24.92	rotated	session	2025-11-21 13:11:24.92	2025-11-21 13:59:40.123	2025-11-21 13:11:24.922	\N	\N	\N
147	i1ata9tnhmmghbu5esmtj01d	1	2299654c96b01717ac1b764faf7380f4	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-22 21:07:23.615	2025-12-22 19:07:23.615	active	session	2025-11-22 19:07:23.615	2025-11-22 19:07:23.615	2025-11-22 19:07:23.621	\N	\N	\N
149	a5tls0p5h1tgg42nd7fpq926	1	222d6d012e8f231a5d8c89c85a515605	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-26 12:31:52.676	2025-12-26 10:31:52.676	active	session	2025-11-26 10:31:52.676	2025-11-26 10:31:52.676	2025-11-26 10:31:52.677	\N	\N	\N
148	cvnbyr7a0ombpwwj7g8eet1s	3	e89752dcd83e14b17db32b002202ee3c	1453e0d021660ffa04100bcd69dfe688	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-26 11:49:55.624	2025-12-26 09:49:55.624	rotated	session	2025-11-26 09:49:55.625	2025-11-26 10:37:03.203	2025-11-26 09:49:55.627	\N	\N	\N
151	wgg5ywfp79hzg90t8ck9moot	3	44260ae3f55247b9d7caded641bcb5ce	\N	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-26 14:32:43.558	2025-12-26 09:49:55.624	active	session	2025-11-26 12:32:43.558	2025-11-26 12:32:43.558	2025-11-26 12:32:43.559	\N	\N	\N
150	gblego1ze5zuuz3ab2ycxr2t	3	1453e0d021660ffa04100bcd69dfe688	44260ae3f55247b9d7caded641bcb5ce	46d428aa-ccdb-4ac9-967d-4491c07c14f5	admin	2025-11-26 12:37:03.187	2025-12-26 09:49:55.624	rotated	session	2025-11-26 10:37:03.187	2025-11-26 12:32:43.574	2025-11-26 10:37:03.189	\N	\N	\N
153	cuaufk563tglo4hjg842snmp	1	0b3de1e4254124a7f2f0f856d2ae2671	\N	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-26 19:23:48.161	2025-12-26 15:49:44.244	active	session	2025-11-26 17:23:48.161	2025-11-26 17:23:48.161	2025-11-26 17:23:48.162	\N	\N	\N
152	x64fauiithoolcm9gap8n2fm	1	4b54da68c8ea44ebe2da7f52b982bec3	0b3de1e4254124a7f2f0f856d2ae2671	602f5bff-1103-4a56-bf22-265ac5ee1277	admin	2025-11-26 17:49:44.244	2025-12-26 15:49:44.244	rotated	session	2025-11-26 15:49:44.244	2025-11-26 17:23:48.179	2025-11-26 15:49:44.245	\N	\N	\N
154	etnn7ve6ru6k84m267vjkn3f	1	ee4f35e1f224eb898403d0aa3e87ff04	\N	e62a3a3a-ba93-49bb-9eb9-0ffd9202c2dd	admin	2025-11-29 00:08:16.713	2025-12-28 22:08:16.713	active	session	2025-11-28 22:08:16.713	2025-11-28 22:08:16.713	2025-11-28 22:08:16.717	\N	\N	\N
155	vll3rzqccdux7318o7andlwr	1	e1f43e11e74fb6e570c0a7b754da011f	\N	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-11-29 13:22:45.386	2025-12-29 11:22:45.386	active	session	2025-11-29 11:22:45.386	2025-11-29 11:22:45.386	2025-11-29 11:22:45.388	\N	\N	\N
157	mwm6xfshjch1h0tyzd8h0sxh	3	4755f6e254a55a896b04544b5571b112	a18bf052bd08ba0edd5d98869e725852	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-16 13:52:20.62	2026-01-01 13:52:20.62	rotated	refresh	2025-12-02 13:52:20.62	2025-12-03 08:05:27.639	2025-12-02 13:52:20.622	\N	\N	\N
158	fj9mw92z8uh36d8zsrt32f26	3	a18bf052bd08ba0edd5d98869e725852	cd9c56298f7a4f07ebb224d3586a8d6e	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-17 08:05:27.622	2026-01-01 13:52:20.62	rotated	refresh	2025-12-03 08:05:27.623	2025-12-03 09:09:12.505	2025-12-03 08:05:27.624	\N	\N	\N
159	sdxae0rgh2t6aopx7kt4x11t	3	cd9c56298f7a4f07ebb224d3586a8d6e	cc5b6dec44be9e01a08936ae6c0a67c3	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-17 09:09:12.492	2026-01-01 13:52:20.62	rotated	refresh	2025-12-03 09:09:12.493	2025-12-03 09:54:22.775	2025-12-03 09:09:12.493	\N	\N	\N
156	v946hqgpeor1fkqtd1xgw4a2	1	8a50374df620f2cfb7caa2a0f1867219	00217a6f6dd6a512dcf728119b61a151	2ba375ec-3c73-4c9c-a464-c1f7e538ffb2	admin	2025-12-15 18:01:24.594	2025-12-31 18:01:24.594	rotated	refresh	2025-12-01 18:01:24.594	2025-12-03 11:03:17.268	2025-12-01 18:01:24.596	\N	\N	\N
160	p1m8mvuvpf8ooxvyvciu1tk5	3	cc5b6dec44be9e01a08936ae6c0a67c3	e92bb94f0ac0120ac0d2d69398addc2d	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-17 09:54:22.766	2026-01-01 13:52:20.62	rotated	refresh	2025-12-03 09:54:22.766	2025-12-03 13:52:51.912	2025-12-03 09:54:22.766	\N	\N	\N
162	exd2wt8kvz288879qchqjyx0	3	e92bb94f0ac0120ac0d2d69398addc2d	ca0277b3d4435b71b499631215841303	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-17 13:52:51.903	2026-01-01 13:52:20.62	rotated	refresh	2025-12-03 13:52:51.903	2025-12-03 14:39:57.16	2025-12-03 13:52:51.903	\N	\N	\N
161	jsncdh4vrrosav183ijnvth9	1	00217a6f6dd6a512dcf728119b61a151	a6679b74e69a9f86137306f9d81239af	2ba375ec-3c73-4c9c-a464-c1f7e538ffb2	admin	2025-12-17 11:03:17.25	2025-12-31 18:01:24.594	rotated	refresh	2025-12-03 11:03:17.25	2025-12-04 23:07:12.759	2025-12-03 11:03:17.251	\N	\N	\N
165	q5d400p5pgdmht4arkksp9i0	1	1c7a4094ea114eb159acdb683f799df0	\N	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-05 20:29:50.448	2026-01-04 18:29:50.448	active	session	2025-12-05 18:29:50.448	2025-12-05 18:29:50.448	2025-12-05 18:29:50.449	\N	\N	\N
164	j81hdh7f9qh5tbo5byzxypbg	1	a6679b74e69a9f86137306f9d81239af	1a4d17fc06a1f50363346afba3f1818b	2ba375ec-3c73-4c9c-a464-c1f7e538ffb2	admin	2025-12-18 23:07:12.746	2025-12-31 18:01:24.594	rotated	refresh	2025-12-04 23:07:12.747	2025-12-05 23:11:32.243	2025-12-04 23:07:12.748	\N	\N	\N
163	bcewpnp9i2wnqfah2e2sslp5	3	ca0277b3d4435b71b499631215841303	a58672f73b45c0c5ce08873b62ec445c	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-17 14:39:57.152	2026-01-01 13:52:20.62	rotated	refresh	2025-12-03 14:39:57.152	2025-12-09 13:03:23.273	2025-12-03 14:39:57.153	\N	\N	\N
166	rbc4o47bvmb9h3x8lph7nyio	1	66562d3ed0d45ca664850ea50e41fcb5	2a0e3ffa74aee049618bac826c0ab3bc	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-19 20:54:27.84	2026-01-04 20:54:27.84	rotated	refresh	2025-12-05 20:54:27.841	2025-12-05 21:32:38.42	2025-12-05 20:54:27.846	\N	\N	\N
168	ityv31zz6nln0bp22u3e3z5u	1	1a4d17fc06a1f50363346afba3f1818b	8c46b6cdde2ae60000faf2265ccec6de	2ba375ec-3c73-4c9c-a464-c1f7e538ffb2	admin	2025-12-19 23:11:32.223	2025-12-31 18:01:24.594	rotated	refresh	2025-12-05 23:11:32.223	2025-12-15 21:53:19.665	2025-12-05 23:11:32.224	\N	\N	\N
169	yovwbszc88y1volhawrvl0xv	3	a58672f73b45c0c5ce08873b62ec445c	3fbffb7a2c8723ebadd5b60d93f4ca2c	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-23 13:03:23.254	2026-01-01 13:52:20.62	rotated	refresh	2025-12-09 13:03:23.256	2025-12-10 13:05:28.369	2025-12-09 13:03:23.257	\N	\N	\N
170	k6nq65xvp7km6li4v9dtntri	3	3fbffb7a2c8723ebadd5b60d93f4ca2c	9d74c7047236b99ff0addbb7e441df6b	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-24 13:05:28.337	2026-01-01 13:52:20.62	rotated	refresh	2025-12-10 13:05:28.339	2025-12-11 10:49:53.504	2025-12-10 13:05:28.339	\N	\N	\N
171	jpxtely50kzswuinp7sx1opz	3	9d74c7047236b99ff0addbb7e441df6b	ddf6088d4edb64895962ca9b0abf30ab	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-25 10:49:53.456	2026-01-01 13:52:20.62	rotated	refresh	2025-12-11 10:49:53.458	2025-12-12 09:18:25.578	2025-12-11 10:49:53.465	\N	\N	\N
167	fdkdfg4j4w32q9wwi19teacz	1	2a0e3ffa74aee049618bac826c0ab3bc	ca22109cec0099c0a099b7f32b3625eb	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-19 21:32:38.403	2026-01-04 20:54:27.84	rotated	refresh	2025-12-05 21:32:38.404	2025-12-12 15:21:05.53	2025-12-05 21:32:38.405	\N	\N	\N
173	d2xmvjjxvhmil41f1kpxi36y	1	ca22109cec0099c0a099b7f32b3625eb	4b40f124e8bd9e4582d4eea17bc68fc2	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-26 15:21:05.459	2026-01-04 20:54:27.84	rotated	refresh	2025-12-12 15:21:05.459	2025-12-15 17:13:17.082	2025-12-12 15:21:05.46	\N	\N	\N
174	g5lu4qde3s8ci9npvorkey3g	1	4b40f124e8bd9e4582d4eea17bc68fc2	506053255706cf1200b921cbec2921f1	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-29 17:13:17.034	2026-01-04 20:54:27.84	rotated	refresh	2025-12-15 17:13:17.035	2025-12-15 17:13:17.287	2025-12-15 17:13:17.037	\N	\N	\N
175	qxvy6grewh47q1bpuaqri8i1	1	506053255706cf1200b921cbec2921f1	5d28e9ccec559e5f1d032dd7c338850f	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-29 17:13:17.274	2026-01-04 20:54:27.84	rotated	refresh	2025-12-15 17:13:17.274	2025-12-15 21:48:23.507	2025-12-15 17:13:17.275	\N	\N	\N
177	m1p6dakzgp5ypda6g17kscio	1	8c46b6cdde2ae60000faf2265ccec6de	cbad00ba901ce9af5d81ec3e28fc2053	2ba375ec-3c73-4c9c-a464-c1f7e538ffb2	admin	2025-12-29 21:53:19.653	2025-12-31 18:01:24.594	rotated	refresh	2025-12-15 21:53:19.653	2025-12-15 21:53:20.174	2025-12-15 21:53:19.653	\N	\N	\N
179	lsvav4zxi6me8vy13755r08z	1	334e9ff144579677f2127ea4e8f44777	\N	2ba375ec-3c73-4c9c-a464-c1f7e538ffb2	admin	2025-12-29 23:17:23.039	2025-12-31 18:01:24.594	active	refresh	2025-12-15 23:17:23.04	2025-12-15 23:17:23.04	2025-12-15 23:17:23.04	\N	\N	\N
178	fur981xnas3a42axkgmec18x	1	cbad00ba901ce9af5d81ec3e28fc2053	334e9ff144579677f2127ea4e8f44777	2ba375ec-3c73-4c9c-a464-c1f7e538ffb2	admin	2025-12-29 21:53:20.163	2025-12-31 18:01:24.594	rotated	refresh	2025-12-15 21:53:20.163	2025-12-15 23:17:23.064	2025-12-15 21:53:20.163	\N	\N	\N
176	byquqo1bi8uur2zkppl9xnl1	1	5d28e9ccec559e5f1d032dd7c338850f	e17e3861e6cce85ade84aa45c15ecc71	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-29 21:48:23.491	2026-01-04 20:54:27.84	rotated	refresh	2025-12-15 21:48:23.491	2025-12-16 15:42:50.599	2025-12-15 21:48:23.493	\N	\N	\N
180	v3z3kjvv9002f56amqbhzyek	1	e17e3861e6cce85ade84aa45c15ecc71	993dc87da711f78bb52e4702782f2836	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-30 15:42:50.574	2026-01-04 20:54:27.84	rotated	refresh	2025-12-16 15:42:50.575	2025-12-17 14:06:38.324	2025-12-16 15:42:50.575	\N	\N	\N
181	nihzky9s9qwkxn69ulpprg1d	1	993dc87da711f78bb52e4702782f2836	54aadbf17e160dea437776b127e4bca8	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-31 14:06:38.301	2026-01-04 20:54:27.84	rotated	refresh	2025-12-17 14:06:38.301	2025-12-17 14:06:38.724	2025-12-17 14:06:38.302	\N	\N	\N
182	o9aa4mcigcbkrinss40ibrzc	1	54aadbf17e160dea437776b127e4bca8	a4d80a3edd38aeaf66ffebbc015f9933	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-31 14:06:38.712	2026-01-04 20:54:27.84	rotated	refresh	2025-12-17 14:06:38.713	2025-12-17 14:48:45.979	2025-12-17 14:06:38.713	\N	\N	\N
183	l7epxnx5qgmfwws8tfk4to06	1	a4d80a3edd38aeaf66ffebbc015f9933	33785d1afb204853c73e8661349abc96	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-31 14:48:45.951	2026-01-04 20:54:27.84	rotated	refresh	2025-12-17 14:48:45.952	2025-12-17 14:48:46.359	2025-12-17 14:48:45.953	\N	\N	\N
184	wv72xsc8szqtni7xzip43gya	1	33785d1afb204853c73e8661349abc96	bcd854ba3c83bfd8cba114f092be8211	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-31 14:48:46.347	2026-01-04 20:54:27.84	rotated	refresh	2025-12-17 14:48:46.347	2025-12-17 21:49:54.431	2025-12-17 14:48:46.348	\N	\N	\N
185	z0jub47w9z1vdh6f2io7x4wt	1	bcd854ba3c83bfd8cba114f092be8211	046588c1bca5db51f0b79955df9b34b2	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2025-12-31 21:49:54.4	2026-01-04 20:54:27.84	rotated	refresh	2025-12-17 21:49:54.4	2025-12-18 14:10:58.026	2025-12-17 21:49:54.401	\N	\N	\N
172	u2nt7qg5715usx6kt3mapegd	3	ddf6088d4edb64895962ca9b0abf30ab	8a31911844139bf11d29b4365041e83b	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2025-12-26 09:18:25.543	2026-01-01 13:52:20.62	rotated	refresh	2025-12-12 09:18:25.544	2025-12-18 14:47:59.852	2025-12-12 09:18:25.546	\N	\N	\N
187	pvn6di05w9z24mot2okyfnr7	3	8a31911844139bf11d29b4365041e83b	e25deecd887a4681df5979fc54cbd05f	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2026-01-01 14:47:59.826	2026-01-01 13:52:20.62	rotated	refresh	2025-12-18 14:47:59.826	2025-12-18 14:48:00.087	2025-12-18 14:47:59.826	\N	\N	\N
186	u96wovcf4u78dsr4v1uasvyx	1	046588c1bca5db51f0b79955df9b34b2	7f9342978764d55f14096a96f48f38ee	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2026-01-01 14:10:57.972	2026-01-04 20:54:27.84	rotated	refresh	2025-12-18 14:10:57.972	2025-12-19 15:09:53.678	2025-12-18 14:10:57.972	\N	\N	\N
190	s1lvoa59oifzf60fq1ple942	1	e5e44476d28264123637beea05d83b92	\N	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2026-01-02 15:09:54.231	2026-01-04 20:54:27.84	active	refresh	2025-12-19 15:09:54.231	2025-12-19 15:09:54.231	2025-12-19 15:09:54.231	\N	\N	\N
189	s7fzmxmsz8ya2o2gijt9wmn6	1	7f9342978764d55f14096a96f48f38ee	e5e44476d28264123637beea05d83b92	fd45ec08-9de6-4a3e-913b-f342524d921a	admin	2026-01-02 15:09:53.642	2026-01-04 20:54:27.84	rotated	refresh	2025-12-19 15:09:53.643	2025-12-19 15:09:54.241	2025-12-19 15:09:53.644	\N	\N	\N
188	qobnsm6snt9h5ap26iafp6vc	3	e25deecd887a4681df5979fc54cbd05f	d278ffdec12af70f82b20106ec82eef4	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2026-01-01 14:48:00.053	2026-01-01 13:52:20.62	rotated	refresh	2025-12-18 14:48:00.054	2025-12-19 15:33:02.919	2025-12-18 14:48:00.055	\N	\N	\N
191	szm886lkyhejbizmee114ib6	3	d278ffdec12af70f82b20106ec82eef4	2939e03a95c33b291a5267708ac20d2a	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2026-01-02 15:33:02.895	2026-01-01 13:52:20.62	rotated	refresh	2025-12-19 15:33:02.895	2025-12-19 15:33:03.133	2025-12-19 15:33:02.895	\N	\N	\N
193	o7e6osgy01fn1dlcep9x0ynt	3	6bfea2ed5a841ed19b7bb75f30087f93	\N	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2026-01-02 16:06:52.027	2026-01-01 13:52:20.62	active	refresh	2025-12-19 16:06:52.027	2025-12-19 16:06:52.027	2025-12-19 16:06:52.028	\N	\N	\N
192	fdn8136l1emz9lsywfu0wcxq	3	2939e03a95c33b291a5267708ac20d2a	6bfea2ed5a841ed19b7bb75f30087f93	8f745189-14d5-41c6-9403-b3725ed4eb1d	admin	2026-01-02 15:33:03.122	2026-01-01 13:52:20.62	rotated	refresh	2025-12-19 15:33:03.122	2025-12-19 16:06:52.039	2025-12-19 15:33:03.122	\N	\N	\N
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- Data for Name: taxes; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.taxes (id, document_id, vat, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	roh8nre2l68txb6pyq3ctj2j	14.00	2025-11-04 01:38:18.963	2025-11-04 01:38:18.963	\N	1	1	\N
2	roh8nre2l68txb6pyq3ctj2j	14.00	2025-11-04 01:38:18.963	2025-11-04 01:38:18.963	2025-11-04 01:38:18.986	1	1	\N
\.


--
-- Data for Name: terms_of_services; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.terms_of_services (id, document_id, effective_date, content, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	jmdx4vph955cl5xdhlcklx2c	19.11.2025	Parties: “You” (the client / user) and Easy Home Services (“we”, “us”, “our”)\n\n1. Acceptance of Terms \n     By booking, using, or requesting our cleaning services via easyhs.ca (the “Site”), you confirm that you have read, understood, and agreed to be bound by these Terms of Service, as well as our Privacy Policy and Cookie Policy. If you do not agree, do not use our Site or request services. \n\n2. Scope of Services \n  • We provide residential and/or commercial cleaning services as agreed in each booking/contract. The specific details of the services (tasks, frequency, location, time, access instructions, supplies/materials, etc.) will be outlined in your booking confirmation or separate service contract. \n  • The estimated cleaning time is approximate. Additional work will only be performed with your approval, and additional charges will be communicated before proceeding. \n  • The cleaning and general maintenance services we provide do not require trade licensing under the applicable laws and regulations of Nova Scotia. We do not perform specialized regulated work such as electrical, plumbing, HVAC, structural modifications, or any other work that legally requires certification or licensing. \n\n3. Booking, Payment & Cancellation \n  • You agree to pay the fees specified in the booking confirmation. \n  • Payment methods and schedule (e.g., upfront, deposit, after service) will be as described at booking. \n  • Credit or debit card payments may be made online at booking or immediately upon service completion. Credit or debit card payments may be made online at booking or immediately upon service completion. Late payments (if payment is not received before cleaners leave) may incur a fee of $50 per day. \n  • We reserve the right to refuse or cancel a booking (e.g., if premises are unsafe, access conditions not met, or other legitimate reasons). \n  • You may cancel or reschedule your service by providing at least 48 hours’ notice prior to the scheduled service time without penalty. \n  • If cancellation or rescheduling occurs less than 48 hours in advance, you agree to pay a cancellation fee equal to 50% of the total service price. \n\n4. Client & Provider Obligations \n  • You agree to grant our staff safe and lawful access to the premises at scheduled times. \n  • Any access codes, keys, or special instructions must be provided in advance. We are not responsible for security issues if access information is incomplete or incorrect. \n  • You confirm that you own or have permission to allow cleaning services on the property. \n  • You agree to provide any necessary utilities (water, electricity) for cleaning. \n  • We (or our staff) will perform services with reasonable care and professionalism; we may subcontract or assign staff as needed. \n  • We operate in full compliance with the Nova Scotia Occupational Health and Safety Act. \n  • We do not perform services in unsafe, hazardous, or unsanitary conditions that may put our staff or subcontractors at risk. \n  • If we engage subcontractors to perform any part of the service, all subcontractors will be fully insured and required to operate in compliance with our safety and quality standards. \n  • The client agrees to provide a safe, lawful, and accessible working environment, including safe entry, adequate lighting, and the absence of dangerous conditions. \n  • We stand behind our work with a 24-hour quality guarantee. Any complaints must be reported within 24 hours of service completion. We will return to address legitimate issues at no extra cost. \n\n5. Liability, Insurance & Damage \n  • We maintain appropriate insurance coverage for our services (if applicable). \n  • We are not liable for pre-existing conditions or damage unrelated to our gross negligence. \n  • If damage occurs as a result of our negligence, our liability is limited to amount of insurance compensation. \n  • You must report any damage within 24 hours of service for accountability. \n  • Our company maintains active Workers’ Compensation Board (WCB) Nova Scotia coverage, which provides insurance protection for our business in the event of workplace incidents or injuries occurring during the performance of our services. \n  • Our liability for any damage arising directly from our negligence is limited to the maximum amount covered under our current insurance policy.  \n  • We are not liable for pre-existing damage, normal wear and tear, or loss of high-value items such as jewelry, cash, collectibles, or fragile objects unless explicitly agreed otherwise in writing. \n\n6. Confidentiality & Privacy \nWe respect your privacy. Any personal information you provide will be handled according to our Privacy Policy (see below). We will not share your personal data with third parties except as described in the Privacy Policy, or when required by law. \n\n7. Use of Site / Account \nIf you register, you are responsible for keeping your account credentials secure. You are responsible for all activities under your account. We reserve the right to suspend or terminate access if we suspect misuse or non-compliance with these Terms. \n\n8. Changes to Terms \nWe may update these Terms occasionally. The updated version will be posted on the Site with a new “Effective date”. Continued use of the Site or our Services after changes constitutes acceptance of the new Terms. \n\n9. Governing Law & Dispute Resolution \nThese Terms are governed by the laws of Nova Scotia, Canada and relevant federal laws. Any dispute arising from or related to these Terms or the Services shall be resolved in the courts of Nova Scotia, unless otherwise agreed in writing. \n\n10. Severability & Whole Agreement \nIf any part of these Terms is found invalid or unenforceable, the rest remains effective. These Terms, plus referenced policies, constitute the entire agreement between you and us regarding our Services and Site. 	2025-10-03 15:31:38.763	2025-12-15 17:27:45.933	\N	1	1	en
5	jmdx4vph955cl5xdhlcklx2c	19.11.2025	Parties: “You” (the client / user) and Easy Home Services (“we”, “us”, “our”)\n\n1. Acceptance of Terms \n     By booking, using, or requesting our cleaning services via easyhs.ca (the “Site”), you confirm that you have read, understood, and agreed to be bound by these Terms of Service, as well as our Privacy Policy and Cookie Policy. If you do not agree, do not use our Site or request services. \n\n2. Scope of Services \n  • We provide residential and/or commercial cleaning services as agreed in each booking/contract. The specific details of the services (tasks, frequency, location, time, access instructions, supplies/materials, etc.) will be outlined in your booking confirmation or separate service contract. \n  • The estimated cleaning time is approximate. Additional work will only be performed with your approval, and additional charges will be communicated before proceeding. \n  • The cleaning and general maintenance services we provide do not require trade licensing under the applicable laws and regulations of Nova Scotia. We do not perform specialized regulated work such as electrical, plumbing, HVAC, structural modifications, or any other work that legally requires certification or licensing. \n\n3. Booking, Payment & Cancellation \n  • You agree to pay the fees specified in the booking confirmation. \n  • Payment methods and schedule (e.g., upfront, deposit, after service) will be as described at booking. \n  • Credit or debit card payments may be made online at booking or immediately upon service completion. Credit or debit card payments may be made online at booking or immediately upon service completion. Late payments (if payment is not received before cleaners leave) may incur a fee of $50 per day. \n  • We reserve the right to refuse or cancel a booking (e.g., if premises are unsafe, access conditions not met, or other legitimate reasons). \n  • You may cancel or reschedule your service by providing at least 48 hours’ notice prior to the scheduled service time without penalty. \n  • If cancellation or rescheduling occurs less than 48 hours in advance, you agree to pay a cancellation fee equal to 50% of the total service price. \n\n4. Client & Provider Obligations \n  • You agree to grant our staff safe and lawful access to the premises at scheduled times. \n  • Any access codes, keys, or special instructions must be provided in advance. We are not responsible for security issues if access information is incomplete or incorrect. \n  • You confirm that you own or have permission to allow cleaning services on the property. \n  • You agree to provide any necessary utilities (water, electricity) for cleaning. \n  • We (or our staff) will perform services with reasonable care and professionalism; we may subcontract or assign staff as needed. \n  • We operate in full compliance with the Nova Scotia Occupational Health and Safety Act. \n  • We do not perform services in unsafe, hazardous, or unsanitary conditions that may put our staff or subcontractors at risk. \n  • If we engage subcontractors to perform any part of the service, all subcontractors will be fully insured and required to operate in compliance with our safety and quality standards. \n  • The client agrees to provide a safe, lawful, and accessible working environment, including safe entry, adequate lighting, and the absence of dangerous conditions. \n  • We stand behind our work with a 24-hour quality guarantee. Any complaints must be reported within 24 hours of service completion. We will return to address legitimate issues at no extra cost. \n\n5. Liability, Insurance & Damage \n  • We maintain appropriate insurance coverage for our services (if applicable). \n  • We are not liable for pre-existing conditions or damage unrelated to our gross negligence. \n  • If damage occurs as a result of our negligence, our liability is limited to amount of insurance compensation. \n  • You must report any damage within 24 hours of service for accountability. \n  • Our company maintains active Workers’ Compensation Board (WCB) Nova Scotia coverage, which provides insurance protection for our business in the event of workplace incidents or injuries occurring during the performance of our services. \n  • Our liability for any damage arising directly from our negligence is limited to the maximum amount covered under our current insurance policy.  \n  • We are not liable for pre-existing damage, normal wear and tear, or loss of high-value items such as jewelry, cash, collectibles, or fragile objects unless explicitly agreed otherwise in writing. \n\n6. Confidentiality & Privacy \nWe respect your privacy. Any personal information you provide will be handled according to our Privacy Policy (see below). We will not share your personal data with third parties except as described in the Privacy Policy, or when required by law. \n\n7. Use of Site / Account \nIf you register, you are responsible for keeping your account credentials secure. You are responsible for all activities under your account. We reserve the right to suspend or terminate access if we suspect misuse or non-compliance with these Terms. \n\n8. Changes to Terms \nWe may update these Terms occasionally. The updated version will be posted on the Site with a new “Effective date”. Continued use of the Site or our Services after changes constitutes acceptance of the new Terms. \n\n9. Governing Law & Dispute Resolution \nThese Terms are governed by the laws of Nova Scotia, Canada and relevant federal laws. Any dispute arising from or related to these Terms or the Services shall be resolved in the courts of Nova Scotia, unless otherwise agreed in writing. \n\n10. Severability & Whole Agreement \nIf any part of these Terms is found invalid or unenforceable, the rest remains effective. These Terms, plus referenced policies, constitute the entire agreement between you and us regarding our Services and Site. 	2025-10-03 15:31:38.763	2025-12-15 17:27:45.933	2025-12-15 17:27:45.971	1	1	en
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	s2h8nd8x6kl36kctry3cfrmw	plugin::users-permissions.user.me	2025-09-27 03:20:14.233	2025-09-27 03:20:14.233	2025-09-27 03:20:14.234	\N	\N	\N
2	jvnxe3n0igm0sxhpi15uecvw	plugin::users-permissions.auth.changePassword	2025-09-27 03:20:14.233	2025-09-27 03:20:14.233	2025-09-27 03:20:14.235	\N	\N	\N
10	fzrhj66exgm9y73mu081i9ts	api::addon.addon.findOne	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.893	\N	\N	\N
11	bj213n7jy4cmrmouyt21o6ol	api::addon.addon.find	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.892	\N	\N	\N
12	uyli9q414ejr43tzkka0iojf	api::advantage.advantage.find	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.893	\N	\N	\N
13	ooqyu601bf1a8ajaw8v3f5xx	api::advantage.advantage.findOne	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.894	\N	\N	\N
14	zn5gr88dp9ke9v3rtk5zi5me	api::coefficient.coefficient.find	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.894	\N	\N	\N
15	uosveobjrikp9k3ukxezq41a	api::coefficient.coefficient.findOne	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.894	\N	\N	\N
16	axm2m6qnhfknnhdl5r4yekf4	api::contact.contact.find	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.894	\N	\N	\N
17	bu32cvstvzua3k5j7ke3t8ud	api::contact.contact.findOne	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.895	\N	\N	\N
18	uim2ooc822ghlmolxaxbk04g	api::feature.feature.find	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.895	\N	\N	\N
19	gkspigsto2ee328ldvq7v3wy	api::feature.feature.findOne	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.895	\N	\N	\N
20	dz3covr97r0t9vq7u53qr6lb	api::feature-option.feature-option.find	2025-11-21 13:54:27.891	2025-11-21 13:54:27.891	2025-11-21 13:54:27.895	\N	\N	\N
21	debdf9ofqv0wvzxuqi7vmz4o	api::feature-option.feature-option.findOne	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.896	\N	\N	\N
22	g3cree2k5ic3d2h63q7ixger	api::home-page.home-page.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.896	\N	\N	\N
23	lmnog6qw4d6t0zs66axu64e0	api::login-page.login-page.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.896	\N	\N	\N
24	blhy49snbv6zp40mvvjarpcb	api::privacy-policy.privacy-policy.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.896	\N	\N	\N
25	tk7xw6jjf1fptfuzjknx3qk6	api::question.question.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.896	\N	\N	\N
26	f78xub8l4t9q61cr8d5chxjb	api::question.question.findOne	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.896	\N	\N	\N
27	fompvfpumt3ba63tgr1gvox1	api::review.review.findOne	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.899	\N	\N	\N
28	nbuzkgsx3xs9rjx2gw937tr9	api::review.review.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.899	\N	\N	\N
29	pun0mdjdhb6dp9ofkhn227ln	api::service.service.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.9	\N	\N	\N
30	s0q9v8cgxcdtx8lz6t7mjw14	api::service.service.findOne	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.9	\N	\N	\N
31	pyvo6cuqigk69uciua6kazx6	api::terms-of-service.terms-of-service.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.9	\N	\N	\N
32	qsatdy37t296rvdr9s3ykla6	api::tax.tax.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.9	\N	\N	\N
34	e34qvhq2v9r5ml2yknr9l0r3	plugin::upload.content-api.findOne	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.901	\N	\N	\N
35	vs5cg4k51j7mrvomw9h0l05q	plugin::i18n.locales.listLocales	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.901	\N	\N	\N
33	iv3jhgmrz9xvris7q1zqcz5s	plugin::upload.content-api.find	2025-11-21 13:54:27.892	2025-11-21 13:54:27.892	2025-11-21 13:54:27.9	\N	\N	\N
\.


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	1	1
2	2	1	1
10	11	2	1
11	10	2	1
12	12	2	1
13	13	2	1
14	14	2	1
15	15	2	1
16	16	2	1
17	18	2	2
18	19	2	2
19	21	2	3
20	22	2	3
21	23	2	3
22	24	2	3
23	20	2	3
24	26	2	3
25	25	2	3
26	28	2	4
27	27	2	4
28	29	2	4
29	30	2	4
30	31	2	4
31	32	2	4
32	34	2	4
33	17	2	2
34	35	2	5
35	33	2	5
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	x278ibo82qvsp0k9dkhz8xyn	Authenticated	Default role given to authenticated user.	authenticated	2025-09-27 03:20:13.862	2025-09-27 03:20:13.862	2025-09-27 03:20:13.863	\N	\N	\N
2	ri3mbz0rx35ecz3k73d3p52l	Public	Default role given to unauthenticated user.	public	2025-09-27 03:20:14.007	2025-11-21 13:54:27.83	2025-09-27 03:20:14.008	\N	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	p0849oav3kzi6wysvpa9uyzy	Features	1	/1	2025-10-31 14:51:03.636	2025-10-31 14:51:03.636	2025-10-31 14:51:03.642	1	1	\N
2	qlgmkt5i8qky86ck5nqyt6ar	Bathroom	2	/1/2	2025-10-31 14:51:12.323	2025-10-31 14:51:12.323	2025-10-31 14:51:12.324	1	1	\N
3	x4t2iro5wpi6eb3rvmxhced9	Kitchen	3	/1/3	2025-10-31 15:37:54.742	2025-10-31 15:37:54.742	2025-10-31 15:37:54.744	1	1	\N
4	esqx3n2ds3zftiz899rwwxd5	Hallway	4	/1/4	2025-10-31 15:38:02.594	2025-10-31 15:38:02.594	2025-10-31 15:38:02.594	1	1	\N
5	kb3v26v67835huc60je59ylc	Rooms	5	/1/5	2025-10-31 15:38:15.873	2025-10-31 15:38:15.873	2025-10-31 15:38:15.874	1	1	\N
6	fx8z3rhc61earv9ep3d9tfdi	Login	6	/6	2025-10-31 16:33:53.105	2025-10-31 16:33:53.105	2025-10-31 16:33:53.106	1	1	\N
7	onrqwyg250pl9g4ndrx1hm9l	Hero	7	/7	2025-10-31 16:33:57.303	2025-10-31 16:33:57.303	2025-10-31 16:33:57.304	1	1	\N
\.


--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: esg_strapi
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
1	2	1	1
2	3	1	2
3	4	1	3
4	5	1	4
\.


--
-- Name: addons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.addons_id_seq', 118, true);


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 321, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 321, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 3, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 6, true);


--
-- Name: advantages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.advantages_id_seq', 8, true);


--
-- Name: coefficients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.coefficients_id_seq', 24, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.contacts_id_seq', 2, true);


--
-- Name: cookie_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.cookie_policies_id_seq', 2, true);


--
-- Name: feature_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.feature_options_id_seq', 57, true);


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.features_id_seq', 12, true);


--
-- Name: features_options_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.features_options_lnk_id_seq', 82, true);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 22, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.files_id_seq', 23, true);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 60, true);


--
-- Name: home_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.home_pages_id_seq', 8, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: login_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.login_pages_id_seq', 3, true);


--
-- Name: privacy_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.privacy_policies_id_seq', 4, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.questions_id_seq', 2, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.reviews_id_seq', 2, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.services_id_seq', 111, true);


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_ai_localization_jobs_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 3, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 45, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 7, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 6, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_sessions_id_seq', 225, true);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: taxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.taxes_id_seq', 2, true);


--
-- Name: terms_of_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.terms_of_services_id_seq', 5, true);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 35, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 35, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 7, true);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: esg_strapi
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 4, true);


--
-- Name: addons addons_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.addons
    ADD CONSTRAINT addons_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: advantages advantages_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.advantages
    ADD CONSTRAINT advantages_pkey PRIMARY KEY (id);


--
-- Name: coefficients coefficients_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.coefficients
    ADD CONSTRAINT coefficients_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: cookie_policies cookie_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.cookie_policies
    ADD CONSTRAINT cookie_policies_pkey PRIMARY KEY (id);


--
-- Name: feature_options feature_options_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.feature_options
    ADD CONSTRAINT feature_options_pkey PRIMARY KEY (id);


--
-- Name: features_options_lnk features_options_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features_options_lnk
    ADD CONSTRAINT features_options_lnk_pkey PRIMARY KEY (id);


--
-- Name: features_options_lnk features_options_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features_options_lnk
    ADD CONSTRAINT features_options_lnk_uq UNIQUE (feature_id, feature_option_id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: home_pages home_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: login_pages login_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.login_pages
    ADD CONSTRAINT login_pages_pkey PRIMARY KEY (id);


--
-- Name: privacy_policies privacy_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: strapi_ai_localization_jobs strapi_ai_localization_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs
    ADD CONSTRAINT strapi_ai_localization_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_sessions strapi_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: taxes taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (id);


--
-- Name: terms_of_services terms_of_services_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.terms_of_services
    ADD CONSTRAINT terms_of_services_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: addons_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX addons_created_by_id_fk ON public.addons USING btree (created_by_id);


--
-- Name: addons_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX addons_documents_idx ON public.addons USING btree (document_id, locale, published_at);


--
-- Name: addons_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX addons_updated_by_id_fk ON public.addons USING btree (updated_by_id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: advantages_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX advantages_created_by_id_fk ON public.advantages USING btree (created_by_id);


--
-- Name: advantages_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX advantages_documents_idx ON public.advantages USING btree (document_id, locale, published_at);


--
-- Name: advantages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX advantages_updated_by_id_fk ON public.advantages USING btree (updated_by_id);


--
-- Name: coefficients_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX coefficients_created_by_id_fk ON public.coefficients USING btree (created_by_id);


--
-- Name: coefficients_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX coefficients_documents_idx ON public.coefficients USING btree (document_id, locale, published_at);


--
-- Name: coefficients_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX coefficients_updated_by_id_fk ON public.coefficients USING btree (updated_by_id);


--
-- Name: contacts_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX contacts_created_by_id_fk ON public.contacts USING btree (created_by_id);


--
-- Name: contacts_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX contacts_documents_idx ON public.contacts USING btree (document_id, locale, published_at);


--
-- Name: contacts_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX contacts_updated_by_id_fk ON public.contacts USING btree (updated_by_id);


--
-- Name: cookie_policies_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX cookie_policies_created_by_id_fk ON public.cookie_policies USING btree (created_by_id);


--
-- Name: cookie_policies_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX cookie_policies_documents_idx ON public.cookie_policies USING btree (document_id, locale, published_at);


--
-- Name: cookie_policies_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX cookie_policies_updated_by_id_fk ON public.cookie_policies USING btree (updated_by_id);


--
-- Name: feature_options_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX feature_options_created_by_id_fk ON public.feature_options USING btree (created_by_id);


--
-- Name: feature_options_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX feature_options_documents_idx ON public.feature_options USING btree (document_id, locale, published_at);


--
-- Name: feature_options_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX feature_options_updated_by_id_fk ON public.feature_options USING btree (updated_by_id);


--
-- Name: features_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX features_created_by_id_fk ON public.features USING btree (created_by_id);


--
-- Name: features_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX features_documents_idx ON public.features USING btree (document_id, locale, published_at);


--
-- Name: features_options_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX features_options_lnk_fk ON public.features_options_lnk USING btree (feature_id);


--
-- Name: features_options_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX features_options_lnk_ifk ON public.features_options_lnk USING btree (feature_option_id);


--
-- Name: features_options_lnk_ofk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX features_options_lnk_ofk ON public.features_options_lnk USING btree (feature_option_ord);


--
-- Name: features_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX features_updated_by_id_fk ON public.features USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: home_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX home_pages_created_by_id_fk ON public.home_pages USING btree (created_by_id);


--
-- Name: home_pages_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX home_pages_documents_idx ON public.home_pages USING btree (document_id, locale, published_at);


--
-- Name: home_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX home_pages_updated_by_id_fk ON public.home_pages USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: login_pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX login_pages_created_by_id_fk ON public.login_pages USING btree (created_by_id);


--
-- Name: login_pages_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX login_pages_documents_idx ON public.login_pages USING btree (document_id, locale, published_at);


--
-- Name: login_pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX login_pages_updated_by_id_fk ON public.login_pages USING btree (updated_by_id);


--
-- Name: privacy_policies_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX privacy_policies_created_by_id_fk ON public.privacy_policies USING btree (created_by_id);


--
-- Name: privacy_policies_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX privacy_policies_documents_idx ON public.privacy_policies USING btree (document_id, locale, published_at);


--
-- Name: privacy_policies_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX privacy_policies_updated_by_id_fk ON public.privacy_policies USING btree (updated_by_id);


--
-- Name: questions_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX questions_created_by_id_fk ON public.questions USING btree (created_by_id);


--
-- Name: questions_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX questions_documents_idx ON public.questions USING btree (document_id, locale, published_at);


--
-- Name: questions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX questions_updated_by_id_fk ON public.questions USING btree (updated_by_id);


--
-- Name: reviews_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX reviews_created_by_id_fk ON public.reviews USING btree (created_by_id);


--
-- Name: reviews_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX reviews_documents_idx ON public.reviews USING btree (document_id, locale, published_at);


--
-- Name: reviews_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX reviews_updated_by_id_fk ON public.reviews USING btree (updated_by_id);


--
-- Name: services_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX services_created_by_id_fk ON public.services USING btree (created_by_id);


--
-- Name: services_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX services_documents_idx ON public.services USING btree (document_id, locale, published_at);


--
-- Name: services_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX services_updated_by_id_fk ON public.services USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_sessions_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_sessions_created_by_id_fk ON public.strapi_sessions USING btree (created_by_id);


--
-- Name: strapi_sessions_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_sessions_documents_idx ON public.strapi_sessions USING btree (document_id, locale, published_at);


--
-- Name: strapi_sessions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_sessions_updated_by_id_fk ON public.strapi_sessions USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: taxes_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX taxes_created_by_id_fk ON public.taxes USING btree (created_by_id);


--
-- Name: taxes_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX taxes_documents_idx ON public.taxes USING btree (document_id, locale, published_at);


--
-- Name: taxes_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX taxes_updated_by_id_fk ON public.taxes USING btree (updated_by_id);


--
-- Name: terms_of_services_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX terms_of_services_created_by_id_fk ON public.terms_of_services USING btree (created_by_id);


--
-- Name: terms_of_services_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX terms_of_services_documents_idx ON public.terms_of_services USING btree (document_id, locale, published_at);


--
-- Name: terms_of_services_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX terms_of_services_updated_by_id_fk ON public.terms_of_services USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: esg_strapi
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: addons addons_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.addons
    ADD CONSTRAINT addons_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: addons addons_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.addons
    ADD CONSTRAINT addons_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: advantages advantages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.advantages
    ADD CONSTRAINT advantages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: advantages advantages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.advantages
    ADD CONSTRAINT advantages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: coefficients coefficients_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.coefficients
    ADD CONSTRAINT coefficients_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: coefficients coefficients_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.coefficients
    ADD CONSTRAINT coefficients_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: contacts contacts_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: contacts contacts_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: cookie_policies cookie_policies_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.cookie_policies
    ADD CONSTRAINT cookie_policies_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: cookie_policies cookie_policies_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.cookie_policies
    ADD CONSTRAINT cookie_policies_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: feature_options feature_options_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.feature_options
    ADD CONSTRAINT feature_options_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: feature_options feature_options_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.feature_options
    ADD CONSTRAINT feature_options_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: features features_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: features_options_lnk features_options_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features_options_lnk
    ADD CONSTRAINT features_options_lnk_fk FOREIGN KEY (feature_id) REFERENCES public.features(id) ON DELETE CASCADE;


--
-- Name: features_options_lnk features_options_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features_options_lnk
    ADD CONSTRAINT features_options_lnk_ifk FOREIGN KEY (feature_option_id) REFERENCES public.feature_options(id) ON DELETE CASCADE;


--
-- Name: features features_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: home_pages home_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: home_pages home_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: login_pages login_pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.login_pages
    ADD CONSTRAINT login_pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: login_pages login_pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.login_pages
    ADD CONSTRAINT login_pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: privacy_policies privacy_policies_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: privacy_policies privacy_policies_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: questions questions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: questions questions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: reviews reviews_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: reviews reviews_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: services services_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: services services_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: taxes taxes_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: taxes taxes_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: terms_of_services terms_of_services_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.terms_of_services
    ADD CONSTRAINT terms_of_services_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: terms_of_services terms_of_services_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.terms_of_services
    ADD CONSTRAINT terms_of_services_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: esg_strapi
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict qqzMX0lLdEw3dQ6dYBvR0PKKuHMvRniQxJkrvmeNoUYqKS4KGunnZUcU64JYVQb

