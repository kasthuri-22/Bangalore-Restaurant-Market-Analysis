-- =====================================================
-- Task 1: Create a working copy of the raw dataset
-- Purpose:
-- Preserve the original dataset and perform all cleaning
-- operations on a separate table.
-- =====================================================

CREATE TABLE zomato_cleaned AS
SELECT *
FROM zomato;
