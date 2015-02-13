Facter.add('is_vpn_enabled') do
  setcode do
    Facter::Util::Resolution.exec("pcs resource |  grep p_neutron-vpn-agent | awk '{print $3}'")
  end
end
