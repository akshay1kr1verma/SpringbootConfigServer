# Spring Boot Config Server

A centralized configuration server built using Spring Cloud Config Server.

This application fetches configuration files from a GitHub repository and serves them to client microservices.

## Architecture

```text
Client Microservices
        ↓
Spring Cloud Config Server
        ↓
GitHub Config Repository
```

## Tech Stack

- Java 17+
- Spring Boot
- Spring Cloud Config Server
- Maven
- GitHub

## Features

- Centralized configuration management
- Git-backed configuration
- Environment/profile-based config loading
- Externalized properties
- REST-based configuration access

## Dependencies

- Spring Cloud Config Server
- Spring Web
- Actuator

## Enable Config Server

```java
@EnableConfigServer
@SpringBootApplication
public class SpringbootConfigServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringbootConfigServerApplication.class, args);
    }
}
```

## application.properties

```properties
server.port=8888

spring.application.name=config-server
spring.profiles.active=git

spring.cloud.config.server.git.uri=https://github.com/akshay1kr1verma/centralconfig
spring.cloud.config.server.git.username=YOUR_GITHUB_USERNAME
spring.cloud.config.server.git.password=YOUR_GITHUB_PAT

spring.cloud.config.server.git.clone-on-start=true
```

## Running the Application

```bash
mvn spring-boot:run
```

## Verify Config Server

Open:

```text
http://localhost:8888/order-service/dev
```

Expected response:

```json
{
  "name": "order-service",
  "profiles": ["dev"]
}
```

## Config Fetching Flow

```text
Client Application
        ↓
Calls Config Server
        ↓
Config Server Clones GitHub Repo
        ↓
Reads Matching Config File
        ↓
Returns Properties as JSON
```

## Supported Endpoints

| Endpoint | Description |
|----------|-------------|
| `/application/default` | Default configuration |
| `/order-service/dev` | Profile-specific config |
| `/actuator/health` | Health endpoint |

## Related Repositories

- SpringOrderserviceConfigClient
- centralconfig

## Learning Objectives

This project demonstrates:

- Spring Cloud Config Server setup
- Git integration with Config Server
- Fine-grained GitHub PAT usage
- Centralized configuration management
- Microservice externalized configuration
