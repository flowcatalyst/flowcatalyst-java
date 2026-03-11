-- =============================================================================
-- V42: Rename tables to match TypeScript schema naming conventions
-- =============================================================================
-- The TypeScript platform uses domain-prefixed table names:
--   iam_*   = Identity & Access Management
--   tnt_*   = Tenancy
--   oauth_* = OAuth / OIDC
--   msg_*   = Messaging
--   app_*   = Applications & Platform Config
--   aud_*   = Audit
--
-- This migration is idempotent: if tables already have the new names
-- (e.g. database was created by the TypeScript app), renames are skipped.
-- =============================================================================

-- Helper: rename table only if old name exists and new name does not
-- PostgreSQL doesn't support IF EXISTS on ALTER TABLE ... RENAME TO,
-- so we use DO blocks.

-- =============================================================================
-- IAM tables
-- =============================================================================

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'principals' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_principals' AND table_schema = 'public')
  THEN
    ALTER TABLE principals RENAME TO iam_principals;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'principal_roles' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_principal_roles' AND table_schema = 'public')
  THEN
    ALTER TABLE principal_roles RENAME TO iam_principal_roles;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'principal_application_access' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_principal_application_access' AND table_schema = 'public')
  THEN
    ALTER TABLE principal_application_access RENAME TO iam_principal_application_access;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'auth_roles' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_roles' AND table_schema = 'public')
  THEN
    ALTER TABLE auth_roles RENAME TO iam_roles;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'auth_permissions' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_permissions' AND table_schema = 'public')
  THEN
    ALTER TABLE auth_permissions RENAME TO iam_permissions;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'role_permissions' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_role_permissions' AND table_schema = 'public')
  THEN
    ALTER TABLE role_permissions RENAME TO iam_role_permissions;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'client_access_grants' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_client_access_grants' AND table_schema = 'public')
  THEN
    ALTER TABLE client_access_grants RENAME TO iam_client_access_grants;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'service_accounts' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_service_accounts' AND table_schema = 'public')
  THEN
    ALTER TABLE service_accounts RENAME TO iam_service_accounts;
  END IF;
END $$;

-- =============================================================================
-- TNT (Tenancy) tables
-- =============================================================================

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'clients' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tnt_clients' AND table_schema = 'public')
  THEN
    ALTER TABLE clients RENAME TO tnt_clients;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'cors_allowed_origins' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tnt_cors_allowed_origins' AND table_schema = 'public')
  THEN
    ALTER TABLE cors_allowed_origins RENAME TO tnt_cors_allowed_origins;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'email_domain_mappings' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tnt_email_domain_mappings' AND table_schema = 'public')
  THEN
    ALTER TABLE email_domain_mappings RENAME TO tnt_email_domain_mappings;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'email_domain_mapping_additional_clients' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tnt_email_domain_mapping_additional_clients' AND table_schema = 'public')
  THEN
    ALTER TABLE email_domain_mapping_additional_clients RENAME TO tnt_email_domain_mapping_additional_clients;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'email_domain_mapping_granted_clients' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tnt_email_domain_mapping_granted_clients' AND table_schema = 'public')
  THEN
    ALTER TABLE email_domain_mapping_granted_clients RENAME TO tnt_email_domain_mapping_granted_clients;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'email_domain_mapping_allowed_roles' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'tnt_email_domain_mapping_allowed_roles' AND table_schema = 'public')
  THEN
    ALTER TABLE email_domain_mapping_allowed_roles RENAME TO tnt_email_domain_mapping_allowed_roles;
  END IF;
END $$;

-- =============================================================================
-- OAuth tables
-- =============================================================================

-- oauth_clients stays the same name

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'oidc_login_states' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'oauth_oidc_login_states' AND table_schema = 'public')
  THEN
    ALTER TABLE oidc_login_states RENAME TO oauth_oidc_login_states;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'identity_providers' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'oauth_identity_providers' AND table_schema = 'public')
  THEN
    ALTER TABLE identity_providers RENAME TO oauth_identity_providers;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'identity_provider_allowed_domains' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'oauth_identity_provider_allowed_domains' AND table_schema = 'public')
  THEN
    ALTER TABLE identity_provider_allowed_domains RENAME TO oauth_identity_provider_allowed_domains;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'idp_role_mappings' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'oauth_idp_role_mappings' AND table_schema = 'public')
  THEN
    ALTER TABLE idp_role_mappings RENAME TO oauth_idp_role_mappings;
  END IF;
END $$;

-- =============================================================================
-- APP tables
-- =============================================================================

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'applications' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'app_applications' AND table_schema = 'public')
  THEN
    ALTER TABLE applications RENAME TO app_applications;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'application_client_configs' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'app_client_configs' AND table_schema = 'public')
  THEN
    ALTER TABLE application_client_configs RENAME TO app_client_configs;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'platform_configs' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'app_platform_configs' AND table_schema = 'public')
  THEN
    ALTER TABLE platform_configs RENAME TO app_platform_configs;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'platform_config_access' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'app_platform_config_access' AND table_schema = 'public')
  THEN
    ALTER TABLE platform_config_access RENAME TO app_platform_config_access;
  END IF;
END $$;

-- =============================================================================
-- MSG (Messaging) tables
-- =============================================================================

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'event_types' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_event_types' AND table_schema = 'public')
  THEN
    ALTER TABLE event_types RENAME TO msg_event_types;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subscriptions' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_subscriptions' AND table_schema = 'public')
  THEN
    ALTER TABLE subscriptions RENAME TO msg_subscriptions;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subscription_event_types' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_subscription_event_types' AND table_schema = 'public')
  THEN
    ALTER TABLE subscription_event_types RENAME TO msg_subscription_event_types;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subscription_configs' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_subscription_custom_configs' AND table_schema = 'public')
  THEN
    ALTER TABLE subscription_configs RENAME TO msg_subscription_custom_configs;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'dispatch_pools' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_dispatch_pools' AND table_schema = 'public')
  THEN
    ALTER TABLE dispatch_pools RENAME TO msg_dispatch_pools;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'events' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_events' AND table_schema = 'public')
  THEN
    ALTER TABLE events RENAME TO msg_events;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'events_read' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_events_read' AND table_schema = 'public')
  THEN
    ALTER TABLE events_read RENAME TO msg_events_read;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'dispatch_jobs' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_dispatch_jobs' AND table_schema = 'public')
  THEN
    ALTER TABLE dispatch_jobs RENAME TO msg_dispatch_jobs;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'dispatch_jobs_read' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_dispatch_jobs_read' AND table_schema = 'public')
  THEN
    ALTER TABLE dispatch_jobs_read RENAME TO msg_dispatch_jobs_read;
  END IF;
END $$;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'dispatch_job_attempts' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'msg_dispatch_job_attempts' AND table_schema = 'public')
  THEN
    ALTER TABLE dispatch_job_attempts RENAME TO msg_dispatch_job_attempts;
  END IF;
END $$;

-- =============================================================================
-- AUD (Audit) tables
-- =============================================================================

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'audit_logs' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'aud_logs' AND table_schema = 'public')
  THEN
    ALTER TABLE audit_logs RENAME TO aud_logs;
  END IF;
END $$;

-- =============================================================================
-- Rename collection/junction tables that also need prefixes
-- =============================================================================

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'service_account_client_ids' AND table_schema = 'public')
     AND NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'iam_service_account_client_ids' AND table_schema = 'public')
  THEN
    ALTER TABLE service_account_client_ids RENAME TO iam_service_account_client_ids;
  END IF;
END $$;

-- =============================================================================
-- Add missing columns to match TypeScript schema
-- =============================================================================

-- iam_principals: add application_id column
ALTER TABLE iam_principals ADD COLUMN IF NOT EXISTS application_id varchar(17);

-- aud_logs: add application_id and client_id columns
ALTER TABLE aud_logs ADD COLUMN IF NOT EXISTS application_id varchar(17);
ALTER TABLE aud_logs ADD COLUMN IF NOT EXISTS client_id varchar(17);

-- tnt_cors_allowed_origins: add updated_at column
ALTER TABLE tnt_cors_allowed_origins ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone;

-- iam_client_access_grants: add granted_by and updated_at columns
ALTER TABLE iam_client_access_grants ADD COLUMN IF NOT EXISTS granted_by varchar(17);
ALTER TABLE iam_client_access_grants ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone;

-- oauth_idp_role_mappings: add updated_at column
ALTER TABLE oauth_idp_role_mappings ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone;

-- msg_dispatch_jobs: add connection_id column
ALTER TABLE msg_dispatch_jobs ADD COLUMN IF NOT EXISTS connection_id varchar(17);

-- msg_dispatch_jobs_read: add connection_id column
ALTER TABLE msg_dispatch_jobs_read ADD COLUMN IF NOT EXISTS connection_id varchar(17);

-- msg_subscriptions: add connection_id column
ALTER TABLE msg_subscriptions ADD COLUMN IF NOT EXISTS connection_id varchar(17);

-- iam_permissions: add code, subdomain, context, aggregate, action columns
-- (TypeScript uses 'code' instead of 'name' for the unique identifier)
ALTER TABLE iam_permissions ADD COLUMN IF NOT EXISTS code varchar(255);
ALTER TABLE iam_permissions ADD COLUMN IF NOT EXISTS subdomain varchar(50);
ALTER TABLE iam_permissions ADD COLUMN IF NOT EXISTS context varchar(50);
ALTER TABLE iam_permissions ADD COLUMN IF NOT EXISTS aggregate varchar(50);
ALTER TABLE iam_permissions ADD COLUMN IF NOT EXISTS action varchar(50);
ALTER TABLE iam_permissions ADD COLUMN IF NOT EXISTS updated_at timestamp with time zone;

-- Backfill code from name if code is null
UPDATE iam_permissions SET code = name WHERE code IS NULL AND name IS NOT NULL;

-- =============================================================================
-- Create new tables that exist in TypeScript but not in Java
-- =============================================================================

-- msg_connections
CREATE TABLE IF NOT EXISTS msg_connections (
    id varchar(17) PRIMARY KEY,
    code varchar(100),
    name varchar(255),
    description varchar(500),
    endpoint varchar(500),
    external_id varchar(100),
    status varchar(20) DEFAULT 'ACTIVE',
    service_account_id varchar(17),
    client_id varchar(17),
    client_identifier varchar(100),
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now()
);

-- msg_event_type_spec_versions
CREATE TABLE IF NOT EXISTS msg_event_type_spec_versions (
    id varchar(17) PRIMARY KEY,
    event_type_id varchar(17),
    version varchar(20),
    mime_type varchar(100),
    schema_content jsonb,
    schema_type varchar(20),
    status varchar(20) DEFAULT 'FINALISING',
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now()
);

-- tnt_anchor_domains
CREATE TABLE IF NOT EXISTS tnt_anchor_domains (
    id varchar(17) PRIMARY KEY,
    domain varchar(255) UNIQUE,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now()
);

-- tnt_client_auth_configs
CREATE TABLE IF NOT EXISTS tnt_client_auth_configs (
    id varchar(17) PRIMARY KEY,
    email_domain varchar(255) UNIQUE,
    config_type varchar(50),
    primary_client_id varchar(17),
    additional_client_ids jsonb DEFAULT '[]'::jsonb,
    granted_client_ids jsonb DEFAULT '[]'::jsonb,
    auth_provider varchar(50),
    oidc_issuer_url varchar(500),
    oidc_client_id varchar(255),
    oidc_multi_tenant boolean DEFAULT false,
    oidc_issuer_pattern varchar(500),
    oidc_client_secret_ref varchar(1000),
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now()
);

-- iam_login_attempts
CREATE TABLE IF NOT EXISTS iam_login_attempts (
    id varchar(17) PRIMARY KEY,
    attempt_type varchar(20),
    outcome varchar(20),
    failure_reason varchar(100),
    identifier varchar(255),
    principal_id varchar(17),
    ip_address varchar(45),
    user_agent text,
    attempted_at timestamp with time zone
);

-- iam_password_reset_tokens
CREATE TABLE IF NOT EXISTS iam_password_reset_tokens (
    id varchar(17) PRIMARY KEY,
    principal_id varchar(17),
    token_hash varchar(64),
    expires_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL DEFAULT now()
);

-- oauth_oidc_payloads
CREATE TABLE IF NOT EXISTS oauth_oidc_payloads (
    id varchar(128) PRIMARY KEY,
    type varchar(64),
    payload jsonb,
    grant_id varchar(128),
    user_code varchar(128),
    uid varchar(128),
    expires_at timestamp with time zone,
    consumed_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL DEFAULT now()
);

-- msg_dispatch_job_projection_feed
CREATE TABLE IF NOT EXISTS msg_dispatch_job_projection_feed (
    id bigserial PRIMARY KEY,
    dispatch_job_id varchar(13),
    operation varchar(10),
    payload jsonb,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    processed smallint DEFAULT 0,
    processed_at timestamp with time zone,
    error_message text
);

-- msg_event_projection_feed
CREATE TABLE IF NOT EXISTS msg_event_projection_feed (
    id bigserial PRIMARY KEY,
    event_id varchar(13),
    payload jsonb,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    processed smallint DEFAULT 0,
    processed_at timestamp with time zone,
    error_message text
);

-- =============================================================================
-- Create indexes on new tables
-- =============================================================================

CREATE INDEX IF NOT EXISTS idx_msg_connections_client_id ON msg_connections(client_id);
CREATE INDEX IF NOT EXISTS idx_msg_connections_service_account_id ON msg_connections(service_account_id);
CREATE INDEX IF NOT EXISTS idx_msg_event_type_spec_versions_event_type_id ON msg_event_type_spec_versions(event_type_id);
CREATE INDEX IF NOT EXISTS idx_iam_login_attempts_principal_id ON iam_login_attempts(principal_id);
CREATE INDEX IF NOT EXISTS idx_iam_login_attempts_identifier ON iam_login_attempts(identifier);
CREATE INDEX IF NOT EXISTS idx_iam_password_reset_tokens_principal_id ON iam_password_reset_tokens(principal_id);
CREATE INDEX IF NOT EXISTS idx_iam_password_reset_tokens_token_hash ON iam_password_reset_tokens(token_hash);
CREATE INDEX IF NOT EXISTS idx_msg_dispatch_job_pf_processed ON msg_dispatch_job_projection_feed(processed) WHERE processed = 0;
CREATE INDEX IF NOT EXISTS idx_msg_event_pf_processed ON msg_event_projection_feed(processed) WHERE processed = 0;
CREATE INDEX IF NOT EXISTS idx_msg_subscriptions_connection_id ON msg_subscriptions(connection_id);
CREATE INDEX IF NOT EXISTS idx_msg_dispatch_jobs_connection_id ON msg_dispatch_jobs(connection_id);
