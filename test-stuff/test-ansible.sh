
exit 

#ansible pull commando als update is
ansible-pull -U https://github.com/Milio64/setup.git

#ansible pull commando zonder verandering 
ansible-pull -U https://github.com/Milio64/setup.git -f

#ansible playbook starten
/root/.ansible/pull/rocky-mood.vanzeijl.net/local.yml


#alle variable van ansible facts op je sherm
ansible localhost -m ansible.builtin.setup

#test playbook ter lering en vermaak
ansible-playbook test-facts.yaml


#Dell laptop indentificeren aan zijn mac adressen (wifi en netwerk card)
#https://www.middlewareinventory.com/blog/ansible-facts-list-how-to-use-ansible-facts/
 
 
 
#use Hostmaam is voor nu snellet verwacht ik.
#onderstaand voorbeeld: rocky-mood in de meterkast.

when: ansible_hostname == "rocky-mood.vanzeijl.net"
when: ansible_default_ipv4.macaddress == "00:50:08:08:35:b8"

#voorbeeld met OR in when
when: ansible_default_ipv4.macaddress == "00:50:08:08:35:b8" or ansible_hostname == "rocky-mood.vanzeijl.net"
#bovenstaande was niet juist! hostname is "localhost als ansible-pull gebruikt wordt zoals ik nu doe!
#dus check specifieker maken met een and en het lukt wel.
when: ansible_default_ipv4.macaddress == "00:50:08:08:35:b8" and ansible_env.HOSTNAME == "rocky-mood.vanzeijl.net"


