import pandas as pd
import sqlite3 as sql

def connect_to_database(host, user, password, database=None):
    try:
        # Connect to MySQL server and specify the database
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database
        )

        #create cursor for the connection
        cursor = connection.cursor()
        
        if connection.is_connected():
            print(f"Connected to MySQL database '{database}'")
            return connection, cursor
    
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        return None
    
    
def extract(raw_csv_path, database_path):
    sql_connection = sql.connect(database_path)
    df = pd.read_csv(raw_csv_path)
    df_tags = df[['id','tags']]
    df_nutr = df[['id', 'nutrition']]
    df_steps = df[['id', 'n_steps', 'steps']]
    df_ingredients = df[['id', 'n_ingredients', 'ingredients']]

    df_tags.to_sql('RecipeTags', sql_connection, if_exists='replace', index=False)
    df_ingredients.to_sql('Ingredients', sql_connection, if_exists='replace', index=False)
    df_nutr.to_sql('NutritionFacts', sql_connection, if_exists='replace', index=False)
    df_steps.to_sql('RecipeSteps', sql_connection, if_exists='replace', index=False)
    sql_connection.commit()
    sql_connection.close()

extract('../csv_files/RAW_recipes.csv','../database/recipes_dataset.db')