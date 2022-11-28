package com.be.controller.employer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.be.payload.post.PostCreateRequest;
import com.be.payload.post.PostUpdateRequest;
import com.be.service.AdminPostService;
import com.be.service.PostService;
import com.be.service.auth.EmployerDetails;
import com.be.utility.Page;
import com.be.utility.datatype.ESalary;

@RequestMapping("api/employer/post")
@RestController
public class EmployerPostController {
	@Autowired
	PostService postService;

	@Autowired
	AdminPostService adminPostService;

	@PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<?> createPost(@AuthenticationPrincipal EmployerDetails emp,
			@RequestPart("info") @Valid PostCreateRequest request,
			@RequestPart(name = "avatar", required = false) MultipartFile avatar) {
		return ResponseEntity.ok(postService.create(emp.getId(), request, avatar));
	}

	@PostMapping(value = "tool")
	public ResponseEntity<?> createPostByTool(@AuthenticationPrincipal EmployerDetails emp,
			@RequestBody @Valid PostCreateRequest request) {
		return ResponseEntity.ok(postService.create(emp.getId(), request, null));
	}

	@PutMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<?> updatePost(@AuthenticationPrincipal EmployerDetails emp,
			@RequestPart("info") @Valid PostUpdateRequest request,
			@RequestPart(name = "avatar", required = false) MultipartFile avatar) {
		return ResponseEntity.ok(postService.update(emp.getId(), request, avatar));
	}

	@DeleteMapping
	public ResponseEntity<?> deletePost(@AuthenticationPrincipal EmployerDetails emp,
			@RequestParam("postId") Long postId) {
		return ResponseEntity.ok(postService.deletePost(emp.getId(), postId));
	}

	@GetMapping
	public ResponseEntity<?> getPost(@AuthenticationPrincipal EmployerDetails emp,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "recruit", required = false) Long recruit,
			@RequestParam(name = "salary", required = false) Long salary,
			@RequestParam(name = "eSalary", required = false) ESalary eSalary,
			@RequestParam(name = "fieldId", required = false) Long fieldId,
			@RequestParam(name = "cityId", required = false) Long cityId,
			@RequestParam(name = "accepted", required = false) Boolean accepted,
			@RequestParam(name = "expirationDate", required = false, defaultValue = "2001-01-01") String strExpirationDate,
			@RequestParam(name = "page", required = false) Integer page,
			@RequestParam(name = "limit", required = false) Integer limit) throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date expirationDate = dateFormat.parse(strExpirationDate);
		Long count = adminPostService.getCountBeforSearch(keyword, recruit, salary, eSalary, emp.getId(), fieldId,
				cityId, accepted, expirationDate);

		return ResponseEntity.ok(adminPostService.search(keyword, recruit, salary, eSalary, emp.getId(), fieldId,
				cityId, accepted, expirationDate, new Page(page, limit, count.intValue())));
	}

	@GetMapping("{postId}")
	public ResponseEntity<?> getDetail(@AuthenticationPrincipal EmployerDetails emp,
			@PathVariable("postId") Long postId) {
		return ResponseEntity.ok(postService.getEmployerPostDetail(emp.getId(), postId));
	}
}
