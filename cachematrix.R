## These functions essentially build a caching facility
## for inverse matrix computation
## This fuction creates a matrix caching structure based on a closure

## The first function, makeCacheMatrix creates and returns really a list 
## containing a function to
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of the inverse of matrix object
## 4.get the value of the inverse of matrix object

## Usage: Enter these commands in R commandline to test this program
## source("cachematrix.R")
## testMatrix <- matrix(1:4, nrow = 2, ncol = 2)
## testCacheMatrix <- makeCacheMatrix(testMatrix)
## cacheSolve(testCacheMatrix)
## cacheSolve(testCacheMatrix)

makeCacheMatrix <- function(m = matrix()) {  
  
  # matrixInverse stores the inverse matrix   
  matrixInverse <- NULL    
  
  ## validate whether the formal arguement is actually a matrix
  if(!class(m) == "matrix"){
    message("pass a valid matrix as input formal arguments to makeCacheMatrix() functiong") 
    return()
  }
  
  ## setMatrix() function is used to set the value of matrix object m
  setMatrix <- function(n) {  
    ## <<- operator is used here to assign value to global variable from inside the function
    m <<- n    
    matrixInverse <<- NULL    
  }
  ## getMatrix() function returns matrix object m
  getMatrix <- function() m    
  
  ## set the value of inverse of matrix object "setInverseOfMatrix"
  setInverseOfMatrix <- function(inverseOfMatrix) matrixInverse <<- inverseOfMatrix
  
  ## get the value of inverse of matrix object "getInverseOfMatrix"
  getInverseOfMatrix <- function() matrixInverse   
  
  ## return a list of all matrix objects
  list(setMatrix = setMatrix, 
       getMatrix = getMatrix,         
       setInverseOfMatrix = setInverseOfMatrix,         
       getInverseOfMatrix = getInverseOfMatrix)
}
## This function actually takes a matrix caching object as an argument
## and returns the inverse of the underlying matrix
cacheSolve <- function(p, ...) {        
  ## Return a matrix that is the inverse of 'x'      
  matrixInverse <- p$getInverseOfMatrix()    
  
  if(!is.null(matrixInverse)) {  
    ## validate whether value of matrixInverse is in cache
    if(!identical(p$getMatrix, matrixInverse)){
      message("getting cached data")       
      return(matrixInverse)      
    }else
    {
      message("data is not in cahce") 
    }
  } 
  ## get the actuall matrix to compute inverse
  data <- p$getMatrix()
  
  ## Solve() function is used to compute the inverse of matrix
  computeMatrixInverse <- solve(data, ...) 
  matrixInverse <-   computeMatrixInverse
  ## set the value of computed matrix inverse
  p$setInverseOfMatrix(matrixInverse)   
  
  ## print the computed value of matrix inverse
  matrixInverse
}