class Movie < ApplicationRecord
  belongs_to :director

  # BASIC PG_SEARCH MODEL SETUP
  searchkick
  include PgSearch

  pg_search_scope :search_by_title_and_syllabus,
    against: [ :title, :syllabus ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


  # ASSOCIATION SCOPE

  pg_search_scope :global_search,
      against: [ :title, :syllabus ],
      associated_against: {
        director: [ :first_name, :last_name ]
      },
      using: {
        tsearch: { prefix: true }
      }


  # MULTISEARCH MODEL SETUP

  multisearchable against: [ :title, :syllabus ]

end
