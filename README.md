# Pal Tracker Distributed

## Development

1.  Start the database service.

    ```bash
    docker-compose up db
    ```

1.  Create the databases and run migrations.

    ```bash
    mysql -h localhost -P 3306 --protocol=tcp -u root < databases/create_databases.sql
    ./gradlew testMigrate devMigrate
    ```

1.  Build the project.
    ```bash
    ./gradlew build
    ```

1.  Run the apps.

    ```bash
    docker-compose up
    ```
