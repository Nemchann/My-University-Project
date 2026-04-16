package com.nemchann.bookingservice.repository;

import com.nemchann.bookingservice.entity.ClientSubscription;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientSubscriptionRepository extends JpaRepository<ClientSubscription, Integer> {
}
