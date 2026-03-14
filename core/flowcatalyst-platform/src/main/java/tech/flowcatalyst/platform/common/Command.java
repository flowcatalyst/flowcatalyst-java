package tech.flowcatalyst.platform.common;

/**
 * Marker interface for all command objects.
 *
 * <p>Commands represent intent to perform an operation. Every command record
 * passed to a {@link UseCase} or {@link UnitOfWork} must implement this interface
 * to enforce type safety at API boundaries.
 */
public interface Command {
}
