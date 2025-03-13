import sqlite3

DB_PATH = "../database/db.sqlite3"


import os

# Define a function to execute a SQL file
def execute_sql_file(file_path):
    
    # Open the SQL file in read mode
    with open(file_path, 'r')as file:
        # Read the contents of the file
        sql_script = file.read()
        
    # Connect to the SQLite database
    with sqlite3.connect(DB_PATH) as conn:
        # Create a cursor object
        cursor = conn.cursor()
        # Execute the SQL script
        cursor.executescript(sql_script)
        # Commit the changes
        conn.commit()


def execute_query(query,params=()):
    
    # Ensure the database directory exists
    db_dir = os.path.dirname(DB_PATH)
    if not os.path.exists(db_dir):
        os.makedirs(db_dir)
    
    # Ensure the database file exists
    if not os.path.exists(DB_PATH):
        open(DB_PATH, 'w').close()
    
    with sqlite3.connect(DB_PATH) as conn:
        cursor = conn.cursor()
        cursor.execute(query,params)
        
        # If the query is a SELECT statement, return the result
        if query.strip().upper().startswith("SELECT"):
            return cursor.fetchall()
        # Otherwise, commit the changes
        conn.commit()
        


if __name__ == "__main__":
    
    ## Create the database
    execute_sql_file("../database/schema.sql")
    ## Seed the database
    execute_sql_file("../database/seed.sql")
    print("Database created and seeded")
    
    # sample_query = "SELECT * FROM employee;"
    # results = execute_query(sample_query)
    # for row in results:
    #     print(row)