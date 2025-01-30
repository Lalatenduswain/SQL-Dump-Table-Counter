# SQL Dump Table Counter

## Overview
This repository contains a script that allows you to count the number of tables in an SQL dump file without importing it into a database. The script utilizes common CLI tools like `grep`, `awk`, and `sed` to analyze the SQL file.

## Prerequisites
Before running the script, ensure you have the following installed:

- A Unix-based system (Linux/macOS) or Windows with Git Bash
- Bash shell (default in Linux/macOS)
- `grep`, `awk`, and `sed` installed (default in Linux/macOS)
- Basic permissions to execute scripts (use `chmod` if needed)

## Installation
Clone this repository:
```bash
git clone https://github.com/Lalatenduswain/sql_table_count.git
cd sql_table_count
```

## Script Details

**Script Name:** `count_tables.sh`

The script performs the following tasks:
1. Renames the original SQL file to `example.sql`
2. Counts the number of tables in the SQL file by searching for `CREATE TABLE` statements
3. Saves the result in a `table_count.txt` file
4. Displays the table count in the terminal

### Script Usage
To run the script, follow these steps:

1. Give execute permissions:
   ```bash
   chmod +x count_tables.sh
   ```

2. Execute the script:
   ```bash
   ./count_tables.sh
   ```

### Script Content
```bash
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
```

## Alternative Methods

### 1. Find Table Definitions
To list table creation statements:
```bash
grep -i "CREATE TABLE" example.sql
```

To view the first 10 lines after each `CREATE TABLE`:
```bash
grep -A 10 -i "CREATE TABLE" example.sql
```

### 2. Use `less` for Browsing
To manually browse the SQL file:
```bash
less example.sql
```

To search for `CREATE TABLE` entries inside `less`:
```
/CREATE TABLE
```

### 3. Extract Table Names
To print only table names:
```bash
awk '/CREATE TABLE/ {print $3}' example.sql | tr -d '`'
```

### 4. Extract Specific Table Definitions
To extract the structure of a known table:
```bash
sed -n '/CREATE TABLE `your_table_name`/,/ENGINE=/p' example.sql
```

### 5. Use MySQL CLI Without Importing
If MySQL is installed, you can simulate a dry run:
```bash
mysql --verbose --help < example.sql
```

Or if the database is already imported:
```bash
mysql -u root -p -e "SHOW CREATE TABLE your_table_name;"
```

## Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications based on your environment. Use it at your own risk. The author is not responsible for any damage or issues caused by its usage.

## Donations
If you find this script useful, consider supporting via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

## Support or Contact
For issues, submit an issue on the [GitHub page](https://github.com/Lalatenduswain/sql_table_count/issues).
