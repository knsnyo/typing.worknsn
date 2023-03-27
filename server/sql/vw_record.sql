CREATE OR REPLACE VIEW VW_RECORD AS (
	SELECT 
		r.idx as idx,
		r.speed as speed,
		r.date as date 
	FROM RECORD r
	JOIN USER u ON u.idx = r.user
);

SELECT * FROM VW_RECORD;

DROP VIEW VW_RECORD;