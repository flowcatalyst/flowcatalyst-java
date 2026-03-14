package tech.flowcatalyst.platform.authentication.domain.operations.deletemapping;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete an Email Domain Mapping.
 *
 * @param emailDomainMappingId ID of the mapping to delete
 */
public record DeleteEmailDomainMappingCommand(
    String emailDomainMappingId
) implements Command {}
