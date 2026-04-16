package com.nemchann.paymentservice.repository;

import com.nemchann.paymentservice.entity.PaymentStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentStatusRepository extends JpaRepository<PaymentStatus, Integer> {
}
