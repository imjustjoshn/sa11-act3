def parse_invoices(invoice_data)
    pattern = /(\d{4}-\d{2}-\d{2}) - (\w+) - (.+?) - \$(\d+)/
    invoice_data.each_line do |line|
        match = line.match(pattern)
        if match
        date, invoice_number, client_name, amount = match.captures
        puts "Date: #{date}, Invoice Number: #{invoice_number}, Client: #{client_name}, Amount: $#{amount}"
        else
        puts "Invalid invoice entry: #{line}"
        end
    end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)