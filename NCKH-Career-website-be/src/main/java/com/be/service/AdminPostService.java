package com.be.service;

import java.util.Date;

import com.be.dto.PostDTO;
import com.be.payload.BaseResponse;
import com.be.payload.DataResponse;
import com.be.payload.ListWithPagingResponse;
import com.be.utility.Page;
import com.be.utility.datatype.ESalary;

public interface AdminPostService {

	ListWithPagingResponse<PostDTO> search(String keyword, Long recruit, Long salary, ESalary eSalary, Long authorId, Long fieldId, Long cityId,
			Boolean accepted, Date expirationDate, Page page);

	DataResponse<PostDTO> getPostDetail(Long postId);

	BaseResponse unAcceptPost(Long postId);

	BaseResponse acceptPost(String email, Long postId);

	Long getCountBeforSearch(String keyword, Long recruit, Long salary, ESalary eSalary, Long authorId, Long fieldId,
			Long cityId, Boolean accepted, Date expirationDate);

}
