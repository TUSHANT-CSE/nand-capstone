# Capstone: Make the Computer Draw a Box
Nand to Tetris – I (ETCNTC301), K.R. Mangalam University
**Tushant Yadav · Roll No. 2501730294 · K = 94**

| Item | Value |
|---|---|
| K mod 3 = 1 | duplicate labels produce an assembler warning |
| K mod 4 = 2 | box width = 16 × 3 = 48 pixels (3 words) |
| Box | starts at row 94, 20 rows tall, rows 94–113, columns 0–47 |
| Address | SCREEN + 32×94 = 19392 |

## Files
- `CPU.hdl`, `Memory.hdl`, `Computer.hdl` – Part A
- `assembler.py` – Part B (two-pass Hack assembler)
- `Box.asm`, `Box.hack` – Part C (`Box.hack` made with `assembler.py`)
- `tests/` – Add/Max/Rect/Pong sources, official .hack references, test scripts and results

## Use
```
python assembler.py Box.asm            # writes Box.hack
python assembler.py Prog.asm Out.hack  # custom output name
```
Load `Box.hack` in the CPU Emulator (animate: no animation), hold any key: a black box appears; release it: it disappears.

## Interactive Dashboard
Run `python -m http.server 8000` from this folder, then open `http://localhost:8000/dashboard.html`.
The dashboard presents Parts A, B and C, includes an editable assembler demo, and visualizes the K = 94 box projection.
