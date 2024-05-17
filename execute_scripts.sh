#!/bin/bash

echo "Executing script with $# parameters" 

# Check if the correct number of arguments are provided
if [ "$#" -lt 4 ]; then
  echo "Usage: $0 <host> <port> <user> <sql_file1> [<sql_file2> ...]"
  exit 1
fi

host=$1
port=$2
user=$3
shift 3

error_flag=0

for sql_file in "$@"; do
  # Check if the SQL file exists
  if [ ! -f "./files/$sql_file" ]; then
    echo "Error: File './files/$sql_file' does not exist."
    error_flag=1
    continue
  fi

  # Execute the SQL file and check for errors
  mysql --host="$host" --port="$port" --user="$user" < "./files/$sql_file" > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "Error: Failed to execute './files/$sql_file'"
    error_flag=1
  else
    echo "Successfully executed './files/$sql_file'"
  fi
done

# Exit with code 1 if there was any error
if [ $error_flag -ne 0 ]; then
  exit 1
fi

exit 0
