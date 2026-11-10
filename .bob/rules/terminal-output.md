# Terminal output width

Output is shown in a terminal viewport strictly 149 columns wide. Content wider than this is clipped.
Hard limit for rendered tables and diagrams: 100 columns total (leaves a 49-character buffer).

## Tables (Hard Constraints)

- Target width: Maximum 100 total characters per row including borders and padding.
- Column limit: Maximum 2 or 3 columns. Never use 4+ columns.
- Cell content limit: Maximum 3 to 5 words (under 20 characters) per cell.
- No full sentences in cells: Use only short labels, keywords, identifiers, or numbers.
- Detailed explanations: Always place descriptions in bullet points beneath the table.
- If content cannot fit within 100 columns, do NOT use a table. Use a bullet list (`**Name**: short description`).

## Mermaid diagrams

Rendered diagrams must fit in 100 columns.

- Flowcharts: use `flowchart TD` (vertical) only. Avoid `LR`.
- Max 2 sibling nodes on the same rank. Split large graphs into several small diagrams.
- Node labels: max ~15 characters per line. Break longer labels with `<br/>`.
- Sequence diagrams: max 3 participants. Use short aliases (`participant API as API`).
  Message text max ~20 characters.
- Class / ER diagrams: max 2 entities across. Few attributes per entity. Skip trivial ones.
- Prefer several small diagrams over one wide diagram.
- If a diagram still cannot fit 100 columns, output it as a raw ```mermaid code block instead.

## Prose

- Wrap prose and list items at ~90 characters.
- Avoid single lines longer than 100 characters outside code blocks.
