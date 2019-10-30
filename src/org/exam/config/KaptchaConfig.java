package org.exam.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;

/**
 * DefaultKaptcha生成验证码+解决服务器验证码乱码问题
 * 参考：https://blog.csdn.net/weixin_39179428/article/details/82793016
 * @author Lynch
 */
@Component  
public class KaptchaConfig {  
    @Bean  
    public DefaultKaptcha getDefaultKaptcha(){  
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        Properties properties = new Properties();  
        properties.setProperty("kaptcha.border", "no");
        properties.setProperty("kaptcha.border.color", "105,179,90");
        properties.setProperty("kaptcha.textproducer.font.color", "black");
        properties.setProperty("kaptcha.image.width", "125");
        properties.setProperty("kaptcha.image.height", "45");
        properties.setProperty("kaptcha.textproducer.font.size", "35");
        properties.setProperty("kaptcha.textproducer.char.length", "4");
        properties.setProperty("kaptcha.textproducer.font.names", "宋体,楷体,微软雅黑");  
        Config config = new Config(properties);  
        defaultKaptcha.setConfig(config);  
        return defaultKaptcha;
    }
}  