package tech.flowcatalyst.eventtype.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import tech.flowcatalyst.eventtype.EventTypeSource;
import tech.flowcatalyst.eventtype.EventTypeStatus;

import java.time.Instant;

/**
 * JPA entity for event_types table.
 */
@Entity
@Table(name = "msg_event_types")
public class EventTypeEntity {

    @Id
    @Column(name = "id", length = 17)
    public String id;

    @Column(name = "code", nullable = false, unique = true, length = 255)
    public String code;

    @Column(name = "name", nullable = false, length = 255)
    public String name;

    @Column(name = "description", columnDefinition = "TEXT")
    public String description;

    @Column(name = "status", nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    public EventTypeStatus status;

    @Column(name = "source", nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    public EventTypeSource source;

    @Column(name = "client_scoped", nullable = false)
    public boolean clientScoped;

    @Column(name = "application", nullable = false, length = 100)
    public String application;

    @Column(name = "subdomain", nullable = false, length = 100)
    public String subdomain;

    @Column(name = "aggregate", nullable = false, length = 100)
    public String aggregate;

    @Column(name = "created_at", nullable = false)
    public Instant createdAt;

    @Column(name = "updated_at", nullable = false)
    public Instant updatedAt;

    public EventTypeEntity() {
    }
}
