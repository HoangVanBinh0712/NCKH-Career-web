package com.be.payload.post;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.be.utility.datatype.ESalary;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostCreateRequest {

	@NotBlank
	private String title;

	@NotBlank
	private String description;

	@NotNull
	private Long salary;

	@NotNull
	private ESalary salaryType;

	@NotNull
	private String fieldCode;
	
	@NotNull
	private String cityCode;

	@NotNull
	private String location;

	@Min(0)
	@NotNull
	private Long recruit;

	@NotNull
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date expirationDate;

}
