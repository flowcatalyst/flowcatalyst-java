package tech.flowcatalyst.serviceaccount.operations.deleteserviceaccount;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete a service account.
 *
 * @param serviceAccountId The service account ID to delete
 */
public record DeleteServiceAccountCommand(
    String serviceAccountId
) implements Command {}
