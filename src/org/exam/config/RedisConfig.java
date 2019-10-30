package org.exam.config;


import java.io.IOException;
import java.time.Duration;
import java.util.Properties;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisPassword;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.jedis.JedisClientConfiguration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
@EnableCaching
public class RedisConfig extends CachingConfigurerSupport {

    @Bean
    public CacheManager cacheManager(RedisConnectionFactory factory) {
        return RedisCacheManager.builder(RedisCacheWriter.nonLockingRedisCacheWriter(factory))
                .cacheDefaults(RedisCacheConfiguration.defaultCacheConfig().entryTtl(Duration.ofDays(30)))
                .transactionAware()
                .build();
    }
    
    /**
     *  redisTemplate需要RedisConnectionFactory前驱
     * @return
     * @throws IOException
     */
    @Bean
    public JedisConnectionFactory jedisConnectionFactory() throws IOException {
        RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration ();
        Properties prop = PropertiesLoaderUtils.loadAllProperties("redis.properties");
        redisStandaloneConfiguration.setHostName(prop.getProperty("hostName"));
        redisStandaloneConfiguration.setPort(Integer.parseInt(prop.getProperty("port")));
        redisStandaloneConfiguration.setDatabase(16);
        redisStandaloneConfiguration.setPassword(RedisPassword.of(prop.getProperty("password")));

        JedisClientConfiguration.JedisClientConfigurationBuilder jedisClientConfiguration = JedisClientConfiguration.builder();
        jedisClientConfiguration.connectTimeout(Duration.ofMillis(Long.parseLong(prop.getProperty("timeout"))));//  connection timeout

        JedisConnectionFactory factory = new JedisConnectionFactory(redisStandaloneConfiguration,
                jedisClientConfiguration.build());
        return factory;
    }
    
    /**
     * 重写Redis序列化方式，使用Json方式:
     * 当我们的数据存储到Redis的时候，我们的键（key）和值（value）都是通过Spring提供的Serializer序列化到数据库的。
     * RedisTemplate默认使用的是JdkSerializationRedisSerializer，StringRedisTemplate默认使用的是StringRedisSerializer。
     * Spring Data JPA为我们提供了下面的Serializer：
     * GenericToStringSerializer、Jackson2JsonRedisSerializer、JacksonJsonRedisSerializer、
     * JdkSerializationRedisSerializer、OxmSerializer、StringRedisSerializer。
     * 在此我们将自己配置RedisTemplate并定义Serializer。
     * @param factory
     * @return
     */
    @Bean
    public RedisTemplate<?, ?> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(factory);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        GenericJackson2JsonRedisSerializer jackson2JsonRedisSerializer = new GenericJackson2JsonRedisSerializer(om);
        // 设置键（key）的序列化采用StringRedisSerializer。
        template.setValueSerializer(jackson2JsonRedisSerializer);
        template.setKeySerializer(jackson2JsonRedisSerializer);
        template.afterPropertiesSet();
        return template;
    }
}
