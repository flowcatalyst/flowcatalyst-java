package tech.flowcatalyst.platform.application.operations.deactivateapplication;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to deactivate an Application.
 *
 * @param applicationId The ID of the application to deactivate
 */
public record DeactivateApplicationCommand(String applicationId) implements Command {}
