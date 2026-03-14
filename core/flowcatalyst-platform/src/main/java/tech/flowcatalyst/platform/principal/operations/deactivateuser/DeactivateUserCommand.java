package tech.flowcatalyst.platform.principal.operations.deactivateuser;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to deactivate a user.
 *
 * @param userId User's ID
 * @param reason Optional reason for deactivation
 */
public record DeactivateUserCommand(
    String userId,
    String reason
) implements Command {}
