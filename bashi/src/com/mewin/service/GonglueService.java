package com.mewin.service;
import java.util.List;

import com.mewin.base.BaseDao;
import com.mewin.entity.Address;
import com.mewin.entity.Gonglue;
public interface GonglueService extends BaseDao<Gonglue> {

	List<Gonglue> getListByAddress(Address address);

}
