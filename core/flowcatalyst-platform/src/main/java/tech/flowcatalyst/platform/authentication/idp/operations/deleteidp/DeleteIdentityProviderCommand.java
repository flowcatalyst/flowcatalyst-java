package tech.flowcatalyst.platform.authentication.idp.operations.deleteidp;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete an Identity Provider.
 *
 * @param identityProviderId ID of the identity provider to delete
 */
public record DeleteIdentityProviderCommand(
    String identityProviderId
) implements Command {}
