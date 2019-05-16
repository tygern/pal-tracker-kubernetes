package io.pivotal.pal.tracker.testsupport;

import org.mariadb.jdbc.MariaDbDataSource;

import javax.sql.DataSource;
import java.sql.SQLException;


public class TestDataSourceFactory {

    public static DataSource create(String name) {
        MariaDbDataSource dataSource = new MariaDbDataSource();

        try {
            dataSource.setUrl("jdbc:mariadb://localhost:3306/" + name + "?useSSL=false&useTimezone=true&serverTimezone=UTC&useLegacyDatetimeCode=false");
            dataSource.setUser("tracker");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database doesn't work: " + e.getMessage());
        }

        return dataSource;
    }
}
