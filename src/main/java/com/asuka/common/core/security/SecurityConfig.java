package com.asuka.common.core.security;

import com.asuka.common.core.security.handler.LoginProcessingFilter;
import com.asuka.common.core.security.handler.LogoutSuccessHandler;
import com.asuka.common.core.security.handler.PasswordEncoder;
import com.asuka.common.core.security.handler.UserDetailsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/30
 */
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final LogoutSuccessHandler logoutSuccessHandler;
    private final UserDetailsService userDetailsService;
    private final PasswordEncoder passwordEncoder;

    public SecurityConfig(LogoutSuccessHandler logoutSuccessHandler, UserDetailsService userDetailsService, PasswordEncoder passwordEncoder) {
        this.logoutSuccessHandler = logoutSuccessHandler;
        this.userDetailsService = userDetailsService;
        this.passwordEncoder = passwordEncoder;
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * anyRequest          |   匹配所有请求路径
     * access              |   SpringEl表达式结果为true时可以访问
     * anonymous           |   匿名可以访问
     * denyAll             |   用户不能访问
     * fullyAuthenticated  |   用户完全认证可以访问（非remember-me下自动登录）
     * hasAnyAuthority     |   如果有参数，参数表示权限，则其中任何一个权限可以访问
     * hasAnyRole          |   如果有参数，参数表示角色，则其中任何一个角色可以访问
     * hasAuthority        |   如果有参数，参数表示权限，则其权限可以访问
     * hasIpAddress        |   如果有参数，参数表示IP地址，如果用户IP和参数匹配，则可以访问
     * hasRole             |   如果有参数，参数表示角色，则其角色可以访问
     * permitAll           |   用户可以任意访问
     * rememberMe          |   允许通过remember-me登录的用户访问
     * authenticated       |   用户登录后可访问
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                // 过滤请求
                .authorizeRequests()
                // 允许匿名访问
                .antMatchers("/error", "/login", "/login/processing", "/assets/**", "/favicon.ico").anonymous()
                .antMatchers("/swagger-ui.html", "/swagger-resources/**").anonymous()
                // 允许任意访问
                .antMatchers(HttpMethod.OPTIONS, "/**").permitAll()
                // 需要鉴权认证
                .anyRequest().authenticated()
                .and()
                // 登录页面
                .formLogin().loginPage("/login")
                .successForwardUrl("/")
                // 登录接口
//                .loginProcessingUrl("/login/success")
                // 自定义用户名和密码属性名
//                .usernameParameter("username").passwordParameter("password")
                .and()
                // 退出登录
                .logout().logoutUrl("/logout").logoutSuccessHandler(logoutSuccessHandler)
                .and()
                // 登录认证过滤器
                .addFilterBefore(new LoginProcessingFilter(authenticationManager()), UsernamePasswordAuthenticationFilter.class)
        ;


    }

    /**
     * 登录认证配置
     *
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

}
