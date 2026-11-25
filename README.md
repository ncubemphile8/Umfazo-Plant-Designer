# Umfazo Plant Designer

**Umfazo Holdings Pvt Ltd — Customer Driven Engineering**

A browser-based 3D concept-layout and preliminary process-screening workspace for mine and mineral-processing plant arrangements.

## Live workspace

https://umfazo-plant-designer-studio.vercel.app

## Current capabilities

- Three.js 3D workspace with orbit, pan, zoom, top view, fit-to-layout, shadowed rendering and a toggle between detailed 3D equipment and schematic wireframe appearance
- Plant equipment library for crushing, milling, screening, classification, distinct CIL leach/adsorption tanks, CIP leach tanks and CIP adsorption tanks, thickeners, carbon screens, elution, pumps, blowers, boilers, conveyors, headgear, shafts, hoists, steelwork, buildings, utilities and mine services
- Place, move, rotate, resize and edit equipment; edit tags, dimensions, elevations, motor nameplate kW, duties and notes
- Conceptual process connections between equipment
- Starter CIL, CIP, full gold plant and mine/shaft arrangements
- Procedural terrain, hills, rock outcrops, vegetation and access roads; import surveyed XYZ CSV points (X,Y,Z in metres) to interpolate a site surface, with adjustable terrain relief
- Illustrative ore-dump profiles and adjustable feed tonnage, grade, recovery, operating schedule, availability, slurry solids, solids SG, leach residence time, tank reference volume, Bond work index, feed/product size, water and reagent allowances
- Indicative gold mass balance, stockpile life, slurry flow, preliminary leach volume, reference tank count and simplified Bond grinding-energy estimate
- 10 / 25 / 50 / 100 t/h scenario comparison
- Browser-local project save/restore, editable JSON project export/import, vector SVG layout export, equipment CSV export, process-simulation CSV export and engineering screening CSV report
- Engineering screening workspace: Darcy–Weisbach pipe friction and minor losses, preliminary pump TDH/power/NPSH margin, equipment connected-load and transformer allowance, idealised simply-supported beam stress/deflection, concept foundation concrete allowance, first-order leach kinetic curve fitting, and user-rate-based preliminary cost plan
- Supplied Umfazo Holdings identity

## Important limitations

This is a concept design and screening application, not a construction-ready engineering package or a validated process simulator.

- Terrain is procedurally generated, not surveyed. Survey import currently accepts XYZ CSV point data and interpolates a concept surface; direct DEM/DTM raster, LAS/LAZ point-cloud and contour-file import is not implemented.
- Pipe connections remain conceptual. The Engineering tab calculates a single user-defined pipe duty using water properties and Darcy–Weisbach assumptions; it does not solve a multi-branch hydraulic network, pump curve intersection, slurry rheology, NPSH system curve, transient surge or vendor selection.
- Process calculations are simplified screening estimates. The optional first-order leach curve is a fit-to-test-data calculator; it does not predict ore-specific leach, adsorption, elution, electrowinning or smelting performance.
- The Bond energy estimate depends on user-entered BWI and size assumptions and is not a mill guarantee or equipment selection.
- Tank volume estimates use simplified geometric working-volume allowances. The beam and foundation tools are idealised preliminary screening only; no code-compliant member capacity, connections, tank mechanical, reinforcement, bearing, settlement, seismic, wind, fatigue or nozzle design is implied.
- Equipment models are illustrative 3D representations, not manufacturer models or fabrication drawings.
- Projects are stored in the current browser only. JSON import/export and SVG layout export support manual hand-off. Multi-user accounts, cloud project storage, permissions, audit trails and collaboration require a dedicated active Supabase project; the RLS schema and activation checklist are prepared in `supabase/migrations/` and `CLOUD_SETUP.md`, but cloud services are not yet connected.

All commercial proposals and engineering deliverables must be checked against representative metallurgical testwork, verified site survey data, vendor data and calculations signed off by appropriately qualified professionals.

## Technology

Standalone HTML application hosted on Vercel, using Three.js and OrbitControls from jsDelivr. The current deployment is static; no server-side database or authentication is configured. The cloud migration is prepared but must only be applied to a newly selected, active Umfazo Supabase project.
