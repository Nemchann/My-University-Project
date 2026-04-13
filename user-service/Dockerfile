# Этап 1: Сборка артефакта
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
# Сначала копируем только pom.xml, чтобы закешировать зависимости
COPY pom.xml .
RUN mvn dependency:go-offline
# Затем копируем исходники и собираем jar
COPY src ./src
RUN mvn clean package -DskipTests

# Этап 2: Запуск приложения
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
# Копируем скомпилированный jar из первого этапа
COPY --from=build /app/target/*.jar app.jar
# Указываем порт (для документации)
ENTRYPOINT ["java", "-jar", "app.jar"]