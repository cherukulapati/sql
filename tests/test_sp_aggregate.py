import os, psycopg2

def test_aggregate_runs():
    conn = psycopg2.connect(
        host=os.getenv('REDSHIFT_ENDPOINT'),
        dbname=os.getenv('REDSHIFT_DB','dev'),
        user=os.getenv('REDSHIFT_USER'),
        password=os.getenv('REDSHIFT_PASSWORD'),
        port=int(os.getenv('REDSHIFT_PORT','5439'))
    )
    cur = conn.cursor()
    # Basic smoke: ensure sp exists by calling with a date that may not exist
    cur.execute("CALL sales.aggregate_sales_by_region('2025-10-01', 'US-East');")
    conn.commit()
    cur.close()
    conn.close()
