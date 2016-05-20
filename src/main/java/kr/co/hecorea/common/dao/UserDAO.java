package kr.co.hecorea.common.dao;

import java.util.HashMap;

public interface UserDAO {
	public HashMap<String, String> select_loginYn(HashMap<String, String> params);
	public void insert_contact_log(HashMap<String, String> params);
}
