-- Table: public.player

-- DROP TABLE public.player;

CREATE TABLE public.player
(
    id integer NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    team_id integer,
    "createdAt" date,
    "updatedAt" date,
    other_id character varying COLLATE pg_catalog."default",
    CONSTRAINT player_pkey PRIMARY KEY (id),
    CONSTRAINT fk_team_id FOREIGN KEY (team_id)
        REFERENCES public.team (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.player
    OWNER to postgres;

COMMENT ON CONSTRAINT fk_team_id ON public.player
    IS 'asdf';



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