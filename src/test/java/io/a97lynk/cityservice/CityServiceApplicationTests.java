package io.a97lynk.cityservice;

import io.a97lynk.cityservice.config.database.TenantDataSource;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.Map;

@SpringBootTest
class CityServiceApplicationTests {

	@Autowired
	TenantDataSource tenantDataSource;

	@Test
	void contextLoads() {
		Map<String, DataSource> dataSources = tenantDataSource.getAll();

		Executable executable = () -> {
			Connection connection;
			for (DataSource dataSource : dataSources.values()) {
				connection = dataSource.getConnection();
				connection.createStatement().execute("SELECT 1");
				connection.close();
			}
		};

		Assertions.assertDoesNotThrow(executable);
	}

}
