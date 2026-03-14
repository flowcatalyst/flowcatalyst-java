package tech.flowcatalyst.serviceaccount.operations.assignroles;

import java.util.List;
import tech.flowcatalyst.platform.common.Command;

/**
 * Command to assign roles to a service account.
 * This is a declarative assignment - the provided list replaces all existing roles.
 *
 * @param serviceAccountId The service account ID
 * @param roleNames        The complete list of role names to assign
 */
public record AssignRolesCommand(
    String serviceAccountId,
    List<String> roleNames
) implements Command {}
