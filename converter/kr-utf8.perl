#!/usr/bin/perl
#
# This source code is originally from the below URL:
# http://mwultong.blogspot.com/2006/10/perl-euc-kr-utf-8-convert-unicode.html
#

use strict; use warnings;

  &help if $#ARGV == -1; # 옵션이 없으면 도움말 출력하고 종료

  # 변환 작업을 할 함수를 호출
  &fileEncodingConverter($ARGV[0], "cp949", "UTF-8"); # 입력 파일명, 입력 파일의 인코딩, 출력 파일의 인코딩



# 변환 작업을 할 함수의 본체
sub fileEncodingConverter {

  my $in_file      = $_[0];  # 입력 한국어 파일명
  my $in_file_enc  = $_[1];  # 입력 한국어 파일의 인코딩 (확장 완성형 cp949; euc-kr)
  my $out_file_enc = $_[2];  # 출력 유니코드 파일 인코딩

  my $out_file = $_[0] . ".uni"; # 입력 파일명 끝에, ".uni" 라는 확장자를 붙여, 출력 파일명 만들기


  open  IN, "<:encoding($in_file_enc)",   $in_file or die "$!\n";
  open OUT, ">:encoding($out_file_enc)", $out_file or die "$!\n";


  foreach (<IN>) {
    print OUT $_;
  }
  close IN; close OUT;
}


sub help { # 입력 파일을 지정하지 않았을 때, 도움말 출력하는 서브루틴
  die <<TEXT;

   * 한글 완성형 텍스트 파일을, 유니코드(UTF-8)로 변환 *

     사용법:

       kr2utf8.pl <한글 완성형 입력 파일>


     출력 파일명은, 입력 파일명의 끝에 .uni 확장자가 자동으로 붙음.
     출력된 UTF-8 파일에는 BOM 이 없음.

TEXT
}
