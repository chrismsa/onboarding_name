class Home
  def initialize
    puts '
                   ::::    :::       ::::::::         :::   :::       ::::::::::       ::::::::
                  :+:+:   :+:      :+:    :+:       :+:+: :+:+:      :+:             :+:    :+:
                 :+:+:+  +:+      +:+    +:+      +:+ +:+:+ +:+     +:+             +:+        
                +#+ +:+ +#+      +#+    +:+      +#+  +:+  +#+     +#++:++#        +#++:++#++  
               +#+  +#+#+#      +#+    +#+      +#+       +#+     +#+                    +#+   
              #+#   #+#+#      #+#    #+#      #+#       #+#     #+#             #+#    #+#    
             ###    ####       ########       ###       ###     ##########       ########      

                                          :::::::::       ::::::::
                                         :+:    :+:     :+:    :+:
                                        +:+    +:+     +:+    +:+ 
                                       +#+    +:+     +#+    +:+  
                                      +#+    +#+     +#+    +#+   
                                     #+#    #+#     #+#    #+#    
                                    #########       ########      

          :::::::::       :::::::::           :::        ::::::::       :::::::::::       ::: 
         :+:    :+:      :+:    :+:        :+: :+:     :+:    :+:          :+:           :+:  
        +:+    +:+      +:+    +:+       +:+   +:+    +:+                 +:+           +:+   
       +#++:++#+       +#++:++#:       +#++:++#++:   +#++:++#++          +#+           +#+    
      +#+    +#+      +#+    +#+      +#+     +#+          +#+          +#+           +#+     
     #+#    #+#      #+#    #+#      #+#     #+#   #+#    #+#          #+#           #+#      
    #########       ###    ###      ###     ###    ########       ###########       ##########

    --helper                                        Show all program comands and how to use.

    '
  end

  def helpers
    print '
    --helper                                        Show all program comands and how to use.
    --return                                        Back to home(in case you are not at home).
    --exit                                          Exit the program.

'
  end

  def initial_options
    puts '
    Would you like to search:

    1-Popular Names(UF)     2-Popular Names of municipalities
    '
  end
end