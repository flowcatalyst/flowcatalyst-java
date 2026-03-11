package tech.flowcatalyst.platform.authentication.domain.entity;

import jakarta.persistence.*;

import java.time.Instant;

/**
 * JPA Entity for tnt_anchor_domains table.
 */
@Entity
@Table(name = "tnt_anchor_domains")
public class AnchorDomainEntity {

    @Id
    @Column(name = "id", length = 17)
    public String id;

    @Column(name = "domain", nullable = false, unique = true, length = 255)
    public String domain;

    @Column(name = "created_at", nullable = false)
    public Instant createdAt;

    @Column(name = "updated_at", nullable = false)
    public Instant updatedAt;

    public AnchorDomainEntity() {
    }
}
