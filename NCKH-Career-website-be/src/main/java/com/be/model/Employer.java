package com.be.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Employer extends BaseEntity {

	// Number of employee
	@Column
	private Long employee;

	@ManyToOne
	@JoinColumn(name = "field_id")
	private Field field;

	@OneToMany(mappedBy = "employer")
	private List<Post> posts;
}
