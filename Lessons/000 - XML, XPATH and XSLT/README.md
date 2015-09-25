# Prerequisites

In this lesson we take a look at the basic concepts associate with the topic.

# XML

- Extensible Markup Language (XML)

## What is a Markup Language?

- Includes markups i.e. syntactic annotations as an integral part of the text
- Examples are XML, LaTeX, HTML etc

XML is a meta/generic markup language i.e. it has no predefined syntactic presentations that a document must abide by (unlike HTML) and is self-describing. Authors can define and create new "tag"s on thir own based on the actual meaning of the underlying data.

## XML Tree View

The most important concept when manipulating XML is that of nodes and trees.

- An XML document is represented by a "tree"
- The individual elements in the tree are the "node"s
- Programs can navigate around the tree and access the nodes using a specific address scheme called XPATH

An XML document can be parsed and converted into a tree structure using an "XML Parser".

XML Parsers are generally of two types:
- SAX
  * Simple API for XML
  * Streamed, event-based processing
  * Memory-efficient
  * The parser itself does not hold the full document in memory so tree traversal using XPATH is hard
- DOM
  * Document Object Model
  * Parses the whole document into memory at once
  * Works well with XPATHs

Discussion on differences [here](http://stackoverflow.com/questions/6828703/what-is-the-difference-between-sax-and-dom).

# XPATH

XPath is a language for addressing parts of an XML document, designed to be used by XSLT, XPointer, XQuery etc.

The W3C Recommendation can be found [here](http://www.w3.org/TR/xpath/).

Currently XPATH versions 1.0, 2.0 amnd 3.0 exist; but only the former two (especially 1.0) is widely supported.

## Location Paths

- XPATHs are for finding an "address" in a tree
- This is what we call a "location path"
  * Much like a directory path in our computer
  * So, for example, looking at books.xml (in the resources folder), the author of the first book can be accessed with the path /catalog/book/author
  * Of course, as there are multiple book elements under the parent catalog element, we can also add an array index here, like /catalog/book[1]/author
  * This is an *abbreviated format*, the full location path would look something like: /child::catalog/child::book[position()=1]/child::author
  * Each part is called a "location step", so there are three location steps in this location path

## Location Steps

- A location path is comprised of location steps
- Each location step is again made of three parts
  * axis
  * node-test
  * (zero or more) predicates