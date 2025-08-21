using { pocdevday as my } from '../db/schema';

service AdminService @(path:'/admin') {
  @odata.draft.enabled
  entity Authors as projection on my.Authors;
  @odata.draft.enabled
  entity Books as projection on my.Books;
  entity Genres as projection on my.Genres;

  action testDebug () returns {
    message: String(250)
  }
};

annotate AdminService.Authors with @UI: {
  HeaderInfo: {
    TypeName: 'Author',
    TypeNamePlural: 'Authors',
    Description: 'List of Authors'
  },
  LineItem: [
    { $Type: 'UI.DataField', Value: ID, Label: 'ID' },
    { $Type: 'UI.DataField', Value: name, Label: 'Name' },
    { $Type: 'UI.DataField', Value: dateOfBirth, Label: 'Date of Birth' }
  ],
  Identification: [
    { Value: name, Label: 'Name' }
  ],
  Facets: [
    { $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Details' }
  ],
  FieldGroup#Details: {
    Data: [
      { Value: name, Label: 'Name' },
      { Value: dateOfBirth, Label: 'Date of Birth' },
      { Value: nationality, Label: 'Nationality' }
    ]
  }
};

annotate AdminService.Books with @UI: {
    HeaderInfo: {
        TypeName: 'Book',
        TypeNamePlural: 'Books',
        Description: 'List of Books'
    },
    LineItem: [
        { $Type: 'UI.DataField', Value: ID, Label: 'ID' },
        { $Type: 'UI.DataField', Value: title, Label: 'Title' },
        { $Type: 'UI.DataField', Value: author, Label: 'Author' },
        { $Type: 'UI.DataField', Value: stock, Label: 'Stock' }
    ],
    Identification: [
        {Value: hometeam.name, Label: 'HomeTeam'}
    ],
    Facets:[
        { $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Matches'}
    ],
    FieldGroup#Matches:{
        Data: [
            { Value: title, Label: 'Title' },
            { Value: descr, Label: 'Description' },
            { Value: author, Label: 'Author' },
            { Value: genre, Label: 'Genre' },
            { Value: stock, Label: 'Stock' },
            { Value: price, Label: 'Price' },
            { Value: currency, Label: 'Currency' }
        ]
    }
};