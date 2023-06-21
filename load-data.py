import pandas as pd
from io import BytesIO
from minio import Minio

# Your existing connection setup
connection = psycopg2.connect(
    host="pgdb",
    database="postgres",
    user="admin",
    password="admin"
)

# Initialize Minio client
minio_client = Minio(
    "minio:9000",
    access_key="minioadmin",
    secret_key="minioadmin",
    secure=False
)

# List of csv file names
csv_files = [
    "circuits.csv",
    "constructor_results.csv",
    "constructor_standings.csv",
    "constructors.csv",
    "driver_standings.csv",
    "drivers.csv",
    "lap_times.csv",
    "pit_stops.csv",
    "qualifying.csv",
    "races.csv",
    "results.csv",
    "seasons.csv",
    "sprint_results.csv",
    "status.csv"
]

# Loop over the list of csv files
for csv_file in csv_files:
    # Download the CSV file from the Minio bucket into a pandas DataFrame
    data = minio_client.get_object("track.data-raw", csv_file)
    data = BytesIO(data.read())
    df_csv = pd.read_csv(data)

    # Write the data to a PostgreSQL table
    df_csv.to_sql(
        name=csv_file[:-4],  # Table name, derived from file name (remove .csv)
        con=connection,
        schema='track',  # specify 'track' schema
        if_exists="append",  # If the table already exists, append the data
        index=False,  # Do not write row indices
        method="multi"  # Use multiple insertions if possible
    )

# Commit the changes and close the connection
connection.commit()
connection.close()
