package com.mewin.ws.service.impl;

import javax.jws.WebService;

import com.mewin.ws.service.WSUserService;

@WebService(endpointInterface = "com.mewin.ws.service.WSUserService")
public class WSUserServiceImpl implements WSUserService {

	public int login() {
		System.out.println("Hello WebService");
		return 1;
	}
}
