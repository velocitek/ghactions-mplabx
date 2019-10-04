# Build with MPLABX Github Actions

This action will build a MPLAB X project.

It runs on Linux Ubuntu 18.04 and uses:

- MPLAB 5.25
- xc16 v1.41
- Peripheral libraries for PIC24/ds24 v2.0

## Inputs

### `project`

**Required** The path to the projec to build (relative to the repository). For example: 'firmware.X'.

### `configuration`

The configuration of the project to build. Defaults to `default`.

## Outputs

None.

## Example usage

uses: velocitek/ghactions-mplabx
with:
project: firmware.X
