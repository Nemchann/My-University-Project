package com.nemchann.scheduleservice.repository;

import com.nemchann.scheduleservice.entity.Workout;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WorkoutTypeRepository extends JpaRepository<Workout, Integer> {
}
