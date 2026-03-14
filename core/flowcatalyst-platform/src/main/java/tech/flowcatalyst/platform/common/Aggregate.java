package tech.flowcatalyst.platform.common;

/**
 * Marker interface for aggregate root entities.
 *
 * <p>Aggregates are the primary entities persisted through {@link UnitOfWork}.
 * Every entity class passed to {@code UnitOfWork.commit()} must implement this
 * interface to enforce type safety at the persistence boundary.
 */
public interface Aggregate {
}
