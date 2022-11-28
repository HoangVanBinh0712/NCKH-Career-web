package com.be.service.impl;

import java.io.IOException;
import java.util.Optional;

import org.apache.commons.lang3.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.be.controller.exception.CommonRuntimeException;
import com.be.dto.EmployerDTO;
import com.be.model.City;
import com.be.model.Employer;
import com.be.model.Field;
import com.be.model.MediaResource;
import com.be.payload.BaseResponse;
import com.be.payload.DataResponse;
import com.be.payload.auth.EmployerProfileCreateRequest;
import com.be.payload.auth.EmployerProfileUpdateRequest;
import com.be.payload.auth.PasswordUpdateRequest;
import com.be.repository.CityRepository;
import com.be.repository.EmployerRepository;
import com.be.repository.FieldRepository;
import com.be.service.EmployerService;
import com.be.service.MediaResourceService;

@Service
public class EmployerServiceImpl implements EmployerService {

	@Autowired
	EmployerRepository employerRepository;

	@Autowired
	FieldRepository fieldRepository;

	@Autowired
	CityRepository cityRepository;
	@Autowired
	ModelMapper modelMapper;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Autowired
	MediaResourceService mediaResourceService;

	@Override
	public DataResponse<EmployerDTO> create(EmployerProfileCreateRequest request) {

		if (employerRepository.findByEmail(request.getEmail()).isPresent()) {
			throw new CommonRuntimeException("Email already exists");
		}
		if (employerRepository.existsByPhone(request.getPhone())) {
			throw new CommonRuntimeException("Phone number already exists");
		}

		Field field = fieldRepository.getReferenceById(request.getField());

		Employer employer = modelMapper.map(request, Employer.class);
		employer.setPassword(passwordEncoder.encode(request.getPassword()));
		employer.setActive(true);
		employer.setEmailConfirm(false);
		employer.setField(field);

		return new DataResponse<>(true, "", modelMapper.map(employerRepository.save(employer), EmployerDTO.class));
	}

	@Override
	public BaseResponse changePassword(String email, PasswordUpdateRequest request) {
		Optional<Employer> optEmployer = employerRepository.findByEmail(email);
		if (optEmployer.isEmpty())
			throw new CommonRuntimeException("User not found with Email: " + email);
		Employer employer = optEmployer.get();

		if (passwordEncoder.matches(request.getOldPassword(), employer.getPassword()))
			employer.setPassword(passwordEncoder.encode(request.getNewPassword()));
		else
			throw new CommonRuntimeException("Old password invalid !");

		employerRepository.save(employer);

		return new BaseResponse(true, "Change password successfully !");
	}

	@Override
	public EmployerDTO getEmployerProfile(String email) {
		Optional<Employer> optEmployer = employerRepository.findByEmail(email);
		if (optEmployer.isEmpty())
			throw new CommonRuntimeException("User not found with Email: " + email);

		return modelMapper.map(optEmployer.get(), EmployerDTO.class);
	}

	@Override
	@Transactional(timeout = 60)
	public DataResponse<EmployerDTO> update(Long employerId, EmployerProfileUpdateRequest request,
			MultipartFile avatar) {
		Optional<Employer> optEmployer = employerRepository.findById(request.getId());
		if (optEmployer.isEmpty())
			throw new CommonRuntimeException("User not found with Id: " + request.getId());
		Employer employer = optEmployer.get();
		if (employer.getId() != employerId)
			throw new CommonRuntimeException("You do not have right to change other peple information !");
		if (request != null) {
			if (StringUtils.isNotBlank(request.getEmail()) && !request.getEmail().equals(employer.getEmail())
					&& employerRepository.existsByEmail(request.getEmail())) {
				throw new CommonRuntimeException("Email already exists");

			}
			if (!StringUtils.isBlank(request.getPhone()) && !request.getPhone().equals(employer.getPhone())
					&& employerRepository.existsByPhone(request.getPhone())) {
				throw new CommonRuntimeException("Phone number already exists");
			}

			if (StringUtils.isNotBlank(request.getEmail()) && !request.getEmail().equals(employer.getEmail())
					&& !employerRepository.existsByEmail(request.getEmail())) {
				employer.setEmail(request.getEmail());
				employer.setEmailConfirm(false);
			}
			if (StringUtils.isNotBlank(request.getPhone()) && !request.getPhone().equals(employer.getPhone())
					&& !employerRepository.existsByPhone(request.getPhone())) {
				employer.setPhone(request.getPhone());
			}
			if (StringUtils.isNotBlank(request.getName()) && !request.getName().equals(employer.getName())) {
				employer.setName(request.getName());
			}
			if (request.getEmployee() != null && !request.getEmployee().equals(employer.getEmployee())) {
				employer.setEmployee(request.getEmployee());
			}
			if (StringUtils.isNotBlank(request.getAddress()) && !request.getAddress().equals(employer.getAddress())) {
				employer.setAddress(request.getAddress());
			}
		}

		if (request.getCityId() != null) {
			City city = cityRepository.getReferenceById(request.getCityId());
			employer.setCity(city);
		}

		if (request.getFieldId() != null) {
			Field field = fieldRepository.getReferenceById(request.getFieldId());
			employer.setField(field);
		}

		if (avatar != null) {
			if (employer.getAvatar() != null)
				if (!mediaResourceService.delete(employer.getAvatar().getId())) {
					throw new CommonRuntimeException("Error occur when deleting old image !");
				}
			// Up load new Image
			try {
				MediaResource img = mediaResourceService.save(avatar.getBytes());
				employer.setAvatar(img);
			} catch (IOException e) {
				throw new CommonRuntimeException("Error occur when uploading new image !");
			}
		}

		employer = employerRepository.save(employer);

		return new DataResponse<>(true, "", modelMapper.map(employer, EmployerDTO.class));
	}

	@Override
	public EmployerDTO getEmployerById(Long id) {
		Optional<Employer> optEmployer = employerRepository.findById(id);
		if (optEmployer.isEmpty())
			throw new CommonRuntimeException("Employer not found with Id: " + id);

		return modelMapper.map(optEmployer.get(), EmployerDTO.class);
	}

}
