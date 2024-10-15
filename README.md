# bone_management

- Bone and Coordinate Management

this script is designed to interact with the character model (ped) in the context of a police simulation. It allows for the management of bone-related information for characters, displays coordinates, and traces lines based on weapon impacts.

## features

- retrieve bone indices from various character models.
- display bone coordinates in 3D.
- trace lines between specific points on the character.
- use weapon impacts to determine coordinates and bone indices.

## commands

the script exposes several commands that you can use in-game:

- **`enableMode_boneCheck`**: Activates the bone checking mode. This allows you to see lines drawn between the bones of the character.
- **`enableMode_boneCheck-Precision`**: Activates the bone checking mode with precision. This modifies how bone indices are handled.

## examples of functionality

when bone checking mode is activated, the script will trace lines between specified bones and display their coordinates. This can be useful for debugging or simulation scenarios.

## notes

- ensure that the required character models are pre-loaded in the game.
- the script is designed to function in a development environment and may require adjustments for production deployment.

## authors

- maybe-eeea

## license

this project is licensed under the MIT License. See the `LICENSE` file for more details.
