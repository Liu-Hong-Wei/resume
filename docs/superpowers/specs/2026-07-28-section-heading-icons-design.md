# Resume Section Heading Icons

## Scope

Add icons to the four existing resume section headings without changing their wording or the surrounding layout:

- Education / 教育背景
- Work Experience / 工作经历
- Related Projects / 项目经历
- Skills / 专业技能

## Visual Design

Use one semantic Font Awesome icon for each section:

- Education: `building-columns`
- Work Experience: `briefcase`
- Related Projects: `folder-open`
- Skills: `code`

Icons are solid black, have no background or border, and inherit the heading color. Each icon is approximately 80% of the heading text size, sits in a fixed-width box, and has a small gap before the title. The icon and title remain vertically aligned and do not change the existing divider-line treatment.

## Implementation

Add a reusable section-heading helper to `chicv.typ`, then replace the four inline level-two headings in `main.typ` with calls to that helper. The same helper and icon mapping apply to the Chinese, simplified English, and full English outputs.

## Verification

Compile all three PDFs. Confirm that every expected icon renders, section text is unchanged, headings remain aligned with their dividers, page counts do not increase, and no content overlaps or clips.
