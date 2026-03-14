package tech.flowcatalyst.platform.principal.operations.deleteuser;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete a user.
 *
 * @param userId User's ID
 */
public record DeleteUserCommand(
    String userId
) implements Command {}
