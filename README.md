# Tau Demo Runner

Tau Demo Runner is a Windows application designed to execute and manage demo scripts using the Tau language. It provides a user-friendly interface with various controls to run, pause, stop, and navigate through demo scripts.

## Features

### Demo Execution Controls
- **Run**: Start executing the selected demo script
- **Next**: Execute the next step in the demo script manually
- **Back**: Go back one step in the demo script
- **Auto**: Automatically execute demo steps with configurable delay
- **Pause**: Pause auto-execution of the demo script
- **Stop**: Stop execution and reset position
- **Restart**: Restart the Tau process while maintaining script position

### Command Processing
- Command history with up/down arrow navigation
- Direct command execution through command panel
- Quick access buttons for common commands (help, history, definitions, version)
- Microsecond precision execution time tracking

### Key Bindings 
Enter     - Execute command
Up/Down   - Navigate history
F5        - Run demo
F6        - Pause execution
F7        - Stop execution
F8        - Auto-execute
F9        - Skip command
F10       - Next step
Ctrl+L    - Clear output
Ctrl+R    - Restart process
Alt+C     - Toggle comments

### Advanced Syntax Highlighting
- Real-time syntax highlighting for Tau commands and output
- Full ANSI color code support
- Custom highlighting for:
  - Commands
  - Keywords
  - Operators
  - Numbers
  - Strings
  - Functions
  - References
  - Comments
  - Time expressions
  - Definitions

### Theme System
- **Built-in Themes**:
  - Default (Light/Dark variants)
  - Tokyo Night (Light/Dark variants)
- Theme features:
  - Proper light/dark variant support
  - System theme detection on first launch
  - XML-based theme configuration
  - Theme groups with variant management
  - Custom toolbar and status bar styling

### Interface Customization
- Adjustable font size (8-24pt)
- Window size and position memory
- Configurable auto-execution delay
- Toggle comment visibility
- Customizable status bar with:
  - File information
  - Progress tracking
  - Execution timing
  - Process status

### File Management
- Open and select demo files (*.tau)
- Configure Tau executable path
- Persistent settings storage

## Getting Started

1. Launch Tau Demo Runner
2. Configure Tau executable path if not detected automatically (Configure button)
3. Open a demo script file using the Open button (*.tau)
4. Use the toolbar controls to:
   - Execute demo steps (Run, Next, Back)
   - Control auto-execution (Auto, Pause, Stop)
   - Adjust interface (Theme, Font Size, Comments)
5. Enter commands directly in the command panel
6. Monitor progress and timing in the status bar

## Configuration

### Settings Storage
- `settings.xml`: User preferences (window size, location, theme, etc.)
- `themes.xml`: Custom theme definitions

### Tau Language Help Storage
- 'help.xml'

### Theme Customization
Themes can be customized by editing `themes.xml`, supporting:
- Background and text colors
- Syntax element colors
- Light/dark variants
- Theme grouping
