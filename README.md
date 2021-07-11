# BUET Cyber Drill Writeups

This repository contains the manuals on the cyber challenges solved by BUET
undergrads.


## Contribution Guideline


### Forking

Fork this repository to your own Github profile. [Here is a short tutorial][2] on
how to setup and maintain a git fork.


### File Name

Your writeup should be in markdown format with `.md` extension. Separate folders
are dedicated to each category. Place your file in the category it belongs to.
If the problem you're writing about is from a public website, rename your file
so that it contains the website name and challenge number, e.g.,
`picoctf-147.md`. Then prepend the filename with the original date of authoring,
e.g., `2021-07-11-picoctf-147.md`.

**Please follow the yyyy-mm-dd-site-num.md format.** It will help organize the
files. Hopefully we'll have a lot of them coming in.


### File Content

Write your content in standard markdown format. [Here is a starter guideline for
markdown formatting][1].

Start the file with a H1 headline of the problem title. Under that give the
author's, your, information. If there are multiple authors, list them in an
unordered list. Then link the website you found the challenge on and list the
tools you used. You can also place links on the tools if you so want.

```markdown
# Obedient Cat

Author: Enan Ajmain - 1605018.

Or,

Authors:
- Asif Imtial - 1605017
- Enan Ajmain - 1605018

Original link: https://play.picoctf.org/practice/challenge/147

Tools used:
- binwalk
- [stegoveritas](https://github.com/bannsec/stegoVeritas)
```

You can then write your article in however way you wish.

If you need to add image, rename the image to match with your markdown filename,
append it with a numeric counter because you may need multiples image for a
single markdown file (e.g., `2021-07-11-picoctf-147-1.jpg`), and place it in
`assets/images/` folder.


### Commit to History

After finishing your writeup, commit it to your history and push it to your own
upstream fork.

Make sure you only commit only those files you want to. Don't do `git add .`; do
`git add filename.ext`.


### Pull Request

Head over to the [pull-requests][3] section of the original upstream repository
and create a new pull request.


### Full Example

Check [this file][5] for an example of how to write your article.



[1]: https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
[2]: https://stefanbauer.me/articles/how-to-keep-your-git-fork-up-to-date
[3]: https://github.com/3N4N/BUETCyberDrill/pulls
[4]: https://github.com/3N4N
[5]: reverse_engineering/2021-07-11-picoctf-104.md
