PROGRAM hello_threads
  USE omp_lib
  IMPLICIT NONE

  INTEGER :: thread_id,threads_num
  PRINT*,'Only one thread'

  !$omp parallel default(none) private(thread_id,threads_num)
  thread_id = omp_get_thread_num()
  threads_num = omp_get_num_threads()
  PRINT*,'hello! my thread id is',thread_id,' out of ',threads_nOOm
  !$omp end parallel

  PRINT*,'back to one thread'
END PROGRAM hello_threads
