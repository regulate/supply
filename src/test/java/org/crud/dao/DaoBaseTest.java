package org.crud.dao;

import java.sql.SQLException;

import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.init.ScriptException;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration(locations="classpath:applicationContext.xml")
public abstract class DaoBaseTest extends AbstractJUnit4SpringContextTests{
	
	private final String cleanUpScript = "src/main/resources/sql/clean_up_data.sql";
	
	@Autowired
	protected JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Before
	public void deleteAllDBRecords(){
		try {
			ScriptUtils.executeSqlScript(jdbcTemplate.getDataSource().getConnection(),
					new FileSystemResource(cleanUpScript));
		} catch (ScriptException | SQLException e) {
			e.printStackTrace();
		}
	}
}
