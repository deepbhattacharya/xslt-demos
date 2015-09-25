# Prerequisites

In this lesson we take a look at the basic concepts associated with the topic.

# XML

- Extensible Markup Language (XML)

## What is a Markup Language?

- Includes markups i.e. syntactic annotations as an integral part of the text
- Examples are XML, LaTeX, HTML etc

XML is a meta/generic markup language i.e. it has no predefined syntactic presentations that a document must abide by (unlike HTML) and is self-describing. Authors can define and create new "tag"s on thir own based on the actual meaning of the underlying data.

## XML Tree View

- most important concept when manipulating XML is that of nodes and trees.

- An XML document is represented by a "tree"
- - individual elements in the tree are the "node"s
- Programs can navigate around the tree and access the nodes using a specific address scheme called XPATH

An XML document can be parsed and converted into a tree structure using an "XML Parser".

XML Parsers are generally of two types:
- SAX
  * Simple API for XML
  * Streamed, event-based processing
  * Memory-efficient
  * - parser itself does not hold the full document in memory so tree traversal using XPATH is hard
- DOM
  * Document Object Model
  * Parses the whole document into memory at once
  * Works well with XPATHs

Discussion on differences [here](http://stackoverflow.com/questions/6828703/what-is-the-difference-between-sax-and-dom).

# XPATH

XPath is a language for addressing parts of an XML document, designed to be used by XSLT, XPointer, XQuery etc.

- W3C Recommendation can be found [here](http://www.w3.org/TR/xpath/).

Currently XPATH versions 1.0, 2.0 and 3.0 exist; but only the first two (especially 1.0) are widely supported.

## Location Paths

- XPATHs are for finding an "address" in a tree
- This is what we call a "location path"
  * Much like a directory path in our computer
  * So, for example, looking at [books.xml](../resources/books.xml), the author of the first book can be accessed with the path /catalog/book/author
  * Of course, as there are multiple book elements under the parent catalog element, we can also add an array index here, like /catalog/book[1]/author
  * This is an *abbreviated format*, the full location path would look something like: /child::catalog/child::book[position()=1]/child::author
  * Each part is called a "location step", so there are three location steps in this location path

## Location Steps

- A location path is comprised of location steps
- Each location step is again made of three parts
  * axis
    + defines the relationship to be followed in the tree
    + e.g. select the child node or an attribute
  * node test
    + defines what kind of nodes are required
    + can also specify the name or (schema-defined) type of the nodes
  * (zero or more) predicates
    + provide the ability to filter the nodes according to arbitrary selection criteria

### Axis

- ancestor axis holds the ancestors of the context node
- ancestor-or-self axis holds the context node and the ancestors of the context node
- attribute axis holds the attributes of the context node, attribute:: can be replaced with the shorthand *@*
- child axis holds the children of the context node, *this is the default axis* so child:: can be omitted from an XPATH expression
- descendant axis holds the descendants of the context node
- descendant-or-self axis contains the context node and the descendants of the context node
- following axis holds all nodes in the same document as the context node that come after the context node
- following-sibling axis holds all the following siblings of the context node. A sibling is a node on the same level as the context node
- namespace axis holds the namespace nodes of the context node (deprecated in XPATH 2.0)
- parent axis holds the parent of the context node
- preceding axis contains all nodes that come before the context node
- preceding-sibling axis contains all the preceding siblings of the context node
- self axis contains the context node itself

### Node Tests

When we use an axis in a location step, we're telling XPath where to look for a set of nodes. A node test tells XPath which of the nodes in that set we're interested in.

- the * wildcard character matches any element or attribute name
- a name matches a node with that name (for example, book will match a <book> element)
- the comment() node test selects comment nodes
- the node() node test selects any type of node
- the processing-instruction() node test selects a processing instruction node
- the text() node test selects a text node

### Predicates

Predicates offer a way to select only some nodes out of the node set based on some condition that the user defines.

- if the predicate evaluates to TRUE then the node is selected, otherwise not
- we can test boolean conditions based on element and attribute values, e.g. /catalog/book[book/price > 5]
- we can also test if an element has an attribute or not (the predicate just has the attribute e.g. /catalog/book[@id])

An inetersting link on complex predicates [here](http://stackoverflow.com/questions/568713/xpath-expression-with-multiple-predicates).

# XSLT

Initial XSLT Tutorial [here](http://www.cs.ox.ac.uk/dan.olteanu/tutorials/xslt1.pdf).

