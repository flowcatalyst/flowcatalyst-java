package tech.flowcatalyst.platform.application.operations.provisionserviceaccount;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to provision a service account for an application.
 *
 * @param applicationId The ID of the application to provision a service account for
 */
public record ProvisionServiceAccountCommand(String applicationId) implements Command {}
