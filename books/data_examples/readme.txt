Converting data for the "books and authors" database
CS257 Software Design, Spring 2016
Jeff Ondich

After you go get your dataset from wherever you get it, you'll need
to convert it into whatever table structure you have devised for your
PostgreSQL database.

To get you started, this directory has some quick hints as to how
you might proceed. These hints assume my books & authors database,
which is simple, but complex enough to apply to much of what you're
likely to encounter for this project.

0. First, make sure you have your table design ready. Here's mine.

    CREATE TABLE authors (
        id integer NOT NULL,
        last_name text,
        first_name text,
        birth_year integer,
        death_year integer
    );


    CREATE TABLE books (
        id integer NOT NULL,
        title text,
        publication_year integer
    );

    CREATE TABLE books_authors (
        book_id integer,
        author_id integer
    );


1. Suppose you got your data in JSON form. (See books.json)

(a) Use the standard Python json module and json.loads(...) to
turn your JSON string into a corresponding JSON object.
(b) Traverse that object and use the Python csv module to write
appropriate data to books_table.csv, authors_table.csv, and
books_authors_table.csv.
(c) In psql, use \copy or COPY to load the *_table.csv files
into their corresponding PostgreSQL tables.

See json_to_tables.py for an example of that approach.


2. Suppose you got your data in CSV form (books.csv).

Do something similar to #1 above. Note that I've included
another difference (besides JSON vs. CSV) in my examples. In the
books.csv file, there's just a single row for each book, and
the author data is implicit in the book rows' author columns.
So building the authors table is more complicated for the CSV
example.

How would you build the authors table out of data like this?

    All Clear,2010,Connie Willis (1945-0)
    And Then There Were None,1939,Agatha Christie (1890-1976)
    To Say Nothing of the Dog,1997,Connie Willis (1945-0)
    ...

You could start with something like this:

    author_id = 1
    authors = {}
    for book_row in books:
        authors_text = book_row[2]
        if authors_text not in authors:
            authors[authors_text] = author_id
            author_id += 1

This will produce a dictionary like this:

    authors = {'Connie Willis (1945-0)': 1, 'Agatha Christie (1890-1976)': 2, ...}

That's great. But how do you actually tease apart the names,
birth years, and death years? What I want is something like this:

    authors = {'Connie Willis (1945-0)': [1, 'Willis', 'Connie', 1945, 0],
               'Agatha Christie (1890-1976)': [2, 'Christie', 'Agatha', 1890, 1976],
                ...
              }

And how do you deal with this?

    Good Omens,1990,Neil Gaiman (1960-0) and Terry Pratchett (1948-2015)

Those are exercises for the reader...but I'm also happy to help.
Personally, I would use a combination of the split function and the re.search
function. But the details can be tricky.

