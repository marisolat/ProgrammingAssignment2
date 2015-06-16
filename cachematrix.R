## Author: marisolat
##
## Functions:
## ~ makeCacheMatrix: This function creates a special "matrix" object that can
##                  cache its inverse.
## ~ cacheSolve: This function computes the inverse of the special "matrix" 
##                  returned by `makeCacheMatrix` above. If the inverse has 
##                  already been calculated (and the matrix has not changed), 
##                  then `cacheSolve` will retrieve the inverse from the cache.
##
## Assumptions:
## ~ supplied matrix is always invertible

## Create a matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get_x <- function() x
    setSolve <- function(solve) m <<- solve
    getSolve <- function() m
    list(set = set, get_x = get_x, setSolve = setSolve, getSolve = getSolve)
}

## Compute the inverse of a matrix object OR retrieve result if no chg
cacheSolve <- function(x, ...) {
    m <- x$getSolve()
    if(!is.null(m)){
    # If matrix solution exists, retrieve
        message("getting cached data")
        return(m)
    }
    # Otherwise, calculate that inverse
    data <- x$get_x()
    m <- solve(data, ...)
    x$setSolve(m)
    m    
}
