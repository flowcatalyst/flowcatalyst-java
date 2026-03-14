package tech.flowcatalyst.platform.cors.operations.deleteorigin;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete a CORS allowed origin.
 *
 * @param originId The ID of the CORS entry to delete
 */
public record DeleteCorsOriginCommand(
    String originId
) implements Command {}
