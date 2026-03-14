package tech.flowcatalyst.subscription.operations.deletesubscription;

import tech.flowcatalyst.platform.common.Command;

/**
 * Command to delete an existing subscription.
 *
 * @param subscriptionId The subscription ID to delete
 */
public record DeleteSubscriptionCommand(
    String subscriptionId
) implements Command {}
