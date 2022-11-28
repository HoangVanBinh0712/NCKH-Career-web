package com.be.payload;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JwtResponse<T> extends BaseResponse {
	private String token;
	private static final String type = "Bearer";
	private T userInfo;

	public JwtResponse(String token, T userInfo) {
		super(true, "");
		this.token = token;
		this.userInfo = userInfo;
	}
}