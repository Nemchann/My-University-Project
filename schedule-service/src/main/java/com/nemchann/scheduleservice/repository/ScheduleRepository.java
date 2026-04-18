package com.nemchann.scheduleservice.repository;

import com.nemchann.scheduleservice.entity.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
}
