module Cloudat
  module Resource
    class BeerResource < Cloudat::Resource::BaseResource
      include Cloudat::Configurable

      # http://www.ascii-art.de/ascii/ab/beer.txt
      def action_drink
        brand = identifier.length > 22 ? "#{string[0...22]}..." : identifier
        brand = ('%-22.22s' % brand).gsub(' ', '.')
        art = <<-eos

                              .sssssssss.
                        .sssssssssssssssssss
                      sssssssssssssssssssssssss
                     ssssssssssssssssssssssssssss
                      @@sssssssssssssssssssssss@ss
                      |s@@@@sssssssssssssss@@@@s|s
               _______|sssss@@@@@sssss@@@@@sssss|s
             /         sssssssss@sssss@sssssssss|s
            /  .------+.ssssssss@sssss@ssssssss.|
           /  /       |...sssssss@sss@sssssss...|
          |  |        |.......sss@sss@ssss......|
          |  |        |..........s@ss@sss.......|
          |  |        |...........@ss@..........|
           \\  \\       |............ss@..........|
            \\  '------+...........ss@...........|
             \\________ .........................|
                      |..#{brand}.|
                     /...........................\\
                    |.............................|
                       |.......................|
                           |...............|

eos
        logger.info(art)
      end

      Resource.register(self)
    end
  end
end
