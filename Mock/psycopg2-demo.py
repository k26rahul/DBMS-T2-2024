import psycopg2
import os
import sys
from dotenv import load_dotenv  # test
load_dotenv()  # test
sys.argv[1] = 'lis'  # test

dbname = sys.argv[1]
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")

# Establish a connection to the PostgreSQL database
try:
  connection = psycopg2.connect(
      dbname=dbname,
      user=user,
      password=password,
      host=host,
      port=port
  )

  # Create a cursor object
  cursor = connection.cursor()

  # Define the query to select the names of students
  query = "select * from students;"

  # Execute the query
  cursor.execute(query)

  # Fetch all results from the executed query
  result = cursor.fetchall()

  # Iterate over the results and print each student's name
  for row in result:
    print(row)

except psycopg2.Error as e:
  print(f"Error: {e}")

finally:
  # Close the cursor and connection to clean up
  if cursor:
    cursor.close()
  if connection:
    connection.close()
