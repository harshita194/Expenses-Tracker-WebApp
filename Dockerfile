# Stage 1 - Build the JAR(Java Application Runtime) using maven

FROM maven:3.8.3-openjdk-17 AS Builder

WORKDIR /app

COPY . .

# create JAR file 
RUN mvn clean install -DskipTests=true

# Stage 2 - execute JAR file from above stage 

FROM openjdk:17-alpine

WORKDIR /app

COPY --from=Builder /app/target/*.jar /app/expenseapp.jar

CMD ["java", "-jar", "expenseapp.jar"]
