package tech.flowcatalyst.eventtype.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.time.Instant;

/**
 * JPA Entity for msg_event_type_spec_versions table.
 */
@Entity
@Table(name = "msg_event_type_spec_versions")
public class EventTypeSpecVersionEntity {

    @Id
    @Column(name = "id", length = 17)
    public String id;

    @Column(name = "event_type_id", nullable = false, length = 17)
    public String eventTypeId;

    @Column(name = "version", nullable = false, length = 20)
    public String version;

    @Column(name = "mime_type", length = 100)
    public String mimeType;

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "schema_content", columnDefinition = "jsonb")
    public String schemaContent;

    @Column(name = "schema_type", length = 20)
    public String schemaType;

    @Column(name = "status", nullable = false, length = 20)
    public String status;

    @Column(name = "created_at", nullable = false)
    public Instant createdAt;

    @Column(name = "updated_at", nullable = false)
    public Instant updatedAt;

    public EventTypeSpecVersionEntity() {
    }
}
