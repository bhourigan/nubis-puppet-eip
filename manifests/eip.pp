
class nubis_eip::eip (
    $ensure     = present,
    $auto       = true
){

    if ! ($ensure in ['present', 'absent']) {
        fail("${ensure} is not a valid parameter")
    }

    if $ensure == 'present' {
        $file_ensure        = 'file'
    } else {
        $file_enure         = 'absent'
    }

    if $auto == true {
        $link_ensure        = 'present'
    } else {
        $link_ensure        = 'absent'
    }

    file { '/etc/nubis.d/eip-associate':
        ensure  => $link_ensure,
        target  => '/usr/local/sbin/eip-associate',
    }

    file { '/usr/local/sbin/eip-associate':
        ensure  => $file_ensure,
        owner   => root,
        group   => root,
        mode    => '0755',
        source  => 'puppet:///modules/nubis_eip/eip-associate',
    }
}
