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
   
}


## Compute the inverse of a matrix object OR retrieve result if no chg

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
