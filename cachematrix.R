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
## ~ supplied matrix is always square and invertible

## Create a matrix object env that can cache values
makeCacheMatrix <- function(x = matrix()) {
    # Initialize a placeholder for an inverted matrix
    mInv <- NULL
    
    # Assign x & mInv in the enclosed env (env for makeCacheMatrix)
    set <- function(y) {
        x <<- y
        mInv <<- NULL
    }
    
    # Return the cached value of matrix x
    get_x <- function() x
    
    # Assign mInv in the enclosed env (env for makeCacheMatrix)
    setSolve <- function(solve) mInv <<- solve
    
    # Return the cached value of mInv
    getSolve <- function() mInv
    
    # Store these functions as list names: access with makeCacheMatrix$name
    list(set = set, get_x = get_x, setSolve = setSolve, getSolve = getSolve)
}

## Compute the inverse of a matrix object OR retrieve result if no chg
cacheSolve <- function(x, ...) {
    # Retrieve existing value for matrix solution
    m <- x$getSolve()
    
    # If matrix solution exists, retrieve
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    
    # Otherwise, calculate the inverse for the given matrix
    data <- x$get_x()
    m <- solve(data, ...)
    
    # Assign the solution for the given matrix
    x$setSolve(m)
    m   
}
