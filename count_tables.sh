#!/bin/bash

SQL_FILE="example.sql"
OUTPUT_FILE="table_count.txt"

# Rename the original SQL file to example.sql
mv example.sql-39-59.sql "$SQL_FILE"

# Count the number of tables
TABLE_COUNT=$(grep -i "CREATE TABLE" "$SQL_FILE" | wc -l)

# Save the result
echo "Number of tables in $SQL_FILE: $TABLE_COUNT" > "$OUTPUT_FILE"

# Display the result
cat "$OUTPUT_FILE"
