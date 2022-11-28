package com.be.dto;

import java.util.Date;

import javax.persistence.Column;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.be.utility.datatype.ESalary;

import lombok.Data;

@Data
public class PostDTO {

	private Long id;

	@Column(length = 200)
	@NotBlank
	private String title;

	@NotBlank
	private String description;

	@NotNull
	private Long salary;

	private ESalary salaryType;

	@NotNull
	private String location;

	@Min(0)
	private Long recruit;
	
	private Date createDate;

	@NotNull
	private Date expirationDate;

	private String adminAceptedEmail;

	private Date acceptedDate;
	
	private EmployerDTO employer;
	
	private String city;
	
	private String field;
	
	private String avatar;
	
}
