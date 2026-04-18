package com.nemchann.scheduleservice.repository;

import com.nemchann.scheduleservice.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepository extends JpaRepository<Room, Integer> {
}
