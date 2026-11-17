using {cuid, managed} from '@sap/cds/common';

namespace Bookstore.db;

entity Books : cuid, managed {
    Title    : String;
    Author   : Association to Author;
    Chapters : Composition of many Chapters
                   on Chapters.book = $self;
}

entity Author : cuid, managed {
    Name  : String;
    books : Association to many Books
                on books.Author = $self;
}


entity Chapters : cuid, managed {
        number : Integer;
    key book   : Association to Books;
}
