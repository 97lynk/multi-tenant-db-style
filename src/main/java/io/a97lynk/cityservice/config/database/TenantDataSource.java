package io.a97lynk.cityservice.config.database;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class TenantDataSource implements Serializable {

	private final DataSourceConfigRepository configRepo;

	public TenantDataSource(DataSourceConfigRepository configRepo) {
		this.configRepo = configRepo;
	}

	// load config database and init datasource
	public Map<String, DataSource> getAll() {

		List<DataSourceConfig> configList = configRepo.findAll();

		Map<String, DataSource> result = new HashMap<>();
		for (DataSourceConfig config : configList) {
			DataSource dataSource = createDataSource(config);
			result.put(config.getName(), dataSource);
		}

		return result;
	}

	private DataSource createDataSource(DataSourceConfig config) {

		DataSourceBuilder factory = DataSourceBuilder
				.create().driverClassName(config.getDriverClassName())
				.username(config.getUsername())
				.password(config.getPassword())
				.url(config.getUrl());
		DataSource ds = factory.build();

		return ds;
	}

}
