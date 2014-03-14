package cn.anyang.zc.arbitration.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import com.alibaba.druid.pool.DruidDataSource;

@MapperScan(basePackages={"cn.anyang.zc.arbitration.mapper"})
@Configuration
@EnableTransactionManagement
@PropertySource("classpath:jdbc.properties")
@ComponentScan(basePackages={"cn.anyang.zc.arbitration.service.impl"})
public class ApplicationContextConfiguration implements TransactionManagementConfigurer {

	/**
	 * 静态方法用于配置 PropertySource 装载进来的properties文件
	 */
	public static @Bean PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	/**
	 * 数据库连接相关
	 */
	private @Value("${jdbc.driverClassName}") String driverClassName;
	private @Value("${jdbc.url}") String url;
	private @Value("${jdbc.username}") String username;
	private @Value("${jdbc.password}") String password;

	/**
	 * druid数据源配置
	 */
	private @Value("${druid.initialSize}") int initialSize;
	private @Value("${druid.minIdle}") int minIdle;
	private @Value("${druid.maxActive}") int maxActive;
	private @Value("${druid.maxWait}") long maxWait;

	/**
	 * druid 数据源
	 */
	@Bean(initMethod = "init", destroyMethod = "close")
	public DataSource dataSource() {
		DruidDataSource dataSource = new DruidDataSource();
		// dataSource.setDriverClassName(driverClassName);
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);

		dataSource.setInitialSize(initialSize);
		dataSource.setMinIdle(minIdle);
		dataSource.setMaxActive(maxActive);
		dataSource.setMaxWait(maxWait);
		dataSource.setValidationQuery("select id from users");

		return dataSource;
	}

	/**
	 * 配置 Mybatis SqlSessionFactory
	 */
	public @Bean SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setTypeAliasesPackage("cn.anyang.zc.arbitration.domain");
		return sessionFactory.getObject();
	}

	/**
	 * 配置事务管理器
	 */
	@Override
	public @Bean PlatformTransactionManager annotationDrivenTransactionManager() {
		return new DataSourceTransactionManager(dataSource());
	}

}
