# YouTube Video Data Cleaning for Sentiment Analysis

## Project Overview

This project focuses on the crucial step of data cleaning in preparation for sentiment analysis of YouTube video data. The goal was to extract relevant textual information (video titles and descriptions) related to YouTube products and clean it to ensure data quality and consistency for downstream analytical tasks. This process demonstrates proficiency in data extraction, database interaction (SQL Server), and essential data cleaning techniques using SQL.

The project addresses the common challenge of noisy and unstructured text data often encountered in real-world scenarios, highlighting the importance of meticulous data preparation for accurate insights.

## Dataset

The dataset for this project was obtained by scraping YouTube video information using the YouTube Data API v3. The initial dataset included the following columns:

* `title`: The title of the YouTube video.
* `video_id`: The unique identifier of the YouTube video.
* `description`: The description provided for the YouTube video.
* `thumbnail`: The URL of the video's thumbnail image.

For the purpose of sentiment analysis, the `title` and `description` columns were the primary focus of the cleaning process.

## Technical Process

The technical process involved the following steps:

1.  **Data Acquisition:**
    * Utilized the YouTube Data API v3 with a Python script to search for videos related to "YouTube products" (e.g., YouTube TV, YouTube Music).
    * Extracted the `title`, `video_id`, `description`, and `thumbnail` for relevant videos.

2.  **Data Storage:**
    * The scraped data was initially saved to a CSV file (`youtube_reviews.csv`).
    * The CSV file was then imported into a SQL Server database (`YouTube`) for efficient management and cleaning.

3.  **Data Cleaning (SQL Server):**
    * The data cleaning process was performed directly within SQL Server Management Studio (SSMS) to demonstrate database manipulation skills. The following cleaning steps were applied to the `title` and `description` columns, and the cleaned versions were stored in new columns (`cleaned_title`, `cleaned_description`):
        * **Lowercasing:** Converted all text to lowercase for consistency.
        * **URL Removal:** Removed URLs to eliminate irrelevant information for sentiment.
        * **HTML Tag Removal (Basic):** Removed simple HTML tags that might be present in descriptions.
        * **Special Character and Punctuation Removal:** Removed characters that do not typically contribute to sentiment.
        * **Number Removal:** Removed numerical digits.
        * **Extra Whitespace Removal:** Trimmed leading/trailing spaces and reduced multiple spaces to single spaces.

    * The SQL scripts used for these cleaning steps can be found in the `sql_scripts` directory of this repository.

4.  **Final Cleaned Data:**
    * The cleaned data, with the `cleaned_title` and `cleaned_description` columns, is now ready for further sentiment analysis using appropriate NLP techniques and tools (e.g., Python libraries like NLTK, spaCy, or sentiment analysis APIs).

## Next Steps (Potential Future Work)

* **Sentiment Analysis:** Implementing sentiment analysis using Python NLP libraries on the `cleaned_title` and `cleaned_description` data.
* **Advanced Cleaning:** Exploring more sophisticated cleaning techniques, such as stemming or lemmatization, and handling emojis.
* **Stop Word Removal:** Implementing stop word removal, potentially using a dedicated stop word list in SQL or during the sentiment analysis phase.
* **Data Visualization:** Creating visualizations to explore the distribution of sentiment across different YouTube products or video categories.
