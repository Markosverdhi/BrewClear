import tkinter as tk 

def on_go():
    zip_code = zip_entry.get()  # Get ZIP code from text entry
    # Do something with the ZIP code (e.g., save it or use it in a function)
    result_label.config(text="wooder")  # Update label to display "wooder"

# Set up the GUI window
root = tk.Tk()
root.title("ZIP Code GUI")

# Create and place a text entry for ZIP code
zip_entry = tk.Entry(root, width=10)
zip_entry.grid(row=0, column=0, padx=10, pady=10)

# Create and place the "Go" button
go_button = tk.Button(root, text="Go", command=on_go)
go_button.grid(row=0, column=1, padx=5, pady=10)

# Result display label
result_label = tk.Label(root, text="")  # Blank label to update later
result_label.grid(row=1, column=0, columnspan=2, pady=10)

# Run the GUI
root.mainloop()