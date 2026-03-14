package tech.flowcatalyst.platform.application.operations.deleteapplication;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete an Application.
 *
 * @param applicationId The ID of the application to delete
 */
public record DeleteApplicationCommand(String applicationId) implements Command {}
