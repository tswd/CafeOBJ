exec ((((x :: na) ((pid :: 2) (np :: 3))) (send ( pid , 0 ) ;)) (((recv ( x , 0 ) ;) (if (pid = 0) { (((int x ;) (int i ;)) ((i := 1 ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) }))) })) end)) | ((((x :: na) ((pid :: 1) (np :: 3))) (recv ( x , 0 ) ;)) ((if (pid = 0) { (((int x ;) (int i ;)) ((i := 1 ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) }))) }) end)) | ((((x :: 1) ((i :: 1) ((pid :: 0) (np :: 3)))) (send ( x , (np - i) ) ;)) (((i := (i + 1) ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) })) end)) .

eof
**
((((x :: na) ((pid :: 2) (np :: 3))) (send ( pid , 0 ) ;)) (((recv ( x , 0 ) ;) (if (pid = 0) { (((int x ;) (int i ;)) ((i := 1 ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) }))) })) end)) | ((((x :: na) ((pid :: 1) (np :: 3))) (recv ( x , 0 ) ;)) ((if (pid = 0) { (((int x ;) (int i ;)) ((i := 1 ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) }))) }) end)) | ((((x :: 1) ((i :: 1) ((pid :: 0) (np :: 3)))) (send ( x , (np - i) ) ;)) (((i := (i + 1) ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) })) end))

((((x :: na) ((pid :: 2) (np :: 3))) (send ( pid , 0 ) ;)) (((recv ( x , 0 ) ;) (if (pid = 0) { (((int x ;) (int i ;)) ((i := 1 ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) }))) })) end)) | ((((x :: na) ((pid :: 1) (np :: 3))) (recv ( x , 0 ) ;)) ((if (pid = 0) { (((int x ;) (int i ;)) ((i := 1 ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) }))) }) end)) | ((((x :: 1) ((i :: 1) ((pid :: 0) (np :: 3)))) (send ( x , (np - i) ) ;)) (((i := (i + 1) ;) (while (np > i) { ((recv ( x , any ) ;) ((send ( x , (np - i) ) ;) (i := (i + 1) ;))) })) end))

