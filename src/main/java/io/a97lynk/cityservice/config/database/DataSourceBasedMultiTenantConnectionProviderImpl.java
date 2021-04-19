package io.a97lynk.cityservice.config.database;

import org.hibernate.engine.jdbc.connections.spi.AbstractDataSourceBasedMultiTenantConnectionProviderImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

@Component
public class DataSourceBasedMultiTenantConnectionProviderImpl
		extends AbstractDataSourceBasedMultiTenantConnectionProviderImpl {

	boolean init = false;

	private Map<String, DataSource> map = new HashMap<>();

	private String DEFAULT_TENANT_ID = "public";

	private final DataSource defaultDS;
	private final ApplicationContext context;

	public DataSourceBasedMultiTenantConnectionProviderImpl(DataSource defaultDS, ApplicationContext context) {
		this.defaultDS = defaultDS;
		this.context = context;
	}

	@PostConstruct
	public void load() {
		map.put(DEFAULT_TENANT_ID, defaultDS);
	}

	@Override
	protected DataSource selectAnyDataSource() {
		return map.get(DEFAULT_TENANT_ID);
	}

	@Override
	protected DataSource selectDataSource(String tenantIdentifier) {
		if (!init) {
			init = true;
			TenantDataSource tenantDataSource = context.getBean(TenantDataSource.class);
			map.putAll(tenantDataSource.getAll());
		}

		return map.getOrDefault(tenantIdentifier, defaultDS);
	}
}
