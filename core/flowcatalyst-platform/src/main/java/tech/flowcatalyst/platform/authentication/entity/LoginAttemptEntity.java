package tech.flowcatalyst.platform.authentication.entity;

import jakarta.persistence.*;

import java.time.Instant;

/**
 * JPA Entity for iam_login_attempts table.
 */
@Entity
@Table(name = "iam_login_attempts")
public class LoginAttemptEntity {

    @Id
    @Column(name = "id", length = 17)
    public String id;

    @Column(name = "attempt_type", nullable = false, length = 20)
    public String attemptType;

    @Column(name = "outcome", nullable = false, length = 20)
    public String outcome;

    @Column(name = "failure_reason", length = 100)
    public String failureReason;

    @Column(name = "identifier", length = 255)
    public String identifier;

    @Column(name = "principal_id", length = 17)
    public String principalId;

    @Column(name = "ip_address", length = 45)
    public String ipAddress;

    @Column(name = "user_agent", columnDefinition = "text")
    public String userAgent;

    @Column(name = "attempted_at", nullable = false)
    public Instant attemptedAt;

    public LoginAttemptEntity() {
    }
}
