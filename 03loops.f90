PROGRAM loops
  USE omp_lib
  IMPLICIT NONE

  INTEGER,PARAMETER :: n=1002
  INTEGER :: i,num_loops=0

  !$omp parallel default(none) reduction(+:num_loops)
  !$omp do
  DO i=1,n
     num_loops = num_loops + 1
  ENDDO
  !$omp end do
  PRINT*,'thread-id ',omp_get_thread_num(),' : number of loops : ',num_loops
  !$omp end parallel
  PRINT*,'---------------------'
  PRINT*,'total number of loops',num_loops

END PROGRAM loops
