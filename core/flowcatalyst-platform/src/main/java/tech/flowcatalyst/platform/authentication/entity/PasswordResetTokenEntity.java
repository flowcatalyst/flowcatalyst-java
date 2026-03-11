package tech.flowcatalyst.platform.authentication.entity;

import jakarta.persistence.*;

import java.time.Instant;

/**
 * JPA Entity for iam_password_reset_tokens table.
 */
@Entity
@Table(name = "iam_password_reset_tokens")
public class PasswordResetTokenEntity {

    @Id
    @Column(name = "id", length = 17)
    public String id;

    @Column(name = "principal_id", nullable = false, length = 17)
    public String principalId;

    @Column(name = "token_hash", nullable = false, unique = true, length = 64)
    public String tokenHash;

    @Column(name = "expires_at", nullable = false)
    public Instant expiresAt;

    @Column(name = "created_at", nullable = false)
    public Instant createdAt;

    public PasswordResetTokenEntity() {
    }
}
