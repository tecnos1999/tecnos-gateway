package com.example.tecnosgateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.reactive.function.client.WebClient;
@SpringBootApplication
public class TecnosGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(TecnosGatewayApplication.class, args);
    }
    @Bean
    @LoadBalanced
    public WebClient.Builder loadBalancedWebClientBuilder() {
        return WebClient.builder();
    }
}
