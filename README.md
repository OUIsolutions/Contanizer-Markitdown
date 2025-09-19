# Contanizer Markitdown

A containerized version of Microsoft's [markitdown](https://github.com/microsoft/markitdown) tool that converts various file formats (PDF, Word, PowerPoint, etc.) to Markdown format using Docker or Podman containers.

## Features

- 🚀 **Easy containerized deployment** - No complex Python environment setup required
- 📄 **Multiple format support** - Convert PDF, DOCX, PPTX, and more to Markdown
- 🐳 **Container-based** - Uses Docker or Podman for isolated execution
- 🛠️ **Simple CLI** - Straightforward command-line interface

## Prerequisites

Before installing Contanizer Markitdown, you'll need one of the following container runtimes:

- **Docker** ([Install Docker](https://docs.docker.com/get-docker/))
- **Podman** ([Install Podman](https://podman.io/getting-started/installation))

## Installation

### Step 1: Install VibeScript

VibeScript is required to run Contanizer Markitdown. Choose the installation method for your operating system:

#### For Linux Users (Recommended)

**Option A: Pre-compiled Binary**
```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.36.0/vibescript.out -o vibescript.out
chmod +x vibescript.out
sudo mv vibescript.out /usr/local/bin/vibescript
```

**Option B: Compile from Source**
```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.36.0/amalgamation.c -o vibescript.c
gcc vibescript.c -o vibescript.out
sudo mv vibescript.out /usr/local/bin/vibescript
```

#### For macOS Users

```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.36.0/amalgamation.c -o vibescript.c
gcc vibescript.c -o vibescript.out
sudo mv vibescript.out /usr/local/bin/vibescript
```

> **Note:** Make sure you have GCC installed. You can install it via Xcode Command Line Tools: `xcode-select --install`

### Step 2: Install Contanizer Markitdown

Once VibeScript is installed, add the markitdown script:

```bash
vibescript add_script --file https://github.com/OUIsolutions/Contanizer-Markitdown/releases/download/0.1.0/markitdown.lua markitdown
```

### Step 3: Configure Container Provider

Choose your preferred container runtime:

**For Docker users:**
```bash
markitdown set_provider docker
```

**For Podman users:**
```bash
markitdown set_provider podman
```

## Usage

### Basic Usage

Convert any supported file to Markdown:

```bash
markitdown your-file.pdf > output.md
```

### Examples

**Convert a PDF document:**
```bash
markitdown document.pdf > document.md
```

**Convert a Word document:**
```bash
markitdown presentation.docx > presentation.md
```

**Convert a PowerPoint presentation:**
```bash
markitdown slides.pptx > slides.md
```

## Supported File Formats

Contanizer Markitdown supports the same file formats as the original markitdown tool, including:

- PDF (`.pdf`)
- Microsoft Word (`.docx`, `.doc`)
- Microsoft PowerPoint (`.pptx`, `.ppt`)
- Microsoft Excel (`.xlsx`, `.xls`)
- Images with OCR support
- And more...

## Troubleshooting

### Common Issues

1. **"Provider not set" error**: Make sure you've configured your container provider using `markitdown set_provider <docker|podman>`

2. **Permission denied**: Ensure Docker/Podman is running and your user has the necessary permissions

3. **Command not found**: Verify that VibeScript is properly installed and in your PATH

### Getting Help

If you encounter issues, please check the [Issues](https://github.com/OUIsolutions/Contanizer-Markitdown/issues) page or create a new issue with details about your problem.

## Contributing

We welcome contributions! Please feel free to submit a Pull Request.

## License

This project is licensed under the same terms as the original markitdown project. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Based on Microsoft's [markitdown](https://github.com/microsoft/markitdown) project
- Built with [VibeScript](https://github.com/OUIsolutions/VibeScript)
