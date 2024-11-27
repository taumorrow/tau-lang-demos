# Tau Demo Runner

Tau Demo Runner is a windows application designed to execute and manage demo scripts using the Tau language. It provides a user-friendly interface with various controls to run, pause, stop, and navigate through demo steps.

## Features

- **Demo Execution Controls**:
  - **Run**: Start executing the selected demo script.
  - **Next**: Execute the next step in the demo script manually.
  - **Back**: Go back one step in the demo script.
  - **Auto**: Automatically execute demo steps with a configurable delay.
  - **Pause**: Pause auto-execution of the demo script.
  - **Stop**: Stop execution and reset the position in the demo script.

- **Individual Command Processing**: Execute custom commands directly within the application using a dedicated command panel. This allows for dynamic interaction with the Tau process during runtime.

- **Execution Time Tracking**: Monitor execution time for each command processed by displaying microsecond precision timing in the status bar.

- **Settings Persistence**: User settings such as window size, location, theme preferences, and more are saved automatically to maintain consistency across sessions.

- **File Management**:
  - Open and select demo files (`*.tau`) for execution.
  - Configure path to Tau executable if not found automatically.

- **Output Management**:
  - Clear output window content easily.
  - Toggle visibility of comments within demo scripts for cleaner output display.

- **Dark Mode Support**: Easily toggle between light and dark themes for better visual comfort during different times of the day.

- **Customizable Themes**: Choose from predefined color themes such as Default, Solarized, and Monokai to personalize your experience.

- **Font Size Adjustment**: Adjust the font size within the application to enhance readability according to your preference.

## Getting Started

1. Launch the Tau Demo Runner application.

2. Use the "Open" button to select a demo script file (`*.tau`).

3. Control execution using buttons like "Run", "Next", "Back", "Auto", "Pause", and "Stop".

4. Adjust settings such as theme, font size, and execution delay via toolbar options.

5. View output in the text area and execute additional commands using the command panel at the bottom.

6. Configure Tau executable path if not found automatically via "Configure" button.

## Configuration

The application saves user settings in an XML file (`settings.xml`) located in the application's directory. These settings include window size, location, theme preferences, etc
