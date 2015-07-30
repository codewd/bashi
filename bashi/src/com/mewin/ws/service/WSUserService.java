package com.mewin.ws.service;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public interface WSUserService {
	
	@WebMethod
	public int login();
	
}
