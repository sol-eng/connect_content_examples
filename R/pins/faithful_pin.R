# Establish connection to Connect server
board <- pins::board_rsconnect(server = "<NAME>")

# Create small data set
my_data <- faithful #for example

# Write data to server
pins::pin_write(board,
                my_data,
                name = "faithful_data")
