from datetime import timedelta, datetime
from airflow import DAG
from airflow.operators.python import PythonOperator
from reddit_etl import run_reddit_etl

default_args = {
    "owner": "airflow",
    "start_date": datetime(2023, 5, 19),
    "depend_on_past": False,
    "email": ["airflow@exapmle.com"],
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=1)
}

dag = DAG(
    "reddit_dag",
    default_args=default_args,
    description="My first airflow code"
)

run_etl = PythonOperator(
    task_id = "complete_reddit_etl",
    python_callable = run_reddit_etl,
    dag=dag
)

# Define dag execution order
run_etl
