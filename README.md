# rz-goresym: Mandiant GoReSym Bridge for Rizin

A lightweight, self-bootstrapping plugin and CLI bridging [Mandiant's GoReSym](https://github.com/mandiant/GoReSym) metadata and RTTI recovery engine into **Rizin** and **rz-ghidra**.

## Key Capabilities

1. **Zero-Configuration Bootstrapping:** Automatically detects and downloads the official pre-compiled `GoReSym` binary for Linux, macOS, or Windows if not present on the host. No Go compiler toolchain required.
2. **Symbol and Function Recovery:** Recovers all standard library and user functions from Go binaries (even when stripped), assigning sanitized symbol flags (`sym.go.*`) and function definitions.
3. **ABI & Calling Convention Assignment:** Automatically tags recovered Go functions with `golang` (Go 1.17+ register ABI) or `golang_abi0` (stack-based ABI), enabling clean decompilation in `rz-ghidra`.
4. **RTTI Type Parsing:** Parses Go structs, fields, and interfaces directly into Rizin's `td` format strings and SDB database.
5. **Source File Mapping:** Attaches source file paths and line numbers as Rizin comments (`CC`).

## Installation

```bash
git clone https://github.com/doomedraven/rz-goresym.git
cd rz-goresym
./install.sh
```

Or copy `rz_goresym.py` directly to `~/.local/bin/rz-goresym`.

## Usage

### 1. Interactive Analysis with Rizin
Analyze the binary and launch Rizin with all recovered symbols, types, and ABIs pre-applied:
```bash
rz-goresym -i /path/to/target.bin
```

### 2. Export to Rizin Script (.rz)
```bash
rz-goresym -o symbols.rz /path/to/target.bin
rizin -i symbols.rz /path/to/target.bin
```

### 3. Piping Directly inside Rizin
From within a Rizin session:
```text
[0x00000000]> #!pipe rz-goresym /path/to/target.bin
```

### 4. Ensure/Pre-download Binary
```bash
rz-goresym --download
```

## License
MIT License.
