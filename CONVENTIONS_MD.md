# When writing or creating a markdown document, follow these guidelines

- Most documents must have a document title - a level one heading and should\
  ideally be the same as the file name.
- The title must be followed by a short intro of 1 to 3 lines.
- The rest of the headings must start from level 2.
- Generally omit a TOC from your document and rely on the rendering context to\
  provide one. You may make an exception to this rule in order to provide\
  smaller, inline TOCs which enumerate only the items within a given section of\
  the document, as a means of introducing what comes next.
- Markdown elements in your document should be separated by exactly one blank line.
- Obey projects' character line limit wherever possible. Long URLs and tables\
  are the usual suspects when breaking the rule. (Headings also can't be\
  wrapped, but we encourage keeping them short). Unless instructed otherwise,\
  wrap your text to 120 characters. Often, inserting a newline before a long\
  link preserves readability while minimizing the overflow.
- To create paragraphs, use a single blank line to separate one or more lines\
  of text. Don't indent the first line of a paragraph unless it part of a list.
- Don't use trailing whitespace, use a trailing backslash. Best practice is to\
  avoid the need for a `<br />` altogether.
- Use ATX-style headings. Prefer a single space after # and newlines before\
  and after.
- Headers should be surrounded by blank lines.
- Header levels should only increment by one level at a time.
- Avoid multiple headings with the same content even under sub-headings. Headings and sub-headings must be unique.
- Use double asterisks for bold text. Avoid using double underscores for bold\
  text, as it's harder to distinguish from italics at a glance.
- Use single underscores for italics. Avoid using single asterisks for\
  italicized text.
- Use dashes for bulleted lists.
- Use lazy numbering for long lists.
- Use consistent indentation. When nesting lists, use a 2 space indent for\
  both numbered and bulleted lists.
- For lists with concise items most or all of which fit on one line, do not\
  leave an empty line between list items.
- If many of your list items are longer and wrap onto multiple lines, a blank\
  line between list items improves legibility.
- Use `backticks` for short code quotations and field names.
- Use inline code when referring to file types in an abstract sense, rather \
  than a specific file.
- For code quotations longer than a single line, use a codeblock.
- Explicitly declare the language for long code quotations.
- Use a single backslash at the end of long command line snippets.
- Nest fenced codeblocks within lists. Fenced Codeblocks should be surrounded by blank lines even in lists.
- To create a blockquote, add a > in front of each line of a content block,\
  (including any blank lines).
- Use admonitions to call attention to particular details within the body of a\
  doc, such as a cautionary warning, or a bit of supplemental information that\
  isn’t essential to its primary reading.
- Use simulated admonitions for environments or renderers that don't support admonitions.
- Although you should generally avoid HTML, the `<details>` element enables \
  readers to expand and collapse sections of content on the page. This is useful\
  when content needs to be made available, but needn't be presented in the\
  default view of the page where it could make it needlessly long or distract\
  from the main message.
- Use inline links within your document. Wherever possible, shorten your links.
- Use informative link titles.
- Avoid bare links without any syntax.
- If you're using the text of a link purely informatively and do not want it\
  to function as a link, use backticks to treat it as inline code.
- Always specify alt text for your images to improve accessibility by providing\
  text in the brackets preceding the link.
- Approximate captions by placing italicized text on the line immediately\
  after your image (omit a blank line).
- Avoid horizontal rules when possible.
- When you do decide to use a horizontal rule, always use three dashes (---)\
  on a line by themselves, surrounded by blank lines.
- Any tables in your Markdown should be small.
- Prefer tables with only a few columns.
- Prefer tables with concise data.
- Consider lists for complex content.
- Use reference style links in tables to keep the contents of each cell as\
  short as possible.
- Please prefer standard Markdown syntax wherever possible and avoid HTML\
  hacks.
