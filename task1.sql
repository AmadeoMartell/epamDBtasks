-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Authors"
(
    author_id serial NOT NULL,
    first_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    birth_year date,
    death_year date,
    CONSTRAINT "Authors_pkey" PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS public."Books"
(
    book_id serial NOT NULL,
    publication_year integer,
    author_id integer NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT "Books_pkey" PRIMARY KEY (book_id)
        INCLUDE(book_id)
);

ALTER TABLE IF EXISTS public."Books"
    ADD CONSTRAINT author_id FOREIGN KEY (author_id)
    REFERENCES public."Authors" (author_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS fki_author_id
    ON public."Books"(author_id);

END;