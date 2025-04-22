SELECT *
FROM [YouTube].[dbo].[youtube_reviews]

-- Lowercasing

ALTER TABLE youtube_reviews
ADD cleaned_title NVARCHAR(MAX),
    cleaned_description NVARCHAR(MAX);
GO

UPDATE youtube_reviews
SET cleaned_title = LOWER(title),
    cleaned_description = LOWER(description);
GO

-- Removing URLs

UPDATE youtube_reviews
SET cleaned_title = REPLACE(REPLACE(REPLACE(cleaned_title, 'http://', ''), 'https://', ''), 'www.', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(REPLACE(REPLACE(cleaned_description, 'http://', ''), 'https://', ''), 'www.', '');
GO

-- Removing HTML Tags

UPDATE youtube_reviews
SET cleaned_title = REPLACE(REPLACE(REPLACE(cleaned_title, '<br>', ' '), '<p>', ' '), '</p>', ' ');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(REPLACE(REPLACE(cleaned_description, '<br>', ' '), '<p>', ' '), '</p>', ' ');
GO

-- Removing Special Characters and Punctuation

UPDATE youtube_reviews
SET cleaned_title = REPLACE(
                      REPLACE(
                          REPLACE(
                              REPLACE(
                                  REPLACE(
                                      REPLACE(cleaned_title, '.', ''), ',', ''), ';', ''), '(', ''), ')', ''), '-', ' ');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(
                          REPLACE(
                              REPLACE(
                                  REPLACE(
                                      REPLACE(
                                          REPLACE(cleaned_description, '.', ''), ',', ''), ';', ''), '(', ''), ')', ''), '-', ' ');
GO

-- Removing Numbers

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '0', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '1', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '2', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '3', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '4', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '5', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '6', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '7', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '8', '');
GO

UPDATE youtube_reviews
SET cleaned_title = REPLACE(cleaned_title, '9', '');
GO

-- Removing Numbers - Breakdown Method for cleaned_description

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '0', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '1', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '2', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '3', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '4', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '5', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '6', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '7', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '8', '');
GO

UPDATE youtube_reviews
SET cleaned_description = REPLACE(cleaned_description, '9', '');
GO

-- Removing Extra Whitespace

-- This is a basic approach and might not handle all cases of multiple spaces perfectly
UPDATE youtube_reviews
SET cleaned_title = LTRIM(RTRIM(REPLACE(cleaned_title, '  ', ' ')));
GO

UPDATE youtube_reviews
SET cleaned_description = LTRIM(RTRIM(REPLACE(cleaned_description, '  ', ' ')));
GO
