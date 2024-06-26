#include "mex.h"
#include "matrix.h"
#include "math.h"
#include "stdlib.h"

/*
 *  Copyright (C) 2009 Cesare Magri
 *
 *  License
 *  -------
 *  This code is distributed free under the condition that
 *  1. it shall not be incorporated in software that is subsequently sold
 *  2. the authorship of the software shall be acknowledged in any
 *     pubblication that uses results generated by the software
 *  3. this note shall remain in place in each source file
 */

void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
    /* Input:                                                            */
    double *R;
    double *Nt;
    
    /* Dimensions of R:                                                  */
    mwSize Nc, maxNt, Ns;
    
    /* Indexes:                                                          */
    mwIndex c, s;
    mwIndex i, j;
    mwIndex currentIndx;
    mwIndex randomIndx;
    
    /* Output:                                                           */
    double *Rsh;
    
    /*
     * --------------------------------------------------------------------
     * The routine is based on the following simple algorithm for permuting
     * an array (i.e., any ordering of the array is equally probable or any
     * element has equal chance of being in any position):
     *
     *      For i=1 to n-1:
     *      - Let j=r(i+1)
     *      - Swap a[i] and a[j]
     *
     * where r[n] is a rand number generated between 0 and n-1.
     * --------------------------------------------------------------------
     */
    
    /* Reading input:                                                      */
    R  = mxGetPr(prhs[0]);
    Nt = mxGetPr(prhs[1]);
    
    /* Reading dimensions of R:                                            */
    Nc    = mxGetDimensions(prhs[0])[0];
    maxNt = mxGetDimensions(prhs[0])[1];
    Ns    = mxGetDimensions(prhs[0])[2];
    
    /* Allocating output:                                                  */
    plhs[0] = mxCreateNumericArray(3, mxGetDimensions(prhs[0]), mxDOUBLE_CLASS, 0);
    Rsh = mxGetPr(plhs[0]);
    
    for(s=0;s<Ns;s++)
    {      
        /* For i = 1 to Nt[s]-1                                            */
        for(i=0;i<Nt[s];i++)
        {
            /* Generating random number between 0 and i                */
            j = rand() % (i+1);

            for(c=0;c<Nc;c++)
            {
                currentIndx = c + i*Nc + s*Nc*maxNt;
                randomIndx  = c + j*Nc + s*Nc*maxNt;

                Rsh[currentIndx] = Rsh[randomIndx];
                Rsh[randomIndx]  = R[currentIndx];
            }
        }
    }
}