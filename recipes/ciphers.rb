#
# Cookbook Name:: windows_schannel
# Recipe:: ciphers
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
case node['platform']
when 'windows'
  if node['platform_version'].to_f >= 6.0 || node['platform_version'].to_f <= 6.3
    registry_key 'cipher_null' do
      key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\NULL'
      recursive true
      case node['windows_schannel']['cipher_null']
      when 'disable'
        values [
          { name: 'Enabled', type: :dword, data: 0 }
        ]
        :create
      when 'enable'
        values [
          { name: 'Enabled', type: :dword, data: 4_294_967_295 }
        ]
        :create
      end
      only_if { node['windows_schannel']['cipher_null'] }
    end

    registry_key 'cipher_des' do
      key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\DES 56/56'
      recursive true
      case node['windows_schannel']['cipher_des']
      when 'disable'
        values [
          { name: 'Enabled', type: :dword, data: 0 }
        ]
        :create
      when 'enable'
        values [
          { name: 'Enabled', type: :dword, data: 4_294_967_295 }
        ]
        :create
      end
      only_if { node['windows_schannel']['cipher_des'] }
    end

    case node['windows_schannel']['cipher_rc2']
    when 'disable'
      ['RC2 40/128', 'RC2 56/128', 'RC2 128/128'].each do |cipher|
        registry_key cipher do
          key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\#{cipher}"
          recursive true
          values [{ name: 'Enabled', type: :dword, data: 0 }]
          :create
        end
      end
    when 'enable'
      ['RC2 40/128', 'RC2 56/128', 'RC2 128/128'].each do |cipher|
        registry_key cipher do
          key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\#{cipher}"
          recursive true
          values [{ name: 'Enabled', type: :dword, data: 4_294_967_295 }]
          :create
        end
      end
    end

    case node['windows_schannel']['cipher_rc4']
    when 'disable'
      ['RC4 40/128', 'RC4 56/128', 'RC4 64/128'].each do |cipher|
        registry_key cipher do
          key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\#{cipher}"
          recursive true
          values [{ name: 'Enabled', type: :dword, data: 0 }]
          :create
        end
      end
    when 'enable'
      ['RC4 40/128', 'RC4 56/128', 'RC4 64/128'].each do |cipher|
        registry_key cipher do
          key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\#{cipher}"
          recursive true
          values [{ name: 'Enabled', type: :dword, data: 4_294_967_295 }]
          :create
        end
      end
    end

    registry_key 'cipher_3des' do
      key 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168/168'
      recursive true
      case node['windows_schannel']['cipher_3des']
      when 'disable'
        values [
          { name: 'Enabled', type: :dword, data: 0 }
        ]
        :create
      when 'enable'
        values [
          { name: 'Enabled', type: :dword, data: 4_294_967_295 }
        ]
        :create
      end
      only_if { node['windows_schannel']['cipher_3des'] }
    end

    case node['windows_schannel']['cipher_aes']
    when 'disable'
      ['AES 128/128', 'AES 256/256'].each do |cipher|
        registry_key cipher do
          key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\#{cipher}"
          recursive true
          values [{ name: 'Enabled', type: :dword, data: 0 }]
          :create
        end
      end
    when 'enable'
      ['AES 128/128', 'AES 256/256'].each do |cipher|
        registry_key cipher do
          key "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Ciphers\\#{cipher}"
          recursive true
          values [{ name: 'Enabled', type: :dword, data: 4_294_967_295 }]
          :create
        end
      end
    end
  end
end

#     registry_key 'cipher_rc4' do
#       key 'HKLM\sdffds'
#       values [{
#         name: 'Enable',
#         type: :dword,
#         data: "node['windows_schannel']['cipher_rc4']"
#       }]
#       action :create
#       only_if { node['windows_schannel']['cipher_rc4'].is_a?(Integer) }
#     end
#     registry_key 'cipher_3des' do
#       key 'HKLM\sdffds'
#       values [{
#         name: 'Enable',
#         type: :dword,
#         data: "node['windows_schannel']['cipher_3des']"
#       }]
#       action :create
#       only_if { node['windows_schannel']['cipher_3des'].is_a?(Integer) }
#     end
#     registry_key 'cipher_aes' do
#       key 'HKLM\sdffds'
#       values [{
#         name: 'Enable',
#         type: :dword,
#         data: "node['windows_schannel']['cipher_aes']"
#       }]
#       action :create
#       only_if { node['windows_schannel']['cipher_aes'].is_a?(Integer) }
#     end
