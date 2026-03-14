package tech.flowcatalyst.platform.principal.operations.updateuser;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to update a user.
 *
 * @param userId   User's ID
 * @param name     User's display name (null to keep existing)
 * @param clientId Home client ID (null to keep existing, empty string to clear)
 */
public record UpdateUserCommand(
    String userId,
    String name,
    String clientId
) implements Command {}
