package tech.flowcatalyst.platform.authentication.oidc.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.time.Instant;

/**
 * JPA Entity for oauth_oidc_payloads table.
 */
@Entity
@Table(name = "oauth_oidc_payloads")
public class OidcPayloadEntity {

    @Id
    @Column(name = "id", length = 128)
    public String id;

    @Column(name = "type", nullable = false, length = 64)
    public String type;

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "payload", columnDefinition = "jsonb")
    public String payload;

    @Column(name = "grant_id", length = 128)
    public String grantId;

    @Column(name = "user_code", length = 128)
    public String userCode;

    @Column(name = "uid", length = 128)
    public String uid;

    @Column(name = "expires_at")
    public Instant expiresAt;

    @Column(name = "consumed_at")
    public Instant consumedAt;

    @Column(name = "created_at", nullable = false)
    public Instant createdAt;

    public OidcPayloadEntity() {
    }
}
