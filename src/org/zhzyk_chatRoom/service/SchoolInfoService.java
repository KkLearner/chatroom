package org.zhzyk_chatRoom.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("schoolInfoService")
public class SchoolInfoService extends BaseService {

	public List<Map<String, Object>> getSchoolInfo() {
		return schoolInfoDaoImpl.getList(null, null, "delFlag=0", null, null, null);
	}
}
