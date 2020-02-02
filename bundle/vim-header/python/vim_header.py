import re
import vim

#Function for creating the file header
#Uses the two global vim variables:
# g:VimHeaderNames and g:VimHeaderEmails
def insert_file_header():
    # set row to 0 because we want to start at the top
    row = 0
    
    # Add the relevant information to the buffer at the top of the file
    vim.current.buffer.append("/**********************************************",row)
    vim.current.buffer.append("* File: " + vim.eval("expand('%:t')"), row+1);
    vim.current.buffer.append("* Author: " + vim.eval('g:VimHeaderNames'), row +2);
    vim.current.buffer.append("* Email: "+ vim.eval('g:VimHeaderEmails'), row+3);
    vim.current.buffer.append("*  ", row+4);
    vim.current.buffer.append("**********************************************/", row+5)

    # Set the cursor to the second to last line in the comment and
    # then switch to insert mode. This enables the user to quickly
    # type in the relevant information regarding the purpose of the file
    vim.current.window.cursor = (row+5, len(vim.current.buffer[row+4]))
    vim.command("startinsert")

# Function for adding the function headers
def insert_function_header():
    # get the current location of the cursor
    row, col = vim.current.window.cursor

    # get the relevant function information from the code
    function_info = parse_line(row-1)

    # add the function header with the parsed information
    vim.current.buffer.append(function_info["spacing"] + "/********************************************", row-1);
    vim.current.buffer.append(function_info["spacing"] + "* Function Name  : " + function_info["name"], row   );
    vim.current.buffer.append(function_info["spacing"] + "* Pre-conditions : " + function_info["pre-conditions"], row +1 );
    vim.current.buffer.append(function_info["spacing"] + "* Post-conditions: " + function_info["post-conditions"], row  +2);
    vim.current.buffer.append(function_info["spacing"] + "*  ", row +3 );
    vim.current.buffer.append(function_info["spacing"] + "********************************************/", row +4);

    # Check if name was found, if not then set cursor to Function Name
    # line to input name
    if function_info["name"] == "":
        # Add extra space just because i'm OCD and need everything to be perfect
        vim.current.buffer[row] = vim.current.buffer[row] + " "
        vim.current.window.cursor = (row + 1, len(vim.current.buffer[row])) 
    # If function name was found, then the line parsed successfully
    # so set cursor to line to write function description
    else:
        vim.current.window.cursor = (row + 4, len(vim.current.buffer[row+3]))

    # switch to insert mode
    vim.command("startinsert")

# converts the provided row in the buffer to a string and returns it
# note that the given row should start at 0 to indicate the top of the file
def convert_line_to_string(row):
    line = vim.current.buffer[row]
    return line

# row 0 represents the top of file
# uses a regular expression to parse the given line of code
# returns a dictionary containing the parsed information
def parse_line(row):
    #Create empty function_info dictionary
    function_info={}
    function_info["spacing"] = ""
    function_info["post-conditions"] = ""
    function_info["name"] = ""
    function_info["pre-conditions"] = ""

    # convert the current buffer row to string
    line = convert_line_to_string(row)

    # create the regex pattern to search to the strign
    # TODO: if i feel like it then i could improve this 
    # to account for more cases 
    pattern = "^(\s*)(template\s*<.*>)?\s*(friend)?\s*(\w?[^\(\)]*)(\s+|^)([~\w][^\s\(\)]*)\s*\(\s*([^\(\)]*)\s*\)"

    # use the re module to search the string for the regex
    result = re.search(pattern, line)


    #First, check if result exists. If not, print error message
    #and add generic header
    if result == None:
        print("Error:" + " Unable to determine function name. Format functions like this: postcondition functionname(preconditions)")

        # create a new pattern to determine spacing information
        pattern = "^(\s*)\S"
        result = re.search(pattern, line)
        if result != None: # if there is spacing/tabbing then add it here
            function_info["spacing"] = result.group(1)
        return function_info

    #If result does exist, continue as normal
    function_info["spacing"] = result.group(1)
    function_info["post-conditions"] = result.group(4)
    function_info["name"] = result.group(6)
    function_info["pre-conditions"] = result.group(7)

    # if there is no post-condition then assume the function was a constructor/destructor
    if function_info["post-conditions"] == "":
        #if constructor, add extra space to preserve spacing
        function_info["spacing"] = function_info["spacing"] + result.group(5) 

        # set the post condition to none if it is a constructor or destructor 
        # TODO: Check convention for post-condition of constructors/destructors
        # I think its none, but I should still check.
        function_info["post-conditions"] = "none" 

    # if post-condition is void, then set post-condition to none
    # this probably doesn't really matter but it fits some of the
    # example code so this is what we'll go with now
    if function_info["post-conditions"] == "void":
        function_info["post-conditions"] = "none"

    # If there is no precondition then set it to none 
    if function_info["pre-conditions"] == "":
        function_info["pre-conditions"] = "none"

    return function_info
