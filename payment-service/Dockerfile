FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
# Копируем настройки и исходники
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
# Собираем проект, пропуская тесты для скорости
RUN mvn clean package -DskipTests

# ЭТАП 2: Запуск (используем легкий JRE)
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
# Копируем только готовый jar-файл из первого этапа
COPY --from=build /app/target/*.jar app.jar
# Запускаем приложение
ENTRYPOINT ["java", "-jar", "app.jar"]