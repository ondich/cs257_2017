#!/usr/bin/env python3
'''
    csv_to_tables.py
    Jeff Ondich, 24 April 2017

    Sample code illustrating a simple conversion of the
    books & authors dataset represented as in books.csv,
    into the books, authors, and books_authors tables (in
    CSV form).

    This is trickier than my json_to_tables.py example,
    because in the books.csv file, the authors are implicit
    in the list of books rather than being separated out
    into their own data structure as they are in the
    books_and_authors.json file.
'''
import sys
import json
import csv

def load_books_from_csv_file(csv_file_name):
    csv_file = open(csv_file_name)
    reader = csv.reader(csv_file)
    books = []
    for row in reader:
        assert len(row) == 3
        book = {'title': row[0], 'publication_year': int(row[1]), 'authors': row[2]}
        books.append(book)
    csv_file.close()
    return books

def save_books_table_as_csv(books, csv_file_name):
    ''' Note that books.csv has no ids for books or authors,
        so we have to generate them ourselves.
    '''
    output_file = open(csv_file_name, 'w')
    writer = csv.writer(output_file)
    book_id = 1
    for book in books:
        book_row = [book_id, book['title'], book['publication_year']]
        writer.writerow(book_row)
        book_id += 1
    output_file.close()

def save_authors_table_as_csv(books, csv_file_name):
    ''' Exercise for the reader '''
    pass

def save_linking_table_as_csv(books, csv_file_name):
    ''' Exercise for the reader. '''
    pass

if __name__ == '__main__':
    books = load_books_from_csv_file('books.csv')
    save_books_table_as_csv(books, 'books_table.csv')
    save_authors_table_as_csv(books, 'authors_table.csv')
    save_linking_table_as_csv(books, 'books_authors_table.csv')

