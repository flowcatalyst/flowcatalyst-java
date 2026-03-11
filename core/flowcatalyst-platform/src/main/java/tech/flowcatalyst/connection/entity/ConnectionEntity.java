package tech.flowcatalyst.connection.entity;

import jakarta.persistence.*;

import java.time.Instant;

/**
 * JPA Entity for msg_connections table.
 */
@Entity
@Table(name = "msg_connections")
public class ConnectionEntity {

    @Id
    @Column(name = "id", length = 17)
    public String id;

    @Column(name = "code", nullable = false, length = 100)
    public String code;

    @Column(name = "name", nullable = false, length = 255)
    public String name;

    @Column(name = "description", length = 500)
    public String description;

    @Column(name = "endpoint", length = 500)
    public String endpoint;

    @Column(name = "external_id", length = 100)
    public String externalId;

    @Column(name = "status", nullable = false, length = 20)
    public String status;

    @Column(name = "service_account_id", length = 17)
    public String serviceAccountId;

    @Column(name = "client_id", length = 17)
    public String clientId;

    @Column(name = "client_identifier", length = 100)
    public String clientIdentifier;

    @Column(name = "created_at", nullable = false)
    public Instant createdAt;

    @Column(name = "updated_at", nullable = false)
    public Instant updatedAt;

    public ConnectionEntity() {
    }
}
