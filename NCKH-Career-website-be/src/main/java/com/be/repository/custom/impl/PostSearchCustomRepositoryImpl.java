package com.be.repository.custom.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.be.model.Post;
import com.be.model.Post_;
import com.be.repository.custom.PostSearchCustomRepository;
import com.be.utility.Page;
import com.be.utility.datatype.ESalary;

@Repository
public class PostSearchCustomRepositoryImpl implements PostSearchCustomRepository {

	@PersistenceContext
	EntityManager em;

	@Override
	public List<Post> adminSearch(String keyword, Long recruit, Long salary, ESalary eSalary, Long authorId,
			Long fieldId, Long cityId, Boolean accepted, Date expirationDate, Page page) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Post> cq = cb.createQuery(Post.class);
		Root<Post> root = cq.from(Post.class);
		List<Predicate> lstPredicate = new ArrayList<>();

		if (StringUtils.isNotBlank(keyword))
			lstPredicate.add(cb.like(root.get(Post_.title), "%" + keyword + "%"));

		if (recruit != null)
			lstPredicate.add(cb.greaterThanOrEqualTo(root.get(Post_.recruit), recruit));
		if (salary != null)
			lstPredicate.add(cb.greaterThanOrEqualTo(root.get(Post_.salary), salary));
		if (eSalary != null)
			lstPredicate.add(cb.equal(root.get(Post_.salaryType), eSalary));
		if (authorId != null)
			lstPredicate.add(cb.equal(root.get(Post_.employer), authorId));
		if (fieldId != null)
			lstPredicate.add(cb.equal(root.get(Post_.field), fieldId));
		if (cityId != null)
			lstPredicate.add(cb.equal(root.get(Post_.city), cityId));
		if (expirationDate != null)
			lstPredicate.add(cb.greaterThanOrEqualTo(root.get(Post_.expirationDate), expirationDate));
		if (accepted != null) {
			if (accepted)
				lstPredicate.add(cb.isNotNull(root.get(Post_.ACCEPTED_BY)));
			else
				lstPredicate.add(cb.isNull(root.get(Post_.ACCEPTED_BY)));
		}

		Predicate predicate = cb.and(lstPredicate.toArray(new Predicate[0]));

		cq.select(root).where(predicate);
		TypedQuery<Post> query = em.createQuery(cq);

		query.setFirstResult(page.getPageNumber() * page.getPageSize());
		query.setMaxResults(page.getPageSize());

		return query.getResultList();
	}

	@Override
	public Long adminCountBeforeSearch(String keyword, Long recruit, Long salary, ESalary eSalary, Long authorId,
			Long fieldId, Long cityId, Boolean accepted, Date expirationDate) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<Post> root = cq.from(Post.class);
		List<Predicate> lstPredicate = new ArrayList<>();

		if (StringUtils.isNotBlank(keyword))
			lstPredicate.add(cb.like(root.get(Post_.title), "%" + keyword + "%"));

		if (recruit != null)
			lstPredicate.add(cb.greaterThanOrEqualTo(root.get(Post_.recruit), recruit));
		if (salary != null)
			lstPredicate.add(cb.greaterThanOrEqualTo(root.get(Post_.salary), salary));
		if (eSalary != null)
			lstPredicate.add(cb.equal(root.get(Post_.salaryType), eSalary));
		if (authorId != null)
			lstPredicate.add(cb.equal(root.get(Post_.employer), authorId));
		if (fieldId != null)
			lstPredicate.add(cb.equal(root.get(Post_.field), fieldId));
		if (cityId != null)
			lstPredicate.add(cb.equal(root.get(Post_.city), cityId));
		if (expirationDate != null)
			lstPredicate.add(cb.greaterThanOrEqualTo(root.get(Post_.expirationDate), expirationDate));
		if (accepted != null) {
			if (accepted)
				lstPredicate.add(cb.isNotNull(root.get(Post_.ACCEPTED_BY)));
			else
				lstPredicate.add(cb.isNull(root.get(Post_.ACCEPTED_BY)));
		}

		Predicate predicate = cb.and(lstPredicate.toArray(new Predicate[0]));

		cq.select(cb.count(root)).where(predicate);
		TypedQuery<Long> query = em.createQuery(cq);

		return query.getSingleResult();
	}
}
