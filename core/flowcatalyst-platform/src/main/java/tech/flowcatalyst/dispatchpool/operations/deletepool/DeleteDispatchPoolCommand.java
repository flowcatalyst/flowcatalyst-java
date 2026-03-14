package tech.flowcatalyst.dispatchpool.operations.deletepool;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete (archive) an existing dispatch pool.
 *
 * @param poolId The pool ID to delete
 */
public record DeleteDispatchPoolCommand(
    String poolId
) implements Command {}
