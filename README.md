# bone_management

- Bone and Coordinate Management

This script is designed to interact with the character model (ped) in the context of a police simulation. It allows for the management of bone-related information for characters, displays coordinates, and traces lines based on weapon impacts.

## Features

- Retrieve bone indices from various character models.
- Display bone coordinates in 3D.
- Trace lines between specific points on the character.
- Use weapon impacts to determine coordinates and bone indices.

## Commands

The script exposes several commands that you can use in-game:

- **`enableMode_boneCheck`**: Activates the bone checking mode. This allows you to see lines drawn between the bones of the character.
- **`enableMode_boneCheck-Precision`**: Activates the bone checking mode with precision. This modifies how bone indices are handled.

## Examples of Functionality

When bone checking mode is activated, the script will trace lines between specified bones and display their coordinates. This can be useful for debugging or simulation scenarios.

## Notes

- Ensure that the required character models are pre-loaded in the game.
- The script is designed to function in a development environment and may require adjustments for production deployment.

## Authors

- maybe-eeea

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
