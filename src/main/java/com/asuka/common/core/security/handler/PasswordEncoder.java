package com.asuka.common.core.security.handler;

import cn.hutool.crypto.SecureUtil;
import org.springframework.stereotype.Component;

/**
 * 自定义密码处理器
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/30
 */
@Component
public class PasswordEncoder implements org.springframework.security.crypto.password.PasswordEncoder {

    @Override
    public String encode(CharSequence rawPassword) {
        return SecureUtil.md5(rawPassword.toString());
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return encodedPassword.equals(SecureUtil.md5(rawPassword.toString()));
    }

    /**
     * Returns true if the encoded password should be encoded again for better security,
     * else false. The default implementation always returns false.
     * @param encodedPassword the encoded password to check
     * @return true if the encoded password should be encoded again for better security,
     * else false.
     */
    @Override
    public boolean upgradeEncoding(String encodedPassword) {
        return false;
    }
}
