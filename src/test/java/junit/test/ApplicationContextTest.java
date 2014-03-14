package junit.test;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.anyang.zc.arbitration.config.ApplicationContextConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationContextConfiguration.class })
public class ApplicationContextTest {

	@Autowired
	private ApplicationContext context;

	@Test
	public void testDataSource() {
		DataSource dataSource = context.getBean("dataSource", DataSource.class);
		System.out.println(dataSource);
	}

}
