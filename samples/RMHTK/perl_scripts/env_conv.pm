;# This sub will convert the HTK environment file in "csh" format
;# 		to "perl" format.
;#
;# Usage: &env_conv::env_convert(HTK_csh_env_file,HTK_perl_env);
;#
;# TL 7/1998
;#

package env_conv;
require Exporter;
@ISA	= qw(Exporter);
@EXPORT	= qw(env_convert);

sub env_convert {

	local ($env_file,$perl_env) = @_;
	open(ENVFILE,"<$env_file") or die "Can't open env $env_file file\n";
	open(PERLENV,">$perl_env") or die "Can't open env $perl_env file\n";
	while(<ENVFILE>) {
		(/^#/ || /^\s+$/) && next;	# skip an empty line or comment
		chop;
		($line, $comment) = split('#',$_);
		$line =~ s/=/ /;	# replace '=' with ' '
		$line =~s/\s+/ /g;			# turn one or more white spaces into a space
		$line =~ s/^ | $//;	# remove ' ' at the end of the line
		($command, $varname, $value ) = split / / ,"$line", 3;
		if ( ($command eq "set") || ($command eq "setenv") ) {
			$value =~ s/\(+//; 
			$value =~ s/\)+//; 
			$value =~ s/\{+//; 
			$value =~ s/\}+//; 
			printf PERLENV '$'."$varname = \"$value\";\n";
		}
		elsif ( $command eq "if" ) {
			printf PERLENV "$command ";
			if ( $varname =~ '$?' ) {
				$varname =~ s/\$\?/defined \$/;
			}
			printf PERLENV "$varname {\n";
		}
		elsif ( $command eq "else" ) {
			printf PERLENV "}\n$command {\n";
		}
		elsif ( $command eq "endif" ) {
			printf PERLENV "}\n";
		}
	}
	
	printf PERLENV "1;\n";
	close(ENVFILE);
	close(PERLENV);
}

1;
