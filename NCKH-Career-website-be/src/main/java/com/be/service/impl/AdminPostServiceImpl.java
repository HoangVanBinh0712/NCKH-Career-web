package com.be.service.impl;

import java.util.Date;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.be.controller.exception.CommonRuntimeException;
import com.be.dto.PostDTO;
import com.be.model.Admin;
import com.be.model.Post;
import com.be.payload.BaseResponse;
import com.be.payload.DataResponse;
import com.be.payload.ListWithPagingResponse;
import com.be.repository.AdminRepository;
import com.be.repository.PostRepository;
import com.be.service.AdminPostService;
import com.be.utility.Page;
import com.be.utility.datatype.ESalary;

@Service
public class AdminPostServiceImpl implements AdminPostService {
	@Autowired
	PostRepository postRepository;

	@Autowired
	ModelMapper modelMapper;

	@Autowired
	AdminRepository adminRepository;

	@Override
	public BaseResponse acceptPost(String email, Long postId) {
		Optional<Post> optPost = postRepository.findById(postId);
		if (optPost.isEmpty())
			throw new CommonRuntimeException("Post not found with id: " + postId);
		Post post = optPost.get();
		Admin admin = adminRepository.findByEmail(email).get();
		post.setAcceptedBy(admin);
		post.setAcceptedDate(new Date());

		postRepository.save(post);
		return new BaseResponse(true, "Accept susscessfully post with id: " + postId);
	}

	@Override
	public BaseResponse unAcceptPost(Long postId) {
		Optional<Post> optPost = postRepository.findById(postId);
		if (optPost.isEmpty())
			throw new CommonRuntimeException("Post not found with id: " + postId);
		Post post = optPost.get();
		post.setAcceptedBy(null);
		post.setAcceptedDate(null);

		postRepository.save(post);
		return new BaseResponse(true, "Unaccept susscessfully post with id: " + postId);
	}

	@Override
	public DataResponse<PostDTO> getPostDetail(Long postId) {
		Optional<Post> optPost = postRepository.findById(postId);
		if (optPost.isEmpty())
			throw new CommonRuntimeException("Post not found with id: " + postId);
		return new DataResponse<>(true, "", modelMapper.map(optPost.get(), PostDTO.class));
	}

	@Override
	public Long getCountBeforSearch(String keyword, Long recruit, Long salary, ESalary eSalary, Long authorId,
			Long fieldId, Long cityId, Boolean accepted, Date expirationDate)
	{
		return postRepository.adminCountBeforeSearch(keyword, recruit, salary, eSalary, authorId, fieldId, cityId, accepted, expirationDate);
	}
	
	@Override
	public ListWithPagingResponse<PostDTO> search(String keyword, Long recruit, Long salary, ESalary eSalary,
			Long authorId, Long fieldId, Long cityId, Boolean accepted, Date expirationDate, Page page) {

		return new ListWithPagingResponse<>(page.getPageNumber() + 1, page.getTotalPage(),page.getPageSize(),
				postRepository.adminSearch(keyword, recruit, salary, eSalary, authorId, fieldId, cityId, accepted,
						expirationDate, page).stream().map(p -> modelMapper.map(p, PostDTO.class)).toList());
	}
}
