package com.rotina.app.shared.session;

import org.springframework.data.redis.core.RedisTemplate;

import java.time.Duration;

public class Session<K, V> {

    private final RedisTemplate<K, V> redisTemplate;

    public Session(RedisTemplate<K, V> redisTemplate) {
        this.redisTemplate =  redisTemplate;
    }

    public void SessionSet(K key, V value, Duration duration) {
        this.redisTemplate.opsForValue().set(key, value, duration);
    }

    public V SessionGetKey(K key) {
        return this.redisTemplate.opsForValue().get(key);
    }

    public Boolean SessionDelete(K key) {
       return this.redisTemplate.delete(key);
    }

    public Boolean SessionCollectionsDelete(K key) {
        return this.redisTemplate.delete(key);
    }

}
