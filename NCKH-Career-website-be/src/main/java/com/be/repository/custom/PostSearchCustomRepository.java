package com.be.repository.custom;

import java.util.Date;
import java.util.List;

import com.be.model.Post;
import com.be.utility.Page;
import com.be.utility.datatype.ESalary;

public interface PostSearchCustomRepository {

	Long adminCountBeforeSearch(String keyword, Long recruit, Long salary, ESalary eSalary, Long authorId, Long fieldId,
			Long cityId, Boolean accepted, Date expirationDate);

	List<Post> adminSearch(String keyword, Long recruit, Long salary, ESalary eSalary, Long authorId, Long fieldId, Long cityId,
			Boolean accepted, Date expirationDate, Page page);

}
