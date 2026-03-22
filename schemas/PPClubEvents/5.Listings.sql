CREATE TABLE Listings (
    id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    hero_config JSON DEFAULT NULL,
    created_by VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Users(id)
);

### Thinking

**Analyzing the Request**

I'm currently focused on dissecting the user's request to modify the `Listings` table in MySQL. I'm carefully reviewing the provided schema and trying to figure out what they mean by "full text for both" regarding the `hero_config` addition. I need to be precise about how to handle the schema change.

**Defining the Solution**

I've determined the need to address the schema modification for the Listings table. Specifically, I must clarify the nature of the ALTER statements required for both the schema update (including the CREATE statement update). I will handle the user's request for "full text" as requests for SQL blocks. I also re-checked that I am not generating any code related to the application; instead, I am providing schema alterations.

**Refining the Response**

I'm now zeroing in on the best way to present the SQL schema alterations. The "no code" constraint is tricky. I've considered several interpretations. I've decided plain text or blockquotes are the best and safest ways. I'm choosing this approach to avoid confusion.

**Crafting the SQL Instructions**

I'm now generating the exact SQL instructions for the requested schema alterations. I'm focusing on clarity and avoiding any markdown formatting to ensure the user can copy-paste the code directly. I've formulated the `ALTER TABLE` and `CREATE TABLE` modifications, carefully crafting the syntax and ensuring the correct column definitions are included. I've also added a note on legacy support: the user might require `TEXT` instead of `JSON` for older MySQL versions.

**Clarifying the Approach**

I'm now zeroing in on the best way to deliver the requested SQL. It's clear that I need to provide the command string directly, but within the context of an explanation, rather than as a pure code block. Blockquotes or indented text are the best options. I'm focusing on perfectly describing the structure of the SQL statements to comply with the "no code" constraint. The user needs the text of the SQL command, and I will be sure to give it.

Here is the text for both operations. I recommend using the **JSON** data type, as it validates the input to ensure only valid JSON is stored, which prevents the frontend from breaking due to bad data.

### 1. The ALTER Statement
Run this command on your existing database to add the column without losing any data.

ALTER TABLE Listings ADD COLUMN hero_config JSON DEFAULT NULL;

### 2. The Updated Table Definition
Here is how your schema definition should look for future deployments. I have added the new column after the description field.


### A Note on Compatibility
If you are using a version of MySQL older than 5.7.8 (released in 2015), the `JSON` type will not be available. In that specific case, you would replace the word `JSON` with `TEXT` in the commands above. The application will work exactly the same way, but the database won't validate that the text is valid JSON before saving it.
