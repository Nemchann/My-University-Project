package com.nemchann.bookingservice.repository;

import com.nemchann.bookingservice.entity.SubscriptionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubscriptionStatusRepository extends JpaRepository<SubscriptionStatus, Integer> {
}
