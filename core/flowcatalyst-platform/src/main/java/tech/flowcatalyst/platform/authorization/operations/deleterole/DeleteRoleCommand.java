package tech.flowcatalyst.platform.authorization.operations.deleterole;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete a Role.
 *
 * @param roleName Full role name (e.g., "tms:admin")
 */
public record DeleteRoleCommand(String roleName) implements Command {}
