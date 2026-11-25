# Umfazo Plant Designer — cloud setup gate

The production app currently runs as a static Vercel site. The connected Vercel project has no environment variables configured, and the only Supabase project visible to this connection is an inactive project named `cwgh-management`; it is not safe to repurpose it for Umfazo.

## Prepared schema
Apply `supabase/migrations/20261125000100_plant_designer_cloud.sql` only after a dedicated Supabase project is selected and active. It creates:
- User-owned plant projects with JSON design payloads
- Project membership with editor/viewer roles
- Append-only project revisions
- Append-only audit events
- RLS policies and narrowly scoped private authorization helpers

## Required activation steps
1. Select the Supabase organization for the dedicated Umfazo project.
2. Review the quoted recurring project cost before provisioning.
3. Create and activate the dedicated database.
4. Apply the migration and run Supabase security/performance advisors.
5. Add the Supabase project URL and publishable key to Vercel Production, Preview and Development environment scopes.
6. Integrate Supabase Auth and cloud save/load/invite flows in the app, then test with separate owner, editor and viewer accounts.

Do not put a service-role key in the browser or a `NEXT_PUBLIC_` variable. The browser must use only the publishable key and authenticated user sessions. Cloud collaboration is not live until these steps are completed and tested.

## Engineering safety boundary
The new Engineering tab contains transparent screening calculators. It does not certify pump selection, electrical design, steel capacity, foundations, geotechnical stability, metallurgical recovery, environmental compliance or construction readiness. Vendor curves, actual site survey, geotechnical investigation, applicable design codes and sign-off by appropriately qualified engineers remain mandatory.
