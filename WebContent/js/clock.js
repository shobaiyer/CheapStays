// OUR FUNCTION WHICH IS EXECUTED ON LOAD OF THE PAGE.
            function digitized() {
                var dt = new Date();    // DATE() CONSTRUCTOR FOR CURRENT SYSTEM DATE AND TIME.
                var hrs = dt.getHours();
                var min = dt.getMinutes();
                var sec = dt.getSeconds();
			
                min = Ticking(min);
                sec = Ticking(sec);

                document.getElementById('dc').innerHTML = hrs + ":" + min;
                document.getElementById('dc_second').innerHTML = sec;
                if (hrs > 12) { document.getElementById('dc_hour').innerHTML = 'PM'; }
                else { document.getElementById('dc_hour').innerHTML = 'AM'; }

                var time
                
                // THE ALL IMPORTANT PRE DEFINED JAVASCRIPT METHOD.
                time = setTimeout('digitized()', 1000);      
            }

            function Ticking(ticVal) {
                if (ticVal < 10) {
                    ticVal = "0" + ticVal;
                }
                return ticVal;
            }