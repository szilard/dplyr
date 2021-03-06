\name{query}
\alias{Query-class}
\alias{query}
\title{Create a mutable query object.}
\usage{
  query(con, sql, .vars)
}
\arguments{
  \item{con}{a \code{DBOConnection}}

  \item{sql}{a string containing an sql query.}
}
\description{
  A query object is mutable wrapper around a
  \code{DBIResult} that caches expensive operations, and
  insulates the rest of dplyr from the vagaries of DBI and
  the individual database implementation.
}
\examples{
l <- lahman_sqlite()
q <- query(l$con, "SELECT * FROM Batting WHERE YearID > 2000 AND TeamID = 'HOU'")
q$vars()
q$nrows()

q$fetch(1)
all <- q$fetch(-1)

q$show_sql()
q$explain_sql()

# Use q$run() to run a query without retrieving results
}
\keyword{internal}

