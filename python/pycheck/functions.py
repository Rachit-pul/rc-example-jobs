
import sys
import csv

def check_py_version():
    print( "Checking python version...\n" )
    print( "Python version:  " + sys.version )
    print( "\n" )


def read_csv():
    print( "Reading file in_pycheck.csv..." )
    letter_data = []
    with open('in_pycheck.csv') as in_file:
        csv_reader = csv.reader(in_file, delimiter=',')
        line_num = 0
        data_line_num = 0
        for row in csv_reader:
            if line_num == 0:
                # first line is just a short description of the data                                                                                                                                                                       
                description = row[0]
                print( "Input data description:  " + str( description ) )
                line_num += 1
            elif line_num == 1:
                # second line contains the column headers                                                                                                                                                                                  
                headers = row
                print( "Headers:  " + str( headers ) )
                line_num += 1
            else:
                # rest of file contains data                                                                                                                                                                                               
                letter_data.append( row )
                line_num += 1
                data_line_num += 1


    print( "File read complete.\n" )
    return letter_data

def check_data( letter_data ):
    dataerror = False
    for i in range( len( letter_data ) ):
        length_actual = int( len( letter_data[i][0] ) )
        length_nl     = int( letter_data[i][1] )
        length_cvsum  = int( letter_data[i][2] ) + int( letter_data[i][3] )

        if ( length_nl != length_actual or length_cvsum != length_actual or length_nl != length_cvsum ):
            dataerror = True
            print( "Discrepancy found in " + str( letter_data[i][0] ) + " entry.")

    if dataerror == False:
        print( "Cursory data check performed, and no issues were found.\n" )
    else:
        print( "ERROR: Issues found with input data.\n" )

