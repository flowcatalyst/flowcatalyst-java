package tech.flowcatalyst.platform.principal.operations.activateuser;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to activate a user.
 *
 * @param userId User's ID
 */
public record ActivateUserCommand(
    String userId
) implements Command {}
