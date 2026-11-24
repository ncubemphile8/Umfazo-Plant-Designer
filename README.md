# Umfazo Plant Designer

**Umfazo Holdings Pvt Ltd — Customer Driven Engineering**

A browser-based 3D concept layout workspace for mineral-processing plant planning.

## Live workspace

https://umfazo-plant-designer-ncubemphile8-6831.vercel.app

## Initial capabilities

- Interactive Three.js 3D workspace with orbit, zoom, top view and fit-to-layout controls
- Equipment library covering crushing, milling, classification, CIL/CIP leaching and recovery, pumps, blowers, conveyors, ore bins, platforms, access structures and control rooms
- Place, move, rotate and resize equipment; edit elevations, equipment tags, motor kW, duties and notes
- Connect equipment with visible pipe routes
- Example CIL, CIP and full gold-plant layouts
- Editable ore profiles (oxide, transitional and sulphide) and an illustrative feed-grade / recovery mass-balance panel
- Browser-local project save, JSON project export and CSV equipment schedule export
- Umfazo Holdings identity and supplied company logo

## Technical notes

The first live release is a standalone static deployment on Vercel using Three.js from jsDelivr. The production deployment is currently deployed independently of this repository; repository-based continuous deployment and source synchronisation are the next integration step.

## Engineering boundary

This is a preliminary concept-layout and commercial visualisation tool. The example ore grades, recoveries, process routes and equipment dimensions are illustrative inputs only. They are not verified process guarantees or construction drawings. Metallurgical testwork and competent engineering verification are required for process selection, hydraulic and mechanical sizing, structural design, foundations, electrical design, safety systems, environmental controls and construction.
