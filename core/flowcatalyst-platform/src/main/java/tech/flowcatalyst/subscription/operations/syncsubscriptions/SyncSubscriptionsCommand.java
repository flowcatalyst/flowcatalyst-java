package tech.flowcatalyst.subscription.operations.syncsubscriptions;

import tech.flowcatalyst.dispatch.DispatchMode;
import tech.flowcatalyst.subscription.ConfigEntry;

import java.util.List;
import tech.flowcatalyst.platform.common.Command;

/**
 * Command to bulk sync subscriptions from an external application (SDK).
 *
 * @param applicationCode   The application code (used to scope subscriptions)
 * @param subscriptions     List of subscription definitions to sync
 * @param removeUnlisted    If true, removes API-sourced subscriptions not in the list
 */
public record SyncSubscriptionsCommand(
    String applicationCode,
    List<SyncSubscriptionItem> subscriptions,
    boolean removeUnlisted
) implements Command {
    /**
     * Individual subscription item in a sync operation.
     */
    public record SyncSubscriptionItem(
        String code,
        String name,
        String description,
        Boolean clientScoped,
        List<EventTypeBindingItem> eventTypes,
        String connectionId,
        String queue,
        List<ConfigEntry> customConfig,
        Integer maxAgeSeconds,
        String dispatchPoolCode,
        Integer delaySeconds,
        Integer sequence,
        DispatchMode mode,
        Integer timeoutSeconds,
        Integer maxRetries,
        Boolean dataOnly
    ) {}

    /**
     * Event type binding for sync (uses codes instead of IDs).
     */
    public record EventTypeBindingItem(
        String eventTypeCode,
        String specVersion
    ) {}
}
