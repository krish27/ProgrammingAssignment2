R ProgrammingAssignment 2 - Matrix Caching
========================================================

cachematrix.R program simply demostrates the Matrix Caching. Below are instructions for its usage


```r
source("cachematrix.R")
testMatrix <- matrix(1:4, nrow = 2, ncol = 2)
testMatrix
```

```
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
```

```r
testCacheMatrix <- makeCacheMatrix(testMatrix)
# first call, inverse of given matrix is computed and not pulled from cache
cacheSolve(testCacheMatrix)
```

```
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
```

```r
# Again second call, inverse of matrix is pulled from cache
cacheSolve(testCacheMatrix)
```

```
## getting cached data
```

```
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
```



