DROP TABLE IF EXISTS public.bielefeld_baustellen;
CREATE TABLE public.bielefeld_baustellen (
    way public.geometry(Geometry, 25832)
);

CREATE INDEX bielefeld_baustellen_way_index ON bielefeld_wohnlagen USING GIST (way);

ALTER TABLE public.bielefeld_baustellen OWNER TO maposmatic;
