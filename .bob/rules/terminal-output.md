# Terminal output width

Output is shown in a terminal. Anything wider than the terminal gets cropped.
Hard limit for rendered tables and diagrams: 120 columns total, including borders and padding.

## Tables

- Max total width: 150 characters.
- Max 4 columns. Prefer 3.
- Cell text: short phrases, max ~30 characters. No full sentences in cells.
- Put detail in text below the table, not inside cells.
- If content cannot fit, do NOT use a table. Use a bullet list (`**Name**: short description`)
  or a heading per item.

## Mermaid diagrams

Rendered diagrams must also fit in 120 columns.

- Flowcharts: use `flowchart TD` (vertical) by default. Avoid `LR` unless 3 nodes or fewer in a row.
- Max 3 sibling nodes on the same rank. Split large graphs into several small diagrams.
- Node labels: max ~20 characters per line. Break longer labels with `<br/>`.
- Sequence diagrams: max 4 participants. Use short aliases (`participant API as API`).
  Message text max ~25 characters.
- Class / ER diagrams: max 3 entities across. Few attributes per entity. Skip trivial ones.
- Prefer several small diagrams over one wide diagram.
- If a diagram still cannot fit 120 columns, output it as a raw ```mermaid code block instead.

## Prose

- Wrap prose and list items at ~100 characters.
- Avoid single lines longer than 120 characters outside code blocks.
