package com.be.config;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import com.be.service.impl.UserDetailsServiceImpl;
import com.be.utility.jwt.JwtUtils;

public class AuthTokenFilter extends OncePerRequestFilter {
	@Autowired
	JwtUtils jwtUtils;
	@Autowired
	private CustomAuthenticationEntryPoint authenticationExceptionHandling;

	@Autowired
	private UserDetailsServiceImpl userDetailsService;

	List<String> allows = Arrays.asList("/api/admin/login", "/api/admin/signup", "/api/employer/login",
			"/api/employer/signup", "/api/user/login", "/api/user/signup", "/api/employer/sendpasswordresetcode",
			"/api/employer/resetpassword", "/api/user/sendpasswordresetcode", "/api/user/resetpassword");

	@SuppressWarnings("serial")
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		if (!allows.contains(request.getRequestURI()))
			if (SecurityContextHolder.getContext().getAuthentication() == null) {
				try {
					String token = jwtUtils.parseJwt(request);

					if (token != null && !jwtUtils.isTokenExpired(token)) {
						String usernameWithRolePrefix = jwtUtils.getUsernameWithRolePrefixFromJwtToken(token);

						UserDetails userDetails = userDetailsService.loadUserByUsername(usernameWithRolePrefix);
						UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
								userDetails, null, userDetails.getAuthorities());
						authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
						SecurityContextHolder.getContext().setAuthentication(authentication);
					}
				} catch (Exception e) {
					authenticationExceptionHandling.commence(request, response,
							new AuthenticationException(e.getMessage(), e) {
							});
					return;
				}

			}

		filterChain.doFilter(request, response);
	}
}