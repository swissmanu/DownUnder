# DownUnder - Markdown PDF Creation
DownUnder creates PDF documents from one or more with (Multi) markdown formatted
text files.

The command line interface is implemented in Ruby and uses wkhtmltopdf
for the PDF processing. The markdown formatted text is parsed using RedCarpet.
The programmers of you will love the automatic syntax higlightning provided by CodeRay.

## Installation
You have to build DownUnders Ruby Gem by yourself for the moment. Clone the
repository, build and install the gem with the following commands:

```bash
git clone git://github.com/swissmanu/DownUnder.git
cd DownUnder
gem build downunder.gemspec
gem install downunder-1.0.0.gem
```

## Create PDF from Markdown Files
DownUnder makes the generation of a PDF out of several markdown files easy. Just
switch to a directory which contains your `.md` files and run DownUnder:

```bash
downunder
```

A PDF document with the same name as the directory you are in gets created.

## Customize PDF Output
DownUnder uses a set of default templates for PDF creation. If you are familiar
with HTML and CSS, you can customize these on your own without much effort.

If DownUnder finds a `.downunder` aside your markdown files, it automatically 
tries reading the templates from there. Following template files are supported:

* `style.css` - CSS stylesheet for document rendering
* `cover.html` - The cover page
* `header.html` - Page headers
* `footer.html` - Page footers

When customizing the PDF output, you don't have to start from a blank page. Run
the `downunder init` command to create the `.downunder` with a set of default
templates.