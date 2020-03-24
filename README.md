# Recognize-Crystallographic-Systems-from-TEM-Data
This project is aimed to help with developing a growth procedure to grow carbon nanotubes from a non-traditional crystal catalyst which will, among other applications, enable significantly stronger carbon fiber enforced composites.

Steps:
- Download both the scripts. 
- Make sure to replace the previous GeometricSimulation2.m with the file of the same name in this repo. 
- Add DiffZoneAxes.m to the file path. 

DiffZoneAxes:
- Generates all possible combinations of various zone axes possible with [0 0.5 1]
- Allows the user to build a lattice structure. Cif files seem to lack a uniform structure which makes it harder to scrape.
- The user may choose to save the lattice structure built.
- The user may opt to load pre-existing lattice structures. This allows the user to reuse lattice structures built in previous runs.

Change made to GeometricSimulation2:
- Added code to display the simulation results with the particular zone axis used as the title. 
