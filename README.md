# DownUnder - Markdown PDF Creation
DownUnder creates PDF documents from one or more with (multi) markdown formatted
text files.

The command line interface is implemented using Ruby and [Thor](https://github.com/wycats/thor).
Your markdown formatted text is parsed using [RedCarpet](https://github.com/vmg/redcarpet).
The programmers of you will love the automatic syntax higlightning provided by [CodeRay](https://github.com/rubychan/coderay).

[wkhtmltopdf](https://github.com/antialize/wkhtmltopdf) does the the PDF processing finally.

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

Run `downunder --help` for more detailed options.

## Customize PDF Output
DownUnder uses a set of default templates for PDF creation. As soon as 
DownUnder finds a `.downunder` aside your markdown files, it automatically 
tries reading the templates from there.

Following template files are supported:

* `style.css` - CSS stylesheet for document rendering
* `cover.html` - The cover page
* `header.html` - Page headers
* `footer.html` - Page footers

As you may already guess it's not difficult to modify the templates using your HTML
and CSS skills

### Boilerplate
When customizing templates, you don't have to start from a plain page. Run
the `downunder init` command to create a `.downunder` directory with a set of default
templates.

## Inspiration
DownUnder is heavily influenced by [Gimli](https://github.com/walle/gimli). My intentaion
was to simplify the command line interface and creation of templates.