# Preliminary calculation basis — Umfazo Plant Designer

This note documents the screening calculations in the browser application. Inputs are user assumptions unless stated otherwise.

## Operating tonnage

- Effective operating tonnes per day = nominal feed rate (t/h) × operating hours/day × mechanical availability fraction.
- Monthly tonnes = effective tonnes/day × operating days/month.

## Gold mass balance

- Contained gold (kg/day) = effective ore tonnes/day × head grade (g/t) ÷ 1,000.
- Recovered gold (kg/day) = contained gold × user-entered recovery fraction.
- Tailings gold equivalent (kg/day) = contained gold − recovered gold.
- Simplified tailings grade (g/t) = head grade × (1 − recovery fraction).
- Stockpile contained gold and potential recovered gold are calculated from user-entered dump tonnes, grade and recovery. These are not resource/reserve estimates.

## Slurry flow and preliminary leach volume

For solids mass fraction S and assumed solids specific gravity SG:

- Water-to-solids mass ratio = (1 − S) ÷ S.
- Slurry volume per tonne of dry solids (m³/t) ≈ 1 ÷ SG + water-to-solids mass ratio (assuming water density ≈ 1 t/m³).
- Slurry volumetric flow (m³/h) = nominal dry-solids feed rate × slurry volume per tonne.
- Preliminary required leach working volume (m³) = slurry flow × user-entered residence time (h).

Reference tank count = ceiling(required volume ÷ (user-entered reference tank gross volume × 0.85)). Placed tank volume is approximated from cylindrical dimensions, 76% of shell height and an 85% working allowance.

This is not a tank mechanical design. Actual slurry density, rheology, short-circuiting, oxygen transfer, mixing power, freeboard, internals and operating strategy must be established by process engineering.

## Simplified Bond grinding-energy estimate

E = 10 × Wi × (1/√P80 − 1/√F80)

where Wi is the entered Bond work index and F80/P80 are entered in microns. Estimated mill motor duty is specific energy × nominal feed rate ÷ entered mill efficiency fraction.

This simplified estimate is only a screening indicator. It omits circuit efficiency factors, classification, recirculating load, drive losses, motor service factor, throughput constraints and vendor selection.

## Water and reagent allowances

- Make-up water allowance = effective ore tonnes/day × entered water intensity (m³/t).
- Reagent allowance = effective ore tonnes/day × entered reagent intensity (kg/t).

These are user-defined allowances, not reagent consumption predictions or a complete process-water balance.

## Not modelled

The current release does not calculate pump curves, pipe diameters, friction/minor losses, NPSH, pressure ratings, structural loads, foundation design, geotechnical stability, electrical load flow, process control, safety integrity, cyanide detox performance, environmental discharge, or construction quantities. Those require separate, validated engineering work.

## Added engineering screening calculators

### Pipe friction and pump duty
The Engineering tab uses Darcy–Weisbach:
- Pipe area = πD²/4.
- Mean velocity = volumetric flow / area.
- Reynolds number = velocity × diameter / kinematic viscosity (water assumption, approximately 1.004 × 10⁻⁶ m²/s).
- Friction factor = laminar 64/Re or Swamee–Jain turbulent approximation.
- Major loss = f × (L/D) × velocity²/(2g).
- Minor loss = ΣK × velocity²/(2g).
- Total dynamic head = static head + major loss + minor loss.
- Hydraulic power = ρgQH; estimated shaft and motor input divide by entered efficiencies.
- NPSH margin = entered available NPSH − vendor-required NPSH.

The current calculator assumes water density and viscosity, one straight pipe, one flow rate and user-entered aggregate K. It is not a network solver or pump selection.

### Electrical demand
Connected kW is the sum of entered equipment nameplate ratings. Demand kW applies the entered diversity factor. Preliminary transformer kVA applies the entered power factor and design margin. Starting current, voltage drop, fault level, protection and harmonics are excluded.

### Beam screening
For a simply supported beam with uniform load:
- Maximum moment = wL²/8.
- Maximum shear = wL/2.
- Elastic bending stress = M/Z.
- Midspan deflection = 5wL⁴/(384EI).

The user supplies section properties and material yield strength. No code resistance factors, stability, buckling, connections, load combinations or fatigue checks are included.

### Foundation allowance
The tool reports a concept pad plan area and concrete volume using equipment footprint plus a nominal perimeter allowance and user-entered thickness. It does not calculate actual foundation loads or verify bearing, settlement, punching shear, sliding, overturning, reinforcement or geotechnical suitability.

### First-order leach kinetic curve
For a user-fitted rate constant k and ultimate recovery R∞:
- R(t) = R∞ × (1 − exp(−kt)).

Use only to fit representative bottle-roll or pilot data. It is not a metallurgical prediction.

### Preliminary cost plan
Steel mass, steel rate, concrete rate and installation allowance are user inputs. No live vendor prices, freight, tax, equipment purchase price, commissioning or contingency are included.
