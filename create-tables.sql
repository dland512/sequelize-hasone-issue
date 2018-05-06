-- Table: public.player

-- DROP TABLE public.player;

CREATE TABLE public.player
(
    id integer NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    "createdAt" date,
    "updatedAt" date,
    other_id character varying COLLATE pg_catalog."default",
    CONSTRAINT player_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.player
    OWNER to postgres;


-- Table: public.player_ext

-- DROP TABLE public.player_ext;

CREATE TABLE public.player_ext
(
    id integer NOT NULL,
    player_id integer NOT NULL,
    age character varying(100) COLLATE pg_catalog."default",
    eye_color character varying(100) COLLATE pg_catalog."default",
    "createdAt" date,
    "updatedAt" date,
    player_other_id character varying COLLATE pg_catalog."default",
    CONSTRAINT player_extended_pkey PRIMARY KEY (id),
    CONSTRAINT player_extended_player_id_fkey FOREIGN KEY (player_id)
        REFERENCES public.player (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.player_ext
    OWNER to postgres;


INSERT INTO public.player(
	id, first_name, last_name, "createdAt", "updatedAt", other_id)
	VALUES (1, 'Lance', 'Uppercut', null, null, 'abc');


INSERT INTO public.player(
	id, first_name, last_name, "createdAt", "updatedAt", other_id)
	VALUES (2, 'Rock', 'Strongo', null, null, 'def');


INSERT INTO public.player_ext(
	id, player_id, age, eye_color, "createdAt", "updatedAt", player_other_id)
	VALUES (1, 1, 25, 'blue', null, null, 'abc');

INSERT INTO public.player_ext(
	id, player_id, age, eye_color, "createdAt", "updatedAt", player_other_id)
	VALUES (2, 2, 27, 'green', null, null, 'def');


