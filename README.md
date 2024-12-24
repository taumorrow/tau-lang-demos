# Tau Demo Runner

A sophisticated Windows application for executing and managing Tau language demonstrations, featuring an advanced theme system, intelligent help integration, and real-time syntax highlighting.

## Core Features

### Execution Controls
- **Run/Play**: Execute demo scripts with configurable automation
- **Step Control**: Next, Back, and Skip functionality for precise navigation
- **Process Management**: Restart and clear capabilities with state preservation
- **Timing Analysis**: Microsecond precision execution tracking
- **Progress Monitoring**: Visual progress tracking with percentage display

### Advanced Interface
- **Modern UI**: Sleek design with custom-rendered controls and smooth animations
- **Visual Feedback**: Status indicator with dynamic state visualization
- **Shadow Effects**: Sophisticated panel rendering with customizable shadows
- **Command Panel**: Integrated command interface with quick access buttons
- **Split Layout**: Efficient space utilization with adjustable panels

### Intelligent Help System
- **Context-Sensitive Help**: Pattern-based code analysis for relevant documentation
- **Interactive Search**: Real-time help content filtering
- **Category Organization**: Structured documentation with intuitive navigation
- **Rich Examples**: Comprehensive code samples with explanations
- **Pattern Recognition**: Smart identification of code structures and concepts

### Professional Syntax Highlighting
- **Real-time Processing**: Immediate syntax analysis and coloring
- **ANSI Support**: Full ANSI color code interpretation
- **Optimized Performance**: Batched processing and caching for large files
- **Smart Detection**: Automatic identification of:
  - Command structures
  - Logical operators
  - Function definitions
  - Temporal expressions
  - Variable references
  - Type annotations

### Extensive Theme System
#### Built-in Collections
- **Professional**: GitHub, Dracula, One Dark/Light
- **Natural**: Forest, Ocean, Arctic
- **Retro**: Synthwave84, Neon City
- **Classic**: Solarized, Gruvbox, Monokai
- **Specialized**: Matrix, Minimal, Cotton Candy

#### Theme Features
- Light/Dark variants with system theme detection
- XML-based configuration for easy customization
- Runtime theme switching with smooth transitions
- Consistent styling across all UI elements
- Color interpolation for visual effects

### Advanced Configuration
- **Window Management**: Size, position, and state persistence
- **Font Control**: Dynamic size adjustment (8-24pt)
- **Execution Settings**: Configurable delays and automation
- **Visual Options**: Comment visibility and display preferences
- **Process Configuration**: Tau executable path management

## Technical Highlights

### Performance Optimization
- Efficient graphics rendering with hardware acceleration
- Smart caching for syntax highlighting and theme colors
- Batch processing for large files
- Thread-safe settings management
- Memory-efficient resource handling

### Robust Architecture
- Pattern-based code analysis
- Thread-safe operations
- Comprehensive error handling
- Resource cleanup management
- Event-driven updates

### Security Considerations
- Safe file handling
- Protected settings storage
- Controlled process management
- Secure resource disposal
- Input validation

## Getting Started

1. **Installation**
   - Download the latest release
   - Extract to desired location
   - Ensure Tau executable is available

2. **Initial Setup**
   ```
   - Launch Tau Demo Runner
   - Configure Tau path if not auto-detected
   - Select preferred theme and font size
   - Open a demo file (*.tau)
   ```

3. **Basic Usage**
   ```
   - Use toolbar controls for execution
   - Enter commands in command panel
   - Monitor status in status bar
   - Access help with context clicks
   ```

## Configuration Files

- **settings.xml**: User preferences and window state
- **themes.xml**: Theme definitions and customization
- **help.xml**: Documentation and examples

## System Requirements

- Windows OS
- Tau executable
- some Tau Language Demo Files
- Display resolution: 1280x720 or higher

## Development

- Built with C#
- Modern UI rendering techniques
- Thread-safe implementation
- Extensive XML configuration
- Modular architecture

## License

MIT - free to use for everyone, but dont forget the credits :)

still a work in progress, with some gdi+ rendering bugs here and there, 
help system also needs improvements and better structured content. 
