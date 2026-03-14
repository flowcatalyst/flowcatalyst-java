package tech.flowcatalyst.platform.application.operations.activateapplication;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to activate an Application.
 *
 * @param applicationId The ID of the application to activate
 */
public record ActivateApplicationCommand(String applicationId) implements Command {}
