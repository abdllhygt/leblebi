require "colorize"

puts "Leblebi 0.1".colorize(:green)

anaKod = ""
while true
    print "leb".colorize(:yellow), ">>".colorize(:green)
    kod = gets
    if kod == "CLEAR"
        File.delete "gecici.cr"
        File.write "ana.cr", " "
        puts "Deleted cookie"
        next
    end
    anaKod = File.read "ana.cr"
    File.write "gecici.cr", "#{anaKod}\n#{kod}"
    b = system "crystal gecici.cr"
    if b == true
        puts "Ok!".colorize(:blue).mode(:underline)
        if !"#{kod}".includes?("puts")
            anaKod = File.read "ana.cr"
            File.write "ana.cr", "#{anaKod}\n#{kod}"
        end
    else
        puts "Error!".colorize(:red).mode(:underline)
    end
end
