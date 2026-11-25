# Umfazo Plant Designer

**Umfazo Holdings Pvt Ltd — Customer Driven Engineering**

A browser-based 3D concept-layout and preliminary process-screening workspace for mine and mineral-processing plant arrangements.

## Live workspace

https://umfazo-plant-designer-studio.vercel.app

## Current capabilities

- Three.js 3D workspace with orbit, pan, zoom, top view, fit-to-layout and shadowed rendering
- Plant equipment library for crushing, milling, screening, classification, CIL/CIP tanks, thickeners, carbon screens, elution, pumps, blowers, boilers, conveyors, headgear, shafts, hoists, steelwork, buildings, utilities and mine services
- Place, move, rotate, resize and edit equipment; edit tags, dimensions, elevations, motor nameplate kW, duties and notes
- Conceptual process connections between equipment
- Starter CIL, CIP, full gold plant and mine/shaft arrangements
- Procedural terrain, hills, rock outcrops, vegetation and access roads; terrain relief can be adjusted
- Illustrative ore-dump profiles and adjustable feed tonnage, grade, recovery, operating schedule, availability, slurry solids, solids SG, leach residence time, tank reference volume, Bond work index, feed/product size, water and reagent allowances
- Indicative gold mass balance, stockpile life, slurry flow, preliminary leach volume, reference tank count and simplified Bond grinding-energy estimate
- 10 / 25 / 50 / 100 t/h scenario comparison
- Browser-local project save, JSON project export, equipment CSV export and process-simulation CSV export
- Supplied Umfazo Holdings identity

## Important limitations

This is a concept design and screening application, not a construction-ready engineering package or a validated process simulator.

- Terrain is procedurally generated, not surveyed. Import of survey contours, DEM/DTM, drone surfaces or point clouds is not currently implemented.
- Pipe connections are visual concept links; pipe sizing, hydraulic grade lines, pressure losses, pump curves and network balancing are not implemented.
- Process calculations are simplified screening estimates. Recovery is user-entered; no ore-specific kinetic, leach, adsorption, elution, electrowinning or smelting model is implied.
- The Bond energy estimate depends on user-entered BWI and size assumptions and is not a mill guarantee or equipment selection.
- Tank volume estimates use simplified geometric working-volume allowances. No mechanical, structural, foundation, seismic, wind, fatigue or nozzle design is implied.
- Equipment models are illustrative 3D representations, not manufacturer models or fabrication drawings.
- Projects are stored in the current browser only. Multi-user accounts, cloud project storage, permissions, audit trails and collaboration are not yet implemented.

All commercial proposals and engineering deliverables must be checked against representative metallurgical testwork, verified site survey data, vendor data and calculations signed off by appropriately qualified professionals.

## Technology

Standalone HTML application hosted on Vercel, using Three.js and OrbitControls from jsDelivr. The current deployment is static; no server-side database or authentication is configured.
