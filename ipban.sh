#!/usr/bin/ bash                                                                 
Font_Green="\033[32m";                                                          
Font_Yellow="\033[33m";                                                         
Font_Blue="\033[34m";                                                           
Font_Purple="\033[35m";                                                         
Font_SkyBlue="\033[36m";                                                        
Font_White="\033[37m";                                                          
Font_Suffix="\033[0m";                                                          
clear                                                                           
echo -e ""                                                                      
echo -e "   ============================================="                      
echo -e "      Sila Masukkan iP ban"                                            
read -p "      Ip ban: " ipban                                                  
# blockir torrent                                                               
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP            
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP        
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP            
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP           
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP  
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP             
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP             
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP              
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP             
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP            
iptables -A INPUT -s $ipban -j DROP                                             
iptables-save > /etc/iptables.up.rules                                          
iptables-restore -t < /etc/iptables.up.rules                                    
netfilter-persistent save                                                       
netfilter-persistent reload
