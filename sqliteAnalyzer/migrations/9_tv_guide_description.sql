DROP VIEW "TV_GUIDE";
CREATE VIEW IF NOT EXISTS "TV_GUIDE" AS SELECT
        BROADCASTS._id,
        BROADCASTS.PROGRAM_ID,
        BROADCASTS.LANGUAGE_ID,
        BROADCASTS.BROADCAST_TIMESTAMP,
        BROADCASTS.PRIME_TIME,
        BROADCASTS.AIR_DATE,
        BROADCASTS.AIR_TIME,
        BROADCASTS.DAYS_IN_ARTE7,
        BROADCASTS.MAIN_CLUSTER_ID,
        PROGRAMS.TITLE,
        PROGRAMS.SUBTITLE,
        PROGRAMS.SHORT_TEXT,
        PROGRAMS.DEFAULT_IMAGE_ID,
        GENRES.CODE,
        GENRES.LABEL,
        IMAGES.URL
    FROM BROADCASTS
        INNER JOIN PROGRAMS ON BROADCASTS.PROGRAM_ID = PROGRAMS.PROGRAM_ID
            AND BROADCASTS.LANGUAGE_ID = PROGRAMS.LANGUAGE_ID
        OUTER LEFT JOIN GENRES ON PROGRAMS.GENRE_ID = GENRES.CODE
        OUTER LEFT JOIN IMAGES ON PROGRAMS.DEFAULT_IMAGE_ID = IMAGES.IMAGE_ID
    ORDER BY BROADCASTS.BROADCAST_TIMESTAMP ASC;
