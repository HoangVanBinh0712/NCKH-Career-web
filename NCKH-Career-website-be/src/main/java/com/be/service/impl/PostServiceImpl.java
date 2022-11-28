package com.be.service.impl;

import java.util.Date;
import java.util.Optional;

import org.apache.commons.lang3.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.be.controller.exception.CommonRuntimeException;
import com.be.dto.PostDTO;
import com.be.model.City;
import com.be.model.Employer;
import com.be.model.Field;
import com.be.model.MediaResource;
import com.be.model.Post;
import com.be.payload.BaseResponse;
import com.be.payload.DataResponse;
import com.be.payload.post.PostCreateRequest;
import com.be.payload.post.PostUpdateRequest;
import com.be.repository.CVSubmitRepository;
import com.be.repository.CityRepository;
import com.be.repository.EmployerRepository;
import com.be.repository.FieldRepository;
import com.be.repository.PostRepository;
import com.be.service.MediaResourceService;
import com.be.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostRepository postRepository;

	@Autowired
	ModelMapper modelMapper;

	@Autowired
	CityRepository cityRepository;

	@Autowired
	FieldRepository fieldRepository;

	@Autowired
	EmployerRepository employerRepository;

	@Autowired
	MediaResourceService mediaResourceService;

	@Autowired
	CVSubmitRepository cvSubmitRepository;

	@Override
	@Transactional(timeout = 600)
	public DataResponse<PostDTO> create(Long empId, PostCreateRequest request, MultipartFile avatar) {
	
		Post post = modelMapper.map(request, Post.class);

		Optional<City> city = cityRepository.findByCode(request.getCityCode());
		if (city.isEmpty())
			throw new CommonRuntimeException("City not found with code: " + request.getCityCode());

		Optional<Field> field = fieldRepository.findByCode(request.getFieldCode());

		if (field.isEmpty())
			throw new CommonRuntimeException("Field not found with code: " + request.getFieldCode());

		Employer emp = employerRepository.getReferenceById(empId);
		post.setCreateDate(new Date());
		post.setCity(city.get());
		post.setField(field.get());
		post.setEmployer(emp);
		if (avatar != null)
			try {
				MediaResource mr = mediaResourceService.save(avatar.getBytes());
				post.setAvatar(mr);

			} catch (Exception e) {
				throw new CommonRuntimeException("Error occur when uploading avatar please try again !");
			}
		post = postRepository.save(post);

		return new DataResponse<>(true, "Add new post success fully .", modelMapper.map(post, PostDTO.class));
	}

	@Override
	@Transactional(timeout = 600)
	public DataResponse<PostDTO> update(Long empId, PostUpdateRequest request, MultipartFile avatar) {

		Optional<Post> optPost = postRepository.findById(request.getId());

		if (optPost.isEmpty())
			throw new CommonRuntimeException("Post not found with id: " + request.getId());

		Post post = optPost.get();
		if (!post.getEmployer().getId().equals(empId))
			throw new CommonRuntimeException("Unable to update other employer's post.");

		if (!StringUtils.isBlank(request.getTitle()))
			post.setTitle(request.getTitle());

		if (!StringUtils.isBlank(request.getDescription()))
			post.setDescription(request.getDescription());
		if (request.getSalary() != null)
			post.setSalary(request.getSalary());
		if (request.getSalaryType() != null)
			post.setSalaryType(request.getSalaryType());
		if (!StringUtils.isBlank(request.getCityCode())) {
			Optional<City> city = cityRepository.findByCode(request.getCityCode());
			if (city.isEmpty())
				throw new CommonRuntimeException("City not found with code: " + request.getCityCode());
			post.setCity(city.get());
		}
		if (!StringUtils.isBlank(request.getFieldCode())) {
			Optional<Field> field = fieldRepository.findByCode(request.getFieldCode());
			if (field.isEmpty())
				throw new CommonRuntimeException("Field not found with code: " + request.getFieldCode());
			post.setField(field.get());

		}
		if (!StringUtils.isBlank(request.getLocation()))
			post.setLocation(request.getLocation());
		if (request.getRecruit() != null)
			post.setRecruit(request.getRecruit());
		if (request.getExpirationDate() != null)
			post.setExpirationDate(request.getExpirationDate());
		post.setCreateDate(new Date());
		if (avatar != null)
			try {
				if (post.getAvatar() != null && !mediaResourceService.delete(post.getAvatar().getId()))
					throw new CommonRuntimeException("Error occur when deleting avatar please try again !");
				MediaResource mr = mediaResourceService.save(avatar.getBytes());
				post.setAvatar(mr);

			} catch (Exception e) {
				throw new CommonRuntimeException("Error occur when uploading avatar please try again !");
			}
		post = postRepository.save(post);

		return new DataResponse<>(true, "Update Post Success Fully !", modelMapper.map(post, PostDTO.class));
	}

	@Override
	@Transactional
	public BaseResponse deletePost(Long empId, Long postId) {
		Optional<Post> optPost = postRepository.findById(postId);

		if (optPost.isEmpty())
			throw new CommonRuntimeException("Post not found with id: " + postId);

		Post post = optPost.get();
		if (!post.getEmployer().getId().equals(empId))
			throw new CommonRuntimeException("Unable to delete other employer's post.");

		cvSubmitRepository.deleteByPost(postId);

		postRepository.delete(post);

		return new BaseResponse(true, "Delete successfully post with id: " + postId);
	}

	@Override
	public DataResponse<PostDTO> getDetail(Long postId) {
		Optional<Post> optPost = postRepository.findById(postId);
		if (optPost.isEmpty() || optPost.get().getAcceptedBy() == null)
			throw new CommonRuntimeException("Post not found with id: " + postId);

		return new DataResponse<>(true, "", modelMapper.map(optPost.get(), PostDTO.class));
	}

	@Override
	public DataResponse<PostDTO> getEmployerPostDetail(Long empId, Long postId) {
		Optional<Post> optPost = postRepository.findById(postId);
		if (optPost.isEmpty())
			throw new CommonRuntimeException("Post not found with id: " + postId);
		Post post = optPost.get();
		if (post.getEmployer().getId() != empId)
			throw new CommonRuntimeException("Post not found with id: " + postId);

		return new DataResponse<>(true, "", modelMapper.map(post, PostDTO.class));
	}

}
