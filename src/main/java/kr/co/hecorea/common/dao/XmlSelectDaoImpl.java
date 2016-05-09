package kr.co.hecorea.common.dao;

import java.sql.*;
import java.util.*;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.mapping.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.WebApplicationContext;

import kr.co.hecorea.common.util.DatasetUtil;

import org.springframework.beans.factory.annotation.Autowired;

@Repository("xmlSelectDao")
public class XmlSelectDaoImpl extends SqlSessionDaoSupport implements XmlSelectDao {
	
	private Logger log = Logger.getLogger(getClass());
	
	private WebApplicationContext webApplicationContext;
	
	//-------------------- add start --------------------------
	
	@Autowired(required =false)
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
	    super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Autowired(required = false)
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	//-------------------- add end --------------------------

	@Autowired
	public void setWebApplicationContext(WebApplicationContext w) {
		webApplicationContext = w;
	}
	
	@Override
	public String commonSelect(String selectId, HashMap<String, String> paramMap) throws Exception {
		SqlSession sqlSession = null;
		
		String result = new String();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			sqlSession = getSqlSession();
			
			BasicDataSource bds = (BasicDataSource)webApplicationContext.getBean("dataSource");
			con = bds.getConnection();

			String sql = sqlSession.getConfiguration().getMappedStatement(selectId).getSqlSource().getBoundSql(paramMap).getSql();
			log.info("XmlSelect SQL: " + sql);
			
			List<ParameterMapping> list = sqlSession.getConfiguration().getMappedStatement(selectId).getSqlSource().getBoundSql(paramMap).getParameterMappings();
			
			ps = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			for(int i=0; i<list.size(); i++) {
				ParameterMapping pm = (ParameterMapping)list.get(i);
				ps.setString((i + 1), paramMap.get(pm.getProperty()));
			}
			
			rs = ps.executeQuery();
			result = DatasetUtil.makeXmlDataSet(selectId, rs);
		} catch(Exception e) {
			log.error(e.toString());
			throw e;
		} 
		
		/*
		finally {
			sqlSession.close();
			
			try {
				if(rs != null)	rs.close();
				if(ps != null)	ps.close();
				if(con != null)	con.close();
			} catch(Exception e) { }
		}
		*/
		
		return result;
	}

}
