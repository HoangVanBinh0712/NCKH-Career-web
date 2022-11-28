package com.be.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.be.utility.datatype.ESalary;

import lombok.Data;

@Data
@Entity
public class Post {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Lob
	@Column(length = 200)
	@NotBlank
	private String title;

	@Lob
	@Column(length = 65535)
	@NotBlank
	private String description;

	@Column
	@NotNull
	private Long salary;

	@Column(name = "salary_type")
	@Enumerated(EnumType.STRING)
	@NotNull
	private ESalary salaryType;

	@Column(length = 200)
	@NotNull
	private String location;

	@Column
	@Min(0)
	private Long recruit;

	@Column(name = "create_date")
	private Date createDate;

	@Column(name = "expiration_date")
	@NotNull
	private Date expirationDate;

	@OneToOne
	@JoinColumn(name = "accepted_by")
	private Admin acceptedBy;

	@Column(name = "accepted_date")
	private Date acceptedDate;

	@ManyToOne
	@JoinColumn(name = "author")
	private Employer employer;

	@ManyToOne
	@JoinColumn(name = "field")
	private Field field;

	@ManyToOne
	@JoinColumn(name = "city")
	private City city;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "avatar_id")
	private MediaResource avatar;
}
