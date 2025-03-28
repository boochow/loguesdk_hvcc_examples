# hvcc logue SDK v1 Examples

This repository contains Pure Data patches written for [hvcc_loguesdk_v1](https://github.com/boochow/hvcc_loguesdk_v1).

## How to Use

If you want to try the pre-built samples, download the binaries from the Releases page.

If you want to modify the patches yourself, follow these steps:

1. **Install Prerequisites:**  
   Install hvcc, logue SDK, and [hvcc_loguesdk_v1](https://github.com/boochow/hvcc_loguesdk_v1).

2. **Clone the Repository:**  
   Copy this repository to your local machine:
   ```bash
   git clone https://github.com/boochow/loguesdk_hvcc_examples
   cd loguesdk_hvcc_examples
   ```

3. **Edit the Makefile:**  
   Open the Makefile and modify the following line to match the path where your logue SDK is located:
   ```
   PLATFORMDIR ?= $(HOME)/logue-sdk/platform
   ```

4. **Build the Patches:**  
   To build all patches, run:
   ```bash
   make
   ```

5. **Build Specific Patches (Optional):**  
   The Pure Data patches are located in the `pd/` directory. You can build a specific patch by specifying its name. For example:
   ```bash
   make Pluck
   ```

## Patch Descriptions

- **Sinx4.pd**  
  An additive oscillator that creates a waveform by layering multiple sine waves.

- **WvFldr.pd**  
  A wavefolder oscillator for sine waves.

- **ChipTune.pd**  
  An oscillator that allows you to choose between a sawtooth, square, or triangle wave. Due to its naive implementation, artifacts may occur.

- **BlChipTune.pd**  
  A band-limited sawtooth and square wave oscillator implemented using [heavylib](https://github.com/Wasted-Audio/heavylib).

- **KickDrum.pd**  
  A kick drum sound generated using a sine wave.

- **osc-white.pd**  
  A sample that generates noise. The `[noise~]` object in Pure Data is too large for use with the logue SDK, so this sample provides an alternative method.

- **Pluck.pd**  
- **Pluck-64.pd**  
  Simplified versions of a Karplus-Strong oscillator. Note that `Pluck-64.pd` is designed exclusively for the NTS-1 and will not work on the Prologue or Minilogue XD.
