package tech.flowcatalyst.eventtype.mapper;

import tech.flowcatalyst.eventtype.*;
import tech.flowcatalyst.eventtype.entity.EventTypeEntity;
import tech.flowcatalyst.eventtype.entity.EventTypeSpecVersionEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * Mapper for converting between EventType domain model and JPA entity.
 */
public final class EventTypeMapper {

    private EventTypeMapper() {
    }

    public static EventType toDomain(EventTypeEntity entity) {
        if (entity == null) {
            return null;
        }

        return EventType.builder()
            .id(entity.id)
            .code(entity.code)
            .name(entity.name)
            .description(entity.description)
            .specVersions(new ArrayList<>()) // loaded separately
            .status(entity.status != null ? entity.status : EventTypeStatus.CURRENT)
            .source(entity.source != null ? entity.source : EventTypeSource.UI)
            .clientScoped(entity.clientScoped)
            .application(entity.application)
            .subdomain(entity.subdomain)
            .aggregate(entity.aggregate)
            .createdAt(entity.createdAt)
            .updatedAt(entity.updatedAt)
            .build();
    }

    public static EventTypeEntity toEntity(EventType domain) {
        if (domain == null) {
            return null;
        }

        EventTypeEntity entity = new EventTypeEntity();
        entity.id = domain.id();
        entity.code = domain.code();
        entity.name = domain.name();
        entity.description = domain.description();
        entity.status = domain.status() != null ? domain.status() : EventTypeStatus.CURRENT;
        entity.source = domain.source() != null ? domain.source() : EventTypeSource.UI;
        entity.clientScoped = domain.clientScoped();
        entity.application = domain.application();
        entity.subdomain = domain.subdomain();
        entity.aggregate = domain.aggregate();
        entity.createdAt = domain.createdAt();
        entity.updatedAt = domain.updatedAt();
        return entity;
    }

    public static void updateEntity(EventTypeEntity entity, EventType domain) {
        entity.code = domain.code();
        entity.name = domain.name();
        entity.description = domain.description();
        entity.status = domain.status() != null ? domain.status() : EventTypeStatus.CURRENT;
        entity.source = domain.source() != null ? domain.source() : entity.source;
        entity.updatedAt = domain.updatedAt();
    }

    /**
     * Convert spec version entities to domain objects.
     */
    public static List<SpecVersion> toSpecVersions(List<EventTypeSpecVersionEntity> entities) {
        if (entities == null) {
            return new ArrayList<>();
        }
        return entities.stream()
            .map(e -> new SpecVersion(
                e.version,
                e.mimeType,
                e.schemaContent,
                e.schemaType != null ? SchemaType.valueOf(e.schemaType) : null,
                e.status != null ? SpecVersionStatus.valueOf(e.status) : SpecVersionStatus.FINALISING
            ))
            .toList();
    }
}
