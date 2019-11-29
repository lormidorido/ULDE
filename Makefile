# This Makefile is for the ULDE extension to perl.
#
# It was generated automatically by MakeMaker version
# 6.68 (Revision: 66800) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#

#   MakeMaker Parameters:

#     AUTHOR => [q[Catalyst developer]]
#     BUILD_REQUIRES => { Test::More=>q[0.88], ExtUtils::MakeMaker=>q[6.36] }
#     CONFIGURE_REQUIRES => {  }
#     DISTNAME => q[ULDE]
#     EXE_FILES => [q[script/test.pl], q[script/test_old.pl], q[script/ulde_web_cgi.pl], q[script/ulde_web_create.pl], q[script/ulde_web_fastcgi.pl], q[script/ulde_web_server.pl], q[script/ulde_web_test.pl]]
#     LICENSE => q[perl]
#     NAME => q[ULDE]
#     NO_META => q[1]
#     PREREQ_PM => { HTML::FormHandler::Model::DBIC=>q[0.21], Catalyst::Plugin::ConfigLoader=>q[0], MooseX::Traits=>q[0.12], JSON::XS=>q[3.01], Catalyst::View::HTML::Mason=>q[0.19], HTML::Summary=>q[0.019], List::Util=>q[1.41], Catalyst::View::JSON=>q[0.33], Catalyst::Plugin::Session::Store::FastMmap=>q[0.16], Catalyst::Model::Factory=>q[0.10], Catalyst::Plugin::Authorization::Roles=>q[0.09], Catalyst::Plugin::Session::State::Cookie=>q[0.17], Config::General=>q[0], Data::Serializer::Raw=>q[0.02], Catalyst::Action::REST=>q[1.17], Catalyst::Helper::Model::DBIC::Schema=>q[0.60], MooseX::ClassAttribute=>q[0.27], HTML::Tree=>q[5.03], Catalyst::Authentication::Store::DBIx::Class=>q[0.1503], Excel::Writer::XLSX=>q[0.49], MooseX::MarkAsMethods=>q[0.15], Text::Stripper=>q[1.16], ExtUtils::MakeMaker=>q[6.36], DBD::Pg=>q[2.19.2], Data::Dumper=>q[0], Class::DBI=>q[3.0.17], HTTP::Cookies=>q[6.01], Catalyst::Plugin::Session=>q[0.35], Config::ZOMG=>q[1.0], Catalyst::TraitFor::Request::BrowserDetect=>q[0.02], Test::More=>q[0.88], Digest::HMAC_SHA1=>q[1.03], Catalyst::Model::Adaptor=>q[0.10], Catalyst::Plugin::Cache=>q[0.12], Catalyst::Model::DBIC::Schema=>q[0.65], HTML::FormHandler=>q[0.40022], HTTP::Response=>q[6.04], URI::Escape=>q[3.31], MooseX::NonMoose=>q[0.22], HTML::TokeParser=>q[3.69], Catalyst::Plugin::DateTime=>q[0.03], LWP::Protocol::https=>q[6.06], Catalyst::Plugin::Session::Store::DBIC=>q[0.12], Facebook=>q[0.102], DBIx::Class::Schema::Loader=>q[0.07025], Moose=>q[2.1402], URI=>q[1.67], namespace::autoclean=>q[0], Catalyst::Plugin::Static::Simple=>q[0], Catalyst::View::Mason2=>q[0.03], MooseX::UndefTolerant=>q[0], Catalyst::Action::RenderView=>q[0], HTTP::Date=>q[6.02], String::MkPasswd=>q[0.05], URL::Encode=>q[0.03], LWP::UserAgent=>q[6.06], Catalyst::Model::Facebook=>q[0.101], Catalyst::Plugin::Authentication=>q[0.10021], Catalyst::Runtime=>q[5.90015], JSON=>q[2.90], DateTime::Format::Pg=>q[0.16010] }
#     TEST_REQUIRES => {  }
#     VERSION => q[0.01]
#     VERSION_FROM => q[lib/ULDE/Web.pm]
#     dist => { PREOP=>q[$(PERL) -I. "-MModule::Install::Admin" -e "dist_preop(q($(DISTVNAME)))"] }
#     realclean => { FILES=>q[MYMETA.yml] }
#     test => { TESTS=>q[t/01app.t t/02pod.t t/03podcoverage.t t/controller_Account.t t/controller_API-REST.t t/controller_Product.t t/controller_Session-Authentication.t t/controller_Session-Management.t t/model_Component-Form-Account.t t/model_Component-Session.t t/model_DB-ULDE.t t/view_Mason.t t/view_Mason2.t] }

# --- MakeMaker post_initialize section:


# --- MakeMaker const_config section:

# These definitions are from config.sh (via /usr/lib64/perl5/Config.pm).
# They may have been overridden via Makefile.PL or on the command line.
AR = ar
CC = gcc
CCCDLFLAGS = -fPIC
CCDLFLAGS = -Wl,--enable-new-dtags -Wl,-rpath,/usr/lib64/perl5/CORE
DLEXT = so
DLSRC = dl_dlopen.xs
EXE_EXT = 
FULL_AR = /usr/bin/ar
LD = gcc
LDDLFLAGS = -shared -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -Wl,-z,relro 
LDFLAGS =  -fstack-protector
LIBC = 
LIB_EXT = .a
OBJ_EXT = .o
OSNAME = linux
OSVERS = 3.10.0-514.16.1.el7.x86_64
RANLIB = :
SITELIBEXP = /usr/local/share/perl5
SITEARCHEXP = /usr/local/lib64/perl5
SO = so
VENDORARCHEXP = /usr/lib64/perl5/vendor_perl
VENDORLIBEXP = /usr/share/perl5/vendor_perl


# --- MakeMaker constants section:
AR_STATIC_ARGS = cr
DIRFILESEP = /
DFSEP = $(DIRFILESEP)
NAME = ULDE
NAME_SYM = ULDE
VERSION = 0.01
VERSION_MACRO = VERSION
VERSION_SYM = 0_01
DEFINE_VERSION = -D$(VERSION_MACRO)=\"$(VERSION)\"
XS_VERSION = 0.01
XS_VERSION_MACRO = XS_VERSION
XS_DEFINE_VERSION = -D$(XS_VERSION_MACRO)=\"$(XS_VERSION)\"
INST_ARCHLIB = blib/arch
INST_SCRIPT = blib/script
INST_BIN = blib/bin
INST_LIB = blib/lib
INST_MAN1DIR = blib/man1
INST_MAN3DIR = blib/man3
MAN1EXT = 1
MAN3EXT = 3pm
INSTALLDIRS = site
DESTDIR = 
PREFIX = $(SITEPREFIX)
PERLPREFIX = /usr
SITEPREFIX = /usr/local
VENDORPREFIX = /usr
INSTALLPRIVLIB = /usr/share/perl5
DESTINSTALLPRIVLIB = $(DESTDIR)$(INSTALLPRIVLIB)
INSTALLSITELIB = /usr/local/share/perl5
DESTINSTALLSITELIB = $(DESTDIR)$(INSTALLSITELIB)
INSTALLVENDORLIB = /usr/share/perl5/vendor_perl
DESTINSTALLVENDORLIB = $(DESTDIR)$(INSTALLVENDORLIB)
INSTALLARCHLIB = /usr/lib64/perl5
DESTINSTALLARCHLIB = $(DESTDIR)$(INSTALLARCHLIB)
INSTALLSITEARCH = /usr/local/lib64/perl5
DESTINSTALLSITEARCH = $(DESTDIR)$(INSTALLSITEARCH)
INSTALLVENDORARCH = /usr/lib64/perl5/vendor_perl
DESTINSTALLVENDORARCH = $(DESTDIR)$(INSTALLVENDORARCH)
INSTALLBIN = /usr/bin
DESTINSTALLBIN = $(DESTDIR)$(INSTALLBIN)
INSTALLSITEBIN = /usr/local/bin
DESTINSTALLSITEBIN = $(DESTDIR)$(INSTALLSITEBIN)
INSTALLVENDORBIN = /usr/bin
DESTINSTALLVENDORBIN = $(DESTDIR)$(INSTALLVENDORBIN)
INSTALLSCRIPT = /usr/bin
DESTINSTALLSCRIPT = $(DESTDIR)$(INSTALLSCRIPT)
INSTALLSITESCRIPT = /usr/local/bin
DESTINSTALLSITESCRIPT = $(DESTDIR)$(INSTALLSITESCRIPT)
INSTALLVENDORSCRIPT = /usr/bin
DESTINSTALLVENDORSCRIPT = $(DESTDIR)$(INSTALLVENDORSCRIPT)
INSTALLMAN1DIR = /usr/share/man/man1
DESTINSTALLMAN1DIR = $(DESTDIR)$(INSTALLMAN1DIR)
INSTALLSITEMAN1DIR = /usr/local/share/man/man1
DESTINSTALLSITEMAN1DIR = $(DESTDIR)$(INSTALLSITEMAN1DIR)
INSTALLVENDORMAN1DIR = /usr/share/man/man1
DESTINSTALLVENDORMAN1DIR = $(DESTDIR)$(INSTALLVENDORMAN1DIR)
INSTALLMAN3DIR = /usr/share/man/man3
DESTINSTALLMAN3DIR = $(DESTDIR)$(INSTALLMAN3DIR)
INSTALLSITEMAN3DIR = /usr/local/share/man/man3
DESTINSTALLSITEMAN3DIR = $(DESTDIR)$(INSTALLSITEMAN3DIR)
INSTALLVENDORMAN3DIR = /usr/share/man/man3
DESTINSTALLVENDORMAN3DIR = $(DESTDIR)$(INSTALLVENDORMAN3DIR)
PERL_LIB =
PERL_ARCHLIB = /usr/lib64/perl5
LIBPERL_A = libperl.a
FIRST_MAKEFILE = Makefile
MAKEFILE_OLD = Makefile.old
MAKE_APERL_FILE = Makefile.aperl
PERLMAINCC = $(CC)
PERL_INC = /usr/lib64/perl5/CORE
PERL = /usr/bin/perl "-Iinc"
FULLPERL = /usr/bin/perl "-Iinc"
ABSPERL = $(PERL)
PERLRUN = $(PERL)
FULLPERLRUN = $(FULLPERL)
ABSPERLRUN = $(ABSPERL)
PERLRUNINST = $(PERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
FULLPERLRUNINST = $(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
ABSPERLRUNINST = $(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-Iinc" "-I$(INST_LIB)"
PERL_CORE = 0
PERM_DIR = 755
PERM_RW = 644
PERM_RWX = 755

MAKEMAKER   = /usr/share/perl5/vendor_perl/ExtUtils/MakeMaker.pm
MM_VERSION  = 6.68
MM_REVISION = 66800

# FULLEXT = Pathname for extension directory (eg Foo/Bar/Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT. (eg Oracle)
# PARENT_NAME = NAME without BASEEXT and no trailing :: (eg Foo::Bar)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
MAKE = make
FULLEXT = ULDE
BASEEXT = ULDE
PARENT_NAME = 
DLBASE = $(BASEEXT)
VERSION_FROM = lib/ULDE/Web.pm
OBJECT = 
LDFROM = $(OBJECT)
LINKTYPE = dynamic
BOOTDEP = 

# Handy lists of source code files:
XS_FILES = 
C_FILES  = 
O_FILES  = 
H_FILES  = 
MAN1PODS = script/ulde_web_cgi.pl \
	script/ulde_web_create.pl \
	script/ulde_web_fastcgi.pl \
	script/ulde_web_server.pl \
	script/ulde_web_test.pl
MAN3PODS = lib/ULDE/Schema/ULDE/Result/Activity.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityCode.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityProductInstance.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityTemplateInstance.pm \
	lib/ULDE/Schema/ULDE/Result/Address.pm \
	lib/ULDE/Schema/ULDE/Result/Associate.pm \
	lib/ULDE/Schema/ULDE/Result/AssociateDiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/CategorySubCategoryRelation.pm \
	lib/ULDE/Schema/ULDE/Result/Code.pm \
	lib/ULDE/Schema/ULDE/Result/Communication.pm \
	lib/ULDE/Schema/ULDE/Result/Country.pm \
	lib/ULDE/Schema/ULDE/Result/Customer.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerAccount.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerAddress.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerRole.pm \
	lib/ULDE/Schema/ULDE/Result/DiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentAssemblyProvider.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplate.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplateJurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplateVersion.pm \
	lib/ULDE/Schema/ULDE/Result/EleServiceOption.pm \
	lib/ULDE/Schema/ULDE/Result/EventCode.pm \
	lib/ULDE/Schema/ULDE/Result/EventLog.pm \
	lib/ULDE/Schema/ULDE/Result/FileFormat.pm \
	lib/ULDE/Schema/ULDE/Result/FileStorage.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignAccount.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignAccountDetail.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignProvider.pm \
	lib/ULDE/Schema/ULDE/Result/HttpSession.pm \
	lib/ULDE/Schema/ULDE/Result/HttpSessionProduct.pm \
	lib/ULDE/Schema/ULDE/Result/Jurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/LegalArea.pm \
	lib/ULDE/Schema/ULDE/Result/LegalCategory.pm \
	lib/ULDE/Schema/ULDE/Result/LegalSubCategory.pm \
	lib/ULDE/Schema/ULDE/Result/Message.pm \
	lib/ULDE/Schema/ULDE/Result/Product.pm \
	lib/ULDE/Schema/ULDE/Result/ProductDiscount.pm \
	lib/ULDE/Schema/ULDE/Result/ProductDocumentTemplate.pm \
	lib/ULDE/Schema/ULDE/Result/ProductFeeDiscount.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstance.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstanceAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstancePurchaseTransaction.pm \
	lib/ULDE/Schema/ULDE/Result/ProductJurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/ProductServiceDefinition.pm \
	lib/ULDE/Schema/ULDE/Result/ProductServiceLevel.pm \
	lib/ULDE/Schema/ULDE/Result/Provider.pm \
	lib/ULDE/Schema/ULDE/Result/PurchaseTransaction.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewAccountability.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewService.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibility.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityCode.pm \
	lib/ULDE/Schema/ULDE/Result/Reviewer.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerCustomer.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerResponsibility.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerRole.pm \
	lib/ULDE/Schema/ULDE/Result/Role.pm \
	lib/ULDE/Schema/ULDE/Result/RoleCode.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinition.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionDiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionLegalArea.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionUrl.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceLevel.pm \
	lib/ULDE/Schema/ULDE/Result/ShoppingBasket.pm \
	lib/ULDE/Schema/ULDE/Result/StatusCode.pm \
	lib/ULDE/Schema/ULDE/Result/TemplateInstance.pm \
	lib/ULDE/Schema/ULDE/Result/TemplateInstanceFileStorage.pm \
	lib/ULDE/Schema/ULDE/Result/UldeSubCategory.pm \
	lib/ULDE/Web.pm \
	lib/ULDE/Web/Controller/Session/Management.pm \
	lib/ULDE/Web/Model/DB/ULDE.pm \
	lib/ULDE/Web/View/JSON.pm

# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIB)$(DFSEP)Config.pm $(PERL_INC)$(DFSEP)config.h

# Where to build things
INST_LIBDIR      = $(INST_LIB)
INST_ARCHLIBDIR  = $(INST_ARCHLIB)

INST_AUTODIR     = $(INST_LIB)/auto/$(FULLEXT)
INST_ARCHAUTODIR = $(INST_ARCHLIB)/auto/$(FULLEXT)

INST_STATIC      = 
INST_DYNAMIC     = 
INST_BOOT        = 

# Extra linker info
EXPORT_LIST        = 
PERL_ARCHIVE       = 
PERL_ARCHIVE_AFTER = 


TO_INST_PM = lib/ULDE.pm \
	lib/ULDE/Component.pm \
	lib/ULDE/Component/Account.pm \
	lib/ULDE/Component/Account/Customer.pm \
	lib/ULDE/Component/Account/Provider.pm \
	lib/ULDE/Component/Activity.pm \
	lib/ULDE/Component/Address.pm \
	lib/ULDE/Component/Associate.pm \
	lib/ULDE/Component/Code.pm \
	lib/ULDE/Component/Communication.pm \
	lib/ULDE/Component/Country.pm \
	lib/ULDE/Component/Customer.pm \
	lib/ULDE/Component/DiscountVoucher.pm \
	lib/ULDE/Component/DocumentAssemblyProvider.pm \
	lib/ULDE/Component/FileStorage.pm \
	lib/ULDE/Component/ForeignAccount.pm \
	lib/ULDE/Component/ForeignProvider.pm \
	lib/ULDE/Component/Jurisdiction.pm \
	lib/ULDE/Component/LegalArea.pm \
	lib/ULDE/Component/LegalCategory.pm \
	lib/ULDE/Component/LegalSubCategory.pm \
	lib/ULDE/Component/Message.pm \
	lib/ULDE/Component/Product.pm \
	lib/ULDE/Component/Product/Instance.pm \
	lib/ULDE/Component/Product/ServiceDefinition.pm \
	lib/ULDE/Component/Product/ServiceDefinition_org.pm \
	lib/ULDE/Component/Product/Session.pm \
	lib/ULDE/Component/Product/Template.pm \
	lib/ULDE/Component/Product/Template_org.pm \
	lib/ULDE/Component/Provider.pm \
	lib/ULDE/Component/PurchaseTransaction.pm \
	lib/ULDE/Component/Referrer.pm \
	lib/ULDE/Component/ReviewServiceResponsibility.pm \
	lib/ULDE/Component/ReviewServiceResponsibility/._Code.pm \
	lib/ULDE/Component/ReviewServiceResponsibility/._Reviewer.pm \
	lib/ULDE/Component/ReviewServiceResponsibility/Code.pm \
	lib/ULDE/Component/ReviewServiceResponsibility/Reviewer.pm \
	lib/ULDE/Component/Reviewer.pm \
	lib/ULDE/Component/Role.pm \
	lib/ULDE/Component/ServiceDefinition.pm \
	lib/ULDE/Component/ServiceDefinitionUrl.pm \
	lib/ULDE/Component/ServiceLevel.pm \
	lib/ULDE/Component/ServiceLevel/Product.pm \
	lib/ULDE/Component/ServiceLevel/Product_org.pm \
	lib/ULDE/Component/Session.pm \
	lib/ULDE/Component/Template.pm \
	lib/ULDE/Component/Template/Instance.pm \
	lib/ULDE/Component/Template/Product.pm \
	lib/ULDE/Component/Template/Product_org.pm \
	lib/ULDE/Component/Utilities.pm \
	lib/ULDE/Config.pm \
	lib/ULDE/FileStorage/._debt management & collection (484) 4-8-2015.pdf \
	lib/ULDE/FileStorage/business startup (594) 22-4-2016.pdf \
	lib/ULDE/FileStorage/business startup (664) 26-4-2016.pdf \
	lib/ULDE/FileStorage/business startup (664) 27-4-2016.pdf \
	lib/ULDE/FileStorage/business startup (664) 28-4-2016.pdf \
	lib/ULDE/FileStorage/business startup (678) 19-5-2016.pdf \
	lib/ULDE/FileStorage/business startup (679) 15-6-2016.pdf \
	lib/ULDE/FileStorage/business startup (679) 21-6-2016.pdf \
	lib/ULDE/FileStorage/business startup (680) 15-6-2016.pdf \
	lib/ULDE/FileStorage/business startup (680) 8-7-2016.pdf \
	lib/ULDE/FileStorage/business startup (707) 15-6-2016.pdf \
	lib/ULDE/FileStorage/business startup (726) 20-6-2016.pdf \
	lib/ULDE/FileStorage/changing a will (716) 14-6-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (651) 24-4-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (652) 24-4-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (653) 24-4-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (663) 25-4-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (698) 14-6-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (703) 13-6-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (710) 10-7-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (710) 3-7-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (740) 9-7-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (484) 4-8-2015.pdf \
	lib/ULDE/FileStorage/debt management & collection (647) 24-4-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (650) 24-4-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (657) 25-4-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (674) 10-5-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (675) 15-6-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (746) 18-7-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (751) 16-9-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (586) 19-4-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (677) 13-6-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (683) 9-6-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (692) 10-6-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (693) 10-6-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (708) 14-6-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (713) 14-6-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (741) 9-7-2016.pdf \
	lib/ULDE/FileStorage/employing staff (580) 18-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (592) 22-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (593) 22-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (656) 25-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (666) 28-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (669) 28-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (670) 29-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (689) 9-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (690) 10-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (691) 10-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (711) 3-7-2016.pdf \
	lib/ULDE/FileStorage/employing staff (723) 15-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (725) 15-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (725) 16-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (725) 17-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (725) 20-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (730) 20-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (732) 13-7-2016.pdf \
	lib/ULDE/FileStorage/employing staff (733) 21-6-2016.pdf \
	lib/ULDE/FileStorage/employing staff (763) 29-9-2016.pdf \
	lib/ULDE/FileStorage/managing staff (599) 22-4-2016.pdf \
	lib/ULDE/FileStorage/managing staff (601) 23-4-2016.pdf \
	lib/ULDE/FileStorage/managing staff (646) 24-4-2016.pdf \
	lib/ULDE/FileStorage/managing staff (673) 9-5-2016.pdf \
	lib/ULDE/FileStorage/managing staff (684) 9-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (697) 13-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (706) 13-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (709) 14-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (712) 14-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (735) 26-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (736) 2-7-2016.pdf \
	lib/ULDE/FileStorage/managing staff (742) 10-7-2016.pdf \
	lib/ULDE/FileStorage/managing staff (748) 25-7-2016.pdf \
	lib/ULDE/FileStorage/managing staff (750) 19-8-2016.pdf \
	lib/ULDE/FileStorage/powers of attorney (665) 27-4-2016.pdf \
	lib/ULDE/FileStorage/powers of attorney (687) 9-6-2016.pdf \
	lib/ULDE/FileStorage/powers of attorney (688) 9-6-2016.pdf \
	lib/ULDE/FileStorage/powers of attorney (715) 14-6-2016.pdf \
	lib/ULDE/FileStorage/powers of attorney (717) 15-6-2016.pdf \
	lib/ULDE/FileStorage/probate (649) 24-4-2016.pdf \
	lib/ULDE/FileStorage/probate (685) 9-6-2016.pdf \
	lib/ULDE/FileStorage/probate (695) 10-6-2016.pdf \
	lib/ULDE/FileStorage/probate (734) 21-6-2016.pdf \
	lib/ULDE/FileStorage/probate (747) 19-7-2016.pdf \
	lib/ULDE/FileStorage/probate (749) 1-8-2016.pdf \
	lib/ULDE/FileStorage/probate (752) 16-9-2016.pdf \
	lib/ULDE/FileStorage/probate (753) 16-9-2016.pdf \
	lib/ULDE/FileStorage/probate (754) 16-9-2016.pdf \
	lib/ULDE/FileStorage/probate (755) 16-9-2016.pdf \
	lib/ULDE/FileStorage/probate (756) 16-9-2016.pdf \
	lib/ULDE/FileStorage/probate (758) 16-9-2016.pdf \
	lib/ULDE/FileStorage/probate (759) 16-9-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (584) 19-4-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (585) 19-4-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (600) 22-4-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (601) 23-4-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (660) 25-4-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (696) 13-6-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (701) 13-6-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (714) 14-6-2016.pdf \
	lib/ULDE/FileStorage/sales & marketing (738) 8-7-2016.pdf \
	lib/ULDE/FileStorage/wills (661) 25-4-2016.pdf \
	lib/ULDE/FileStorage/wills (662) 25-4-2016.pdf \
	lib/ULDE/FileStorage/wills (721) 15-6-2016.pdf \
	lib/ULDE/FileStorage/wills (724) 17-6-2016.pdf \
	lib/ULDE/Interface.pm \
	lib/ULDE/Interface/DocumentAssembler.pm \
	lib/ULDE/Schema/ULDE.pm \
	lib/ULDE/Schema/ULDE/Result/Activity.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityCode.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityProductInstance.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityTemplateInstance.pm \
	lib/ULDE/Schema/ULDE/Result/Address.pm \
	lib/ULDE/Schema/ULDE/Result/Associate.pm \
	lib/ULDE/Schema/ULDE/Result/AssociateDiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/CategorySubCategoryRelation.pm \
	lib/ULDE/Schema/ULDE/Result/Code.pm \
	lib/ULDE/Schema/ULDE/Result/Communication.pm \
	lib/ULDE/Schema/ULDE/Result/Country.pm \
	lib/ULDE/Schema/ULDE/Result/Customer.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerAccount.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerAddress.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerRole.pm \
	lib/ULDE/Schema/ULDE/Result/DiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentAssemblyProvider.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplate.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplateJurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplateVersion.pm \
	lib/ULDE/Schema/ULDE/Result/EleServiceOption.pm \
	lib/ULDE/Schema/ULDE/Result/EventCode.pm \
	lib/ULDE/Schema/ULDE/Result/EventLog.pm \
	lib/ULDE/Schema/ULDE/Result/FileFormat.pm \
	lib/ULDE/Schema/ULDE/Result/FileStorage.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignAccount.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignAccountDetail.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignProvider.pm \
	lib/ULDE/Schema/ULDE/Result/HttpSession.pm \
	lib/ULDE/Schema/ULDE/Result/HttpSessionProduct.pm \
	lib/ULDE/Schema/ULDE/Result/Jurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/LegalArea.pm \
	lib/ULDE/Schema/ULDE/Result/LegalCategory.pm \
	lib/ULDE/Schema/ULDE/Result/LegalSubCategory.pm \
	lib/ULDE/Schema/ULDE/Result/Message.pm \
	lib/ULDE/Schema/ULDE/Result/Product.pm \
	lib/ULDE/Schema/ULDE/Result/ProductDiscount.pm \
	lib/ULDE/Schema/ULDE/Result/ProductDocumentTemplate.pm \
	lib/ULDE/Schema/ULDE/Result/ProductFeeDiscount.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstance.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstanceAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstancePurchaseTransaction.pm \
	lib/ULDE/Schema/ULDE/Result/ProductJurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/ProductServiceDefinition.pm \
	lib/ULDE/Schema/ULDE/Result/ProductServiceLevel.pm \
	lib/ULDE/Schema/ULDE/Result/Provider.pm \
	lib/ULDE/Schema/ULDE/Result/PurchaseTransaction.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewAccountability.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewService.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibility.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityCode.pm \
	lib/ULDE/Schema/ULDE/Result/Reviewer.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerCustomer.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerResponsibility.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerRole.pm \
	lib/ULDE/Schema/ULDE/Result/Role.pm \
	lib/ULDE/Schema/ULDE/Result/RoleCode.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinition.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionDiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionLegalArea.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionUrl.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceLevel.pm \
	lib/ULDE/Schema/ULDE/Result/ShoppingBasket.pm \
	lib/ULDE/Schema/ULDE/Result/StatusCode.pm \
	lib/ULDE/Schema/ULDE/Result/TemplateInstance.pm \
	lib/ULDE/Schema/ULDE/Result/TemplateInstanceFileStorage.pm \
	lib/ULDE/Schema/ULDE/Result/UldeSubCategory.pm \
	lib/ULDE/Utilities.pm \
	lib/ULDE/Web.pm \
	lib/ULDE/Web/Component/Form.pm \
	lib/ULDE/Web/Component/Form/._Template.pm \
	lib/ULDE/Web/Component/Form/Account.pm \
	lib/ULDE/Web/Component/Form/Account/Register.pm \
	lib/ULDE/Web/Component/Form/Account/RegisterByAdmin.pm \
	lib/ULDE/Web/Component/Form/Account/Update.pm \
	lib/ULDE/Web/Component/Form/Field/Address.pm \
	lib/ULDE/Web/Component/Form/Field/CardDetails.pm \
	lib/ULDE/Web/Component/Form/Field/ContactDetails.pm \
	lib/ULDE/Web/Component/Form/Field/Country.pm \
	lib/ULDE/Web/Component/Form/Field/Customer.pm \
	lib/ULDE/Web/Component/Form/Field/Mobile.pm \
	lib/ULDE/Web/Component/Form/Field/Postcode.pm \
	lib/ULDE/Web/Component/Form/Field/Telephone.pm \
	lib/ULDE/Web/Component/Form/Field/TermsOfEngagement.pm \
	lib/ULDE/Web/Component/Form/Field/TermsOfUseAndMerchantNotice.pm \
	lib/ULDE/Web/Component/Form/Login.pm \
	lib/ULDE/Web/Component/Form/Payment.pm \
	lib/ULDE/Web/Component/Form/Payment/Basket.pm \
	lib/ULDE/Web/Component/Form/Product.pm \
	lib/ULDE/Web/Component/Form/Product/._MainCategory.pm \
	lib/ULDE/Web/Component/Form/Product/MainCategory.pm \
	lib/ULDE/Web/Component/Form/Reviewer.pm \
	lib/ULDE/Web/Component/Form/Template.pm \
	lib/ULDE/Web/Component/Form/Template/._Rename.pm \
	lib/ULDE/Web/Component/Form/Template/Rename.pm \
	lib/ULDE/Web/Component/Form/Template/SignOff.pm \
	lib/ULDE/Web/Component/Session.pm \
	lib/ULDE/Web/Controller/API/REST.pm \
	lib/ULDE/Web/Controller/Account.pm \
	lib/ULDE/Web/Controller/Admin/Root.pm \
	lib/ULDE/Web/Controller/DocumentProduction.pm \
	lib/ULDE/Web/Controller/HelpCentre.pm \
	lib/ULDE/Web/Controller/Product.pm \
	lib/ULDE/Web/Controller/Root.pm \
	lib/ULDE/Web/Controller/Session/Authentication.pm \
	lib/ULDE/Web/Controller/Session/Management.pm \
	lib/ULDE/Web/Controller/Widget/Modal.pm \
	lib/ULDE/Web/Model/Component/Account/Customer.pm \
	lib/ULDE/Web/Model/Component/Code.pm \
	lib/ULDE/Web/Model/Component/Customer.pm \
	lib/ULDE/Web/Model/Component/DiscountVoucher.pm \
	lib/ULDE/Web/Model/Component/FileStorage.pm \
	lib/ULDE/Web/Model/Component/Product.pm \
	lib/ULDE/Web/Model/Component/Product/Instance.pm \
	lib/ULDE/Web/Model/Component/Reviewer.pm \
	lib/ULDE/Web/Model/Component/ServiceDefinition.pm \
	lib/ULDE/Web/Model/Component/Template/Instance.pm \
	lib/ULDE/Web/Model/DB/ULDE.pm \
	lib/ULDE/Web/Model/DB/ULDE.pm.new \
	lib/ULDE/Web/Model/Interface/DocumentAssembler.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Account.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Account/Register.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Account/RegisterByAdmin.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Account/Update.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Login.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Payment/Basket.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Product.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Product/MainCategory.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Reviewer.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Template.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Template/Rename.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Template/SignOff.pm \
	lib/ULDE/Web/Model/Web/Component/Session.pm \
	lib/ULDE/Web/Service/REST/Client.pm \
	lib/ULDE/Web/Service/REST/Client/Response.pm \
	lib/ULDE/Web/Service/REST/Client/Serializer.pm \
	lib/ULDE/Web/Service/REST/ELE.pm \
	lib/ULDE/Web/Service/SOAP/Ineus.pm \
	lib/ULDE/Web/Service/SOAP/Server/Ineus.pm \
	lib/ULDE/Web/Service/WebSite/ELE.pm \
	lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/admin_cookie_jar \
	lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/ragnar@signal.bz - bbggttrr \
	lib/ULDE/Web/Service/WebSite/ELE/Response.pm \
	lib/ULDE/Web/Service/WebSite/bin/refresh_session_cookies.pl \
	lib/ULDE/Web/View/JSON.pm \
	lib/ULDE/Web/View/Mason.pm \
	lib/ULDE/Web/View/Mason2.pm

PM_TO_BLIB = lib/ULDE/Component/Template.pm \
	blib/lib/ULDE/Component/Template.pm \
	lib/ULDE/FileStorage/employing staff (656) 25-4-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (656) 25-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ForeignProvider.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ForeignProvider.pm \
	lib/ULDE/FileStorage/business startup (679) 21-6-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (679) 21-6-2016.pdf \
	lib/ULDE/Web/Component/Form/Field/TermsOfEngagement.pm \
	blib/lib/ULDE/Web/Component/Form/Field/TermsOfEngagement.pm \
	lib/ULDE/Web/Controller/Session/Management.pm \
	blib/lib/ULDE/Web/Controller/Session/Management.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplateJurisdiction.pm \
	blib/lib/ULDE/Schema/ULDE/Result/DocumentTemplateJurisdiction.pm \
	lib/ULDE/FileStorage/business startup (680) 8-7-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (680) 8-7-2016.pdf \
	lib/ULDE/Web/Component/Form/Field/Address.pm \
	blib/lib/ULDE/Web/Component/Form/Field/Address.pm \
	lib/ULDE/Schema/ULDE.pm \
	blib/lib/ULDE/Schema/ULDE.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceLevel.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ServiceLevel.pm \
	lib/ULDE/Schema/ULDE/Result/EventCode.pm \
	blib/lib/ULDE/Schema/ULDE/Result/EventCode.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinition.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinition.pm \
	lib/ULDE/Web/Component/Form/Account/RegisterByAdmin.pm \
	blib/lib/ULDE/Web/Component/Form/Account/RegisterByAdmin.pm \
	lib/ULDE/FileStorage/powers of attorney (688) 9-6-2016.pdf \
	blib/lib/ULDE/FileStorage/powers of attorney (688) 9-6-2016.pdf \
	lib/ULDE/Component/Utilities.pm \
	blib/lib/ULDE/Component/Utilities.pm \
	lib/ULDE/Component/Role.pm \
	blib/lib/ULDE/Component/Role.pm \
	lib/ULDE/FileStorage/employing staff (580) 18-4-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (580) 18-4-2016.pdf \
	lib/ULDE/Component/Template/Product.pm \
	blib/lib/ULDE/Component/Template/Product.pm \
	lib/ULDE/Web/Component/Form/Template/SignOff.pm \
	blib/lib/ULDE/Web/Component/Form/Template/SignOff.pm \
	lib/ULDE/Web/Service/REST/Client/Response.pm \
	blib/lib/ULDE/Web/Service/REST/Client/Response.pm \
	lib/ULDE/Schema/ULDE/Result/PurchaseTransaction.pm \
	blib/lib/ULDE/Schema/ULDE/Result/PurchaseTransaction.pm \
	lib/ULDE/Web/Controller/Widget/Modal.pm \
	blib/lib/ULDE/Web/Controller/Widget/Modal.pm \
	lib/ULDE/Web/Component/Form/Payment.pm \
	blib/lib/ULDE/Web/Component/Form/Payment.pm \
	lib/ULDE/Schema/ULDE/Result/EventLog.pm \
	blib/lib/ULDE/Schema/ULDE/Result/EventLog.pm \
	lib/ULDE/Web/Model/DB/ULDE.pm.new \
	blib/lib/ULDE/Web/Model/DB/ULDE.pm.new \
	lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/admin_cookie_jar \
	blib/lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/admin_cookie_jar \
	lib/ULDE/Component/ServiceDefinitionUrl.pm \
	blib/lib/ULDE/Component/ServiceDefinitionUrl.pm \
	lib/ULDE/Component/ServiceLevel.pm \
	blib/lib/ULDE/Component/ServiceLevel.pm \
	lib/ULDE/Schema/ULDE/Result/Country.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Country.pm \
	lib/ULDE/Web/Service/REST/Client.pm \
	blib/lib/ULDE/Web/Service/REST/Client.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Product.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Product.pm \
	lib/ULDE/FileStorage/employing staff (732) 13-7-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (732) 13-7-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (674) 10-5-2016.pdf \
	blib/lib/ULDE/FileStorage/debt management & collection (674) 10-5-2016.pdf \
	lib/ULDE/FileStorage/managing staff (601) 23-4-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (601) 23-4-2016.pdf \
	lib/ULDE/FileStorage/probate (754) 16-9-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (754) 16-9-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ForeignAccount.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ForeignAccount.pm \
	lib/ULDE/Web/Component/Form/Account/Update.pm \
	blib/lib/ULDE/Web/Component/Form/Account/Update.pm \
	lib/ULDE/FileStorage/employing staff (592) 22-4-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (592) 22-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/LegalArea.pm \
	blib/lib/ULDE/Schema/ULDE/Result/LegalArea.pm \
	lib/ULDE/FileStorage/sales & marketing (600) 22-4-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (600) 22-4-2016.pdf \
	lib/ULDE/Web/Model/Web/Component/Form/Payment/Basket.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Payment/Basket.pm \
	lib/ULDE/Schema/ULDE/Result/TemplateInstanceFileStorage.pm \
	blib/lib/ULDE/Schema/ULDE/Result/TemplateInstanceFileStorage.pm \
	lib/ULDE/FileStorage/business startup (664) 26-4-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (664) 26-4-2016.pdf \
	lib/ULDE/Web/Controller/Root.pm \
	blib/lib/ULDE/Web/Controller/Root.pm \
	lib/ULDE/Web/Component/Form/._Template.pm \
	blib/lib/ULDE/Web/Component/Form/._Template.pm \
	lib/ULDE/FileStorage/dealing with an estate (663) 25-4-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (663) 25-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/FileStorage.pm \
	blib/lib/ULDE/Schema/ULDE/Result/FileStorage.pm \
	lib/ULDE/FileStorage/managing staff (697) 13-6-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (697) 13-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/RoleCode.pm \
	blib/lib/ULDE/Schema/ULDE/Result/RoleCode.pm \
	lib/ULDE/Web/Service/WebSite/ELE/Response.pm \
	blib/lib/ULDE/Web/Service/WebSite/ELE/Response.pm \
	lib/ULDE/FileStorage/wills (662) 25-4-2016.pdf \
	blib/lib/ULDE/FileStorage/wills (662) 25-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (711) 3-7-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (711) 3-7-2016.pdf \
	lib/ULDE/FileStorage/probate (758) 16-9-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (758) 16-9-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/Product.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Product.pm \
	lib/ULDE/Component/Code.pm \
	blib/lib/ULDE/Component/Code.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Template.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Template.pm \
	lib/ULDE/FileStorage/wills (721) 15-6-2016.pdf \
	blib/lib/ULDE/FileStorage/wills (721) 15-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/Activity.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Activity.pm \
	lib/ULDE/Web/Component/Form/Field/TermsOfUseAndMerchantNotice.pm \
	blib/lib/ULDE/Web/Component/Form/Field/TermsOfUseAndMerchantNotice.pm \
	lib/ULDE/FileStorage/probate (734) 21-6-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (734) 21-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (736) 2-7-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (736) 2-7-2016.pdf \
	lib/ULDE/Component/LegalSubCategory.pm \
	blib/lib/ULDE/Component/LegalSubCategory.pm \
	lib/ULDE/Schema/ULDE/Result/FileFormat.pm \
	blib/lib/ULDE/Schema/ULDE/Result/FileFormat.pm \
	lib/ULDE/Web/Component/Form/Product.pm \
	blib/lib/ULDE/Web/Component/Form/Product.pm \
	lib/ULDE/Component/Associate.pm \
	blib/lib/ULDE/Component/Associate.pm \
	lib/ULDE.pm \
	blib/lib/ULDE.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstance.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductInstance.pm \
	lib/ULDE/Component/Account/Provider.pm \
	blib/lib/ULDE/Component/Account/Provider.pm \
	lib/ULDE/Web/Model/Web/Component/Session.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Session.pm \
	lib/ULDE/FileStorage/sales & marketing (738) 8-7-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (738) 8-7-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (703) 13-6-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (703) 13-6-2016.pdf \
	lib/ULDE/Component/Product/Template_org.pm \
	blib/lib/ULDE/Component/Product/Template_org.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerRole.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ReviewerRole.pm \
	lib/ULDE/Web/Model/DB/ULDE.pm \
	blib/lib/ULDE/Web/Model/DB/ULDE.pm \
	lib/ULDE/FileStorage/managing staff (684) 9-6-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (684) 9-6-2016.pdf \
	lib/ULDE/Web/View/Mason.pm \
	blib/lib/ULDE/Web/View/Mason.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionDiscountVoucher.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinitionDiscountVoucher.pm \
	lib/ULDE/Web/Model/Component/Product/Instance.pm \
	blib/lib/ULDE/Web/Model/Component/Product/Instance.pm \
	lib/ULDE/Schema/ULDE/Result/ProductJurisdiction.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductJurisdiction.pm \
	lib/ULDE/Component/ForeignAccount.pm \
	blib/lib/ULDE/Component/ForeignAccount.pm \
	lib/ULDE/Web/Component/Form/Field/Telephone.pm \
	blib/lib/ULDE/Web/Component/Form/Field/Telephone.pm \
	lib/ULDE/FileStorage/business startup (664) 28-4-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (664) 28-4-2016.pdf \
	lib/ULDE/Component/ServiceDefinition.pm \
	blib/lib/ULDE/Component/ServiceDefinition.pm \
	lib/ULDE/Component/Product/Session.pm \
	blib/lib/ULDE/Component/Product/Session.pm \
	lib/ULDE/FileStorage/dealing with an estate (653) 24-4-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (653) 24-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (733) 21-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (733) 21-6-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (647) 24-4-2016.pdf \
	blib/lib/ULDE/FileStorage/debt management & collection (647) 24-4-2016.pdf \
	lib/ULDE/Web/Component/Form/Account/Register.pm \
	blib/lib/ULDE/Web/Component/Form/Account/Register.pm \
	lib/ULDE/FileStorage/dealing with an estate (710) 3-7-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (710) 3-7-2016.pdf \
	lib/ULDE/Component.pm \
	blib/lib/ULDE/Component.pm \
	lib/ULDE/FileStorage/probate (685) 9-6-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (685) 9-6-2016.pdf \
	lib/ULDE/Interface/DocumentAssembler.pm \
	blib/lib/ULDE/Interface/DocumentAssembler.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Account/Register.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Account/Register.pm \
	lib/ULDE/FileStorage/sales & marketing (585) 19-4-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (585) 19-4-2016.pdf \
	lib/ULDE/FileStorage/probate (747) 19-7-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (747) 19-7-2016.pdf \
	lib/ULDE/Web/Model/Web/Component/Form/Account/Update.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Account/Update.pm \
	lib/ULDE/Web/Component/Form/Login.pm \
	blib/lib/ULDE/Web/Component/Form/Login.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityAssociate.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityAssociate.pm \
	lib/ULDE/FileStorage/employing staff (670) 29-4-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (670) 29-4-2016.pdf \
	lib/ULDE/FileStorage/wills (661) 25-4-2016.pdf \
	blib/lib/ULDE/FileStorage/wills (661) 25-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/CategorySubCategoryRelation.pm \
	blib/lib/ULDE/Schema/ULDE/Result/CategorySubCategoryRelation.pm \
	lib/ULDE/Component/Provider.pm \
	blib/lib/ULDE/Component/Provider.pm \
	lib/ULDE/FileStorage/powers of attorney (715) 14-6-2016.pdf \
	blib/lib/ULDE/FileStorage/powers of attorney (715) 14-6-2016.pdf \
	lib/ULDE/FileStorage/changing a will (716) 14-6-2016.pdf \
	blib/lib/ULDE/FileStorage/changing a will (716) 14-6-2016.pdf \
	lib/ULDE/Web/Model/Component/Account/Customer.pm \
	blib/lib/ULDE/Web/Model/Component/Account/Customer.pm \
	lib/ULDE/FileStorage/sales & marketing (714) 14-6-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (714) 14-6-2016.pdf \
	lib/ULDE/Component/ReviewServiceResponsibility/Reviewer.pm \
	blib/lib/ULDE/Component/ReviewServiceResponsibility/Reviewer.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityCode.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityCode.pm \
	lib/ULDE/Schema/ULDE/Result/Reviewer.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Reviewer.pm \
	lib/ULDE/Component/Reviewer.pm \
	blib/lib/ULDE/Component/Reviewer.pm \
	lib/ULDE/Web/Service/REST/Client/Serializer.pm \
	blib/lib/ULDE/Web/Service/REST/Client/Serializer.pm \
	lib/ULDE/FileStorage/employing staff (669) 28-4-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (669) 28-4-2016.pdf \
	lib/ULDE/FileStorage/probate (755) 16-9-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (755) 16-9-2016.pdf \
	lib/ULDE/Component/Activity.pm \
	blib/lib/ULDE/Component/Activity.pm \
	lib/ULDE/Utilities.pm \
	blib/lib/ULDE/Utilities.pm \
	lib/ULDE/Schema/ULDE/Result/LegalSubCategory.pm \
	blib/lib/ULDE/Schema/ULDE/Result/LegalSubCategory.pm \
	lib/ULDE/FileStorage/managing staff (709) 14-6-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (709) 14-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/CustomerRole.pm \
	blib/lib/ULDE/Schema/ULDE/Result/CustomerRole.pm \
	lib/ULDE/Web/Component/Form/Field/Postcode.pm \
	blib/lib/ULDE/Web/Component/Form/Field/Postcode.pm \
	lib/ULDE/Web/Model/Component/Product.pm \
	blib/lib/ULDE/Web/Model/Component/Product.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerResponsibility.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ReviewerResponsibility.pm \
	lib/ULDE/Component/Country.pm \
	blib/lib/ULDE/Component/Country.pm \
	lib/ULDE/FileStorage/dealing with an estate (740) 9-7-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (740) 9-7-2016.pdf \
	lib/ULDE/FileStorage/business startup (679) 15-6-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (679) 15-6-2016.pdf \
	lib/ULDE/Web/Model/Web/Component/Form/Account.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Account.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignAccountDetail.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ForeignAccountDetail.pm \
	lib/ULDE/FileStorage/wills (724) 17-6-2016.pdf \
	blib/lib/ULDE/FileStorage/wills (724) 17-6-2016.pdf \
	lib/ULDE/FileStorage/probate (749) 1-8-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (749) 1-8-2016.pdf \
	lib/ULDE/Web/Model/Component/Template/Instance.pm \
	blib/lib/ULDE/Web/Model/Component/Template/Instance.pm \
	lib/ULDE/FileStorage/business startup (678) 19-5-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (678) 19-5-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (710) 10-7-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (710) 10-7-2016.pdf \
	lib/ULDE/FileStorage/probate (695) 10-6-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (695) 10-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ProductServiceLevel.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductServiceLevel.pm \
	lib/ULDE/Component/Product/ServiceDefinition.pm \
	blib/lib/ULDE/Component/Product/ServiceDefinition.pm \
	lib/ULDE/FileStorage/employee discipline & grievances (677) 13-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employee discipline & grievances (677) 13-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ActivityTemplateInstance.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ActivityTemplateInstance.pm \
	lib/ULDE/Web/Component/Session.pm \
	blib/lib/ULDE/Web/Component/Session.pm \
	lib/ULDE/Schema/ULDE/Result/TemplateInstance.pm \
	blib/lib/ULDE/Schema/ULDE/Result/TemplateInstance.pm \
	lib/ULDE/FileStorage/employee discipline & grievances (693) 10-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employee discipline & grievances (693) 10-6-2016.pdf \
	lib/ULDE/Web/Model/Component/FileStorage.pm \
	blib/lib/ULDE/Web/Model/Component/FileStorage.pm \
	lib/ULDE/FileStorage/employing staff (689) 9-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (689) 9-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/Role.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Role.pm \
	lib/ULDE/Web/Component/Form.pm \
	blib/lib/ULDE/Web/Component/Form.pm \
	lib/ULDE/Web/Controller/Product.pm \
	blib/lib/ULDE/Web/Controller/Product.pm \
	lib/ULDE/FileStorage/managing staff (750) 19-8-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (750) 19-8-2016.pdf \
	lib/ULDE/FileStorage/business startup (594) 22-4-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (594) 22-4-2016.pdf \
	lib/ULDE/Web/Controller/Admin/Root.pm \
	blib/lib/ULDE/Web/Controller/Admin/Root.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstancePurchaseTransaction.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductInstancePurchaseTransaction.pm \
	lib/ULDE/FileStorage/employing staff (725) 15-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (725) 15-6-2016.pdf \
	lib/ULDE/Component/Template/Instance.pm \
	blib/lib/ULDE/Component/Template/Instance.pm \
	lib/ULDE/Web/Service/WebSite/bin/refresh_session_cookies.pl \
	blib/lib/ULDE/Web/Service/WebSite/bin/refresh_session_cookies.pl \
	lib/ULDE/Web/Model/Web/Component/Form/Product/MainCategory.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Product/MainCategory.pm \
	lib/ULDE/Component/LegalArea.pm \
	blib/lib/ULDE/Component/LegalArea.pm \
	lib/ULDE/Schema/ULDE/Result/Code.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Code.pm \
	lib/ULDE/Web/Component/Form/Field/ContactDetails.pm \
	blib/lib/ULDE/Web/Component/Form/Field/ContactDetails.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Template/Rename.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Template/Rename.pm \
	lib/ULDE/Web/Component/Form/Account.pm \
	blib/lib/ULDE/Web/Component/Form/Account.pm \
	lib/ULDE/Component/Account.pm \
	blib/lib/ULDE/Component/Account.pm \
	lib/ULDE/FileStorage/debt management & collection (657) 25-4-2016.pdf \
	blib/lib/ULDE/FileStorage/debt management & collection (657) 25-4-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (652) 24-4-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (652) 24-4-2016.pdf \
	lib/ULDE/Web/Model/Component/DiscountVoucher.pm \
	blib/lib/ULDE/Web/Model/Component/DiscountVoucher.pm \
	lib/ULDE/Component/DocumentAssemblyProvider.pm \
	blib/lib/ULDE/Component/DocumentAssemblyProvider.pm \
	lib/ULDE/FileStorage/dealing with an estate (651) 24-4-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (651) 24-4-2016.pdf \
	lib/ULDE/Web/Controller/Session/Authentication.pm \
	blib/lib/ULDE/Web/Controller/Session/Authentication.pm \
	lib/ULDE/FileStorage/employing staff (725) 17-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (725) 17-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ProductInstanceAssociate.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductInstanceAssociate.pm \
	lib/ULDE/Component/ServiceLevel/Product_org.pm \
	blib/lib/ULDE/Component/ServiceLevel/Product_org.pm \
	lib/ULDE/Web/Controller/DocumentProduction.pm \
	blib/lib/ULDE/Web/Controller/DocumentProduction.pm \
	lib/ULDE/Interface.pm \
	blib/lib/ULDE/Interface.pm \
	lib/ULDE/FileStorage/powers of attorney (687) 9-6-2016.pdf \
	blib/lib/ULDE/FileStorage/powers of attorney (687) 9-6-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (675) 15-6-2016.pdf \
	blib/lib/ULDE/FileStorage/debt management & collection (675) 15-6-2016.pdf \
	lib/ULDE/Web/Component/Form/Reviewer.pm \
	blib/lib/ULDE/Web/Component/Form/Reviewer.pm \
	lib/ULDE/Web/Model/Component/Customer.pm \
	blib/lib/ULDE/Web/Model/Component/Customer.pm \
	lib/ULDE/Schema/ULDE/Result/ShoppingBasket.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ShoppingBasket.pm \
	lib/ULDE/FileStorage/employing staff (666) 28-4-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (666) 28-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/AssociateDiscountVoucher.pm \
	blib/lib/ULDE/Schema/ULDE/Result/AssociateDiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionAssociate.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinitionAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerAddress.pm \
	blib/lib/ULDE/Schema/ULDE/Result/CustomerAddress.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentAssemblyProvider.pm \
	blib/lib/ULDE/Schema/ULDE/Result/DocumentAssemblyProvider.pm \
	lib/ULDE/Component/Product/ServiceDefinition_org.pm \
	blib/lib/ULDE/Component/Product/ServiceDefinition_org.pm \
	lib/ULDE/FileStorage/sales & marketing (701) 13-6-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (701) 13-6-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (746) 18-7-2016.pdf \
	blib/lib/ULDE/FileStorage/debt management & collection (746) 18-7-2016.pdf \
	lib/ULDE/Component/Communication.pm \
	blib/lib/ULDE/Component/Communication.pm \
	lib/ULDE/FileStorage/sales & marketing (601) 23-4-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (601) 23-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionUrl.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinitionUrl.pm \
	lib/ULDE/Component/FileStorage.pm \
	blib/lib/ULDE/Component/FileStorage.pm \
	lib/ULDE/Schema/ULDE/Result/Provider.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Provider.pm \
	lib/ULDE/Component/Template/Product_org.pm \
	blib/lib/ULDE/Component/Template/Product_org.pm \
	lib/ULDE/Web/Model/Interface/DocumentAssembler.pm \
	blib/lib/ULDE/Web/Model/Interface/DocumentAssembler.pm \
	lib/ULDE/Component/ReviewServiceResponsibility/._Code.pm \
	blib/lib/ULDE/Component/ReviewServiceResponsibility/._Code.pm \
	lib/ULDE/Web/View/Mason2.pm \
	blib/lib/ULDE/Web/View/Mason2.pm \
	lib/ULDE/FileStorage/business startup (707) 15-6-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (707) 15-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (712) 14-6-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (712) 14-6-2016.pdf \
	lib/ULDE/Web/Model/Web/Component/Form/Account/RegisterByAdmin.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Account/RegisterByAdmin.pm \
	lib/ULDE/Schema/ULDE/Result/ProductDocumentTemplate.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductDocumentTemplate.pm \
	lib/ULDE/FileStorage/employing staff (723) 15-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (723) 15-6-2016.pdf \
	lib/ULDE/Web/Component/Form/Field/CardDetails.pm \
	blib/lib/ULDE/Web/Component/Form/Field/CardDetails.pm \
	lib/ULDE/Schema/ULDE/Result/Jurisdiction.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Jurisdiction.pm \
	lib/ULDE/FileStorage/employee discipline & grievances (708) 14-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employee discipline & grievances (708) 14-6-2016.pdf \
	lib/ULDE/Web/Component/Form/Field/Country.pm \
	blib/lib/ULDE/Web/Component/Form/Field/Country.pm \
	lib/ULDE/Component/Session.pm \
	blib/lib/ULDE/Component/Session.pm \
	lib/ULDE/FileStorage/debt management & collection (650) 24-4-2016.pdf \
	blib/lib/ULDE/FileStorage/debt management & collection (650) 24-4-2016.pdf \
	lib/ULDE/FileStorage/employing staff (690) 10-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (690) 10-6-2016.pdf \
	lib/ULDE/Web/Component/Form/Field/Customer.pm \
	blib/lib/ULDE/Web/Component/Form/Field/Customer.pm \
	lib/ULDE/Component/Product.pm \
	blib/lib/ULDE/Component/Product.pm \
	lib/ULDE/FileStorage/managing staff (735) 26-6-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (735) 26-6-2016.pdf \
	lib/ULDE/FileStorage/probate (759) 16-9-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (759) 16-9-2016.pdf \
	lib/ULDE/FileStorage/probate (752) 16-9-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (752) 16-9-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/Communication.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Communication.pm \
	lib/ULDE/Schema/ULDE/Result/Customer.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Customer.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionLegalArea.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinitionLegalArea.pm \
	lib/ULDE/FileStorage/managing staff (742) 10-7-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (742) 10-7-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (713) 14-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employee discipline & grievances (713) 14-6-2016.pdf \
	lib/ULDE/Web/Service/SOAP/Ineus.pm \
	blib/lib/ULDE/Web/Service/SOAP/Ineus.pm \
	lib/ULDE/FileStorage/employee discipline & grievances (683) 9-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employee discipline & grievances (683) 9-6-2016.pdf \
	lib/ULDE/Web/Service/SOAP/Server/Ineus.pm \
	blib/lib/ULDE/Web/Service/SOAP/Server/Ineus.pm \
	lib/ULDE/Component/Product/Instance.pm \
	blib/lib/ULDE/Component/Product/Instance.pm \
	lib/ULDE/Web/Model/Component/ServiceDefinition.pm \
	blib/lib/ULDE/Web/Model/Component/ServiceDefinition.pm \
	lib/ULDE/FileStorage/powers of attorney (717) 15-6-2016.pdf \
	blib/lib/ULDE/FileStorage/powers of attorney (717) 15-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (706) 13-6-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (706) 13-6-2016.pdf \
	lib/ULDE/Component/Account/Customer.pm \
	blib/lib/ULDE/Component/Account/Customer.pm \
	lib/ULDE/FileStorage/probate (649) 24-4-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (649) 24-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/Address.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Address.pm \
	lib/ULDE/Component/Jurisdiction.pm \
	blib/lib/ULDE/Component/Jurisdiction.pm \
	lib/ULDE/Web/Controller/HelpCentre.pm \
	blib/lib/ULDE/Web/Controller/HelpCentre.pm \
	lib/ULDE/FileStorage/sales & marketing (696) 13-6-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (696) 13-6-2016.pdf \
	lib/ULDE/Web/Component/Form/Template/._Rename.pm \
	blib/lib/ULDE/Web/Component/Form/Template/._Rename.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewService.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ReviewService.pm \
	lib/ULDE/Web/Service/REST/ELE.pm \
	blib/lib/ULDE/Web/Service/REST/ELE.pm \
	lib/ULDE/FileStorage/employing staff (725) 20-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (725) 20-6-2016.pdf \
	lib/ULDE/FileStorage/probate (756) 16-9-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (756) 16-9-2016.pdf \
	lib/ULDE/Component/ForeignProvider.pm \
	blib/lib/ULDE/Component/ForeignProvider.pm \
	lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/ragnar@signal.bz - bbggttrr \
	blib/lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/ragnar@signal.bz - bbggttrr \
	lib/ULDE/Schema/ULDE/Result/ProductDiscount.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductDiscount.pm \
	lib/ULDE/FileStorage/powers of attorney (665) 27-4-2016.pdf \
	blib/lib/ULDE/FileStorage/powers of attorney (665) 27-4-2016.pdf \
	lib/ULDE/Web/Controller/Account.pm \
	blib/lib/ULDE/Web/Controller/Account.pm \
	lib/ULDE/FileStorage/managing staff (599) 22-4-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (599) 22-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ReviewerCustomer.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ReviewerCustomer.pm \
	lib/ULDE/Web/Component/Form/Payment/Basket.pm \
	blib/lib/ULDE/Web/Component/Form/Payment/Basket.pm \
	lib/ULDE/Web/Model/Component/Reviewer.pm \
	blib/lib/ULDE/Web/Model/Component/Reviewer.pm \
	lib/ULDE/Web/Component/Form/Product/MainCategory.pm \
	blib/lib/ULDE/Web/Component/Form/Product/MainCategory.pm \
	lib/ULDE/Component/Product/Template.pm \
	blib/lib/ULDE/Component/Product/Template.pm \
	lib/ULDE/FileStorage/employing staff (763) 29-9-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (763) 29-9-2016.pdf \
	lib/ULDE/FileStorage/dealing with an estate (698) 14-6-2016.pdf \
	blib/lib/ULDE/FileStorage/dealing with an estate (698) 14-6-2016.pdf \
	lib/ULDE/Web/Component/Form/Product/._MainCategory.pm \
	blib/lib/ULDE/Web/Component/Form/Product/._MainCategory.pm \
	lib/ULDE/FileStorage/employing staff (691) 10-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (691) 10-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplateVersion.pm \
	blib/lib/ULDE/Schema/ULDE/Result/DocumentTemplateVersion.pm \
	lib/ULDE/FileStorage/employee discipline & grievances (586) 19-4-2016.pdf \
	blib/lib/ULDE/FileStorage/employee discipline & grievances (586) 19-4-2016.pdf \
	lib/ULDE/FileStorage/managing staff (646) 24-4-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (646) 24-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/DiscountVoucher.pm \
	blib/lib/ULDE/Schema/ULDE/Result/DiscountVoucher.pm \
	lib/ULDE/Component/ServiceLevel/Product.pm \
	blib/lib/ULDE/Component/ServiceLevel/Product.pm \
	lib/ULDE/Web/Component/Form/Field/Mobile.pm \
	blib/lib/ULDE/Web/Component/Form/Field/Mobile.pm \
	lib/ULDE/FileStorage/business startup (664) 27-4-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (664) 27-4-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/Message.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Message.pm \
	lib/ULDE/Schema/ULDE/Result/ProductFeeDiscount.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductFeeDiscount.pm \
	lib/ULDE/FileStorage/probate (753) 16-9-2016.pdf \
	blib/lib/ULDE/FileStorage/probate (753) 16-9-2016.pdf \
	lib/ULDE/Web/Model/Web/Component/Form/Login.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Login.pm \
	lib/ULDE/Web/Controller/API/REST.pm \
	blib/lib/ULDE/Web/Controller/API/REST.pm \
	lib/ULDE/FileStorage/business startup (680) 15-6-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (680) 15-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/Associate.pm \
	blib/lib/ULDE/Schema/ULDE/Result/Associate.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerAccount.pm \
	blib/lib/ULDE/Schema/ULDE/Result/CustomerAccount.pm \
	lib/ULDE/FileStorage/sales & marketing (660) 25-4-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (660) 25-4-2016.pdf \
	lib/ULDE/FileStorage/managing staff (673) 9-5-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (673) 9-5-2016.pdf \
	lib/ULDE/Component/Message.pm \
	blib/lib/ULDE/Component/Message.pm \
	lib/ULDE/Schema/ULDE/Result/EleServiceOption.pm \
	blib/lib/ULDE/Schema/ULDE/Result/EleServiceOption.pm \
	lib/ULDE/Web/Service/WebSite/ELE.pm \
	blib/lib/ULDE/Web/Service/WebSite/ELE.pm \
	lib/ULDE/Component/ReviewServiceResponsibility/Code.pm \
	blib/lib/ULDE/Component/ReviewServiceResponsibility/Code.pm \
	lib/ULDE/Web/Model/Component/Code.pm \
	blib/lib/ULDE/Web/Model/Component/Code.pm \
	lib/ULDE/Schema/ULDE/Result/LegalCategory.pm \
	blib/lib/ULDE/Schema/ULDE/Result/LegalCategory.pm \
	lib/ULDE/Web/View/JSON.pm \
	blib/lib/ULDE/Web/View/JSON.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Template/SignOff.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Template/SignOff.pm \
	lib/ULDE/Web.pm \
	blib/lib/ULDE/Web.pm \
	lib/ULDE/FileStorage/employing staff (725) 16-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (725) 16-6-2016.pdf \
	lib/ULDE/FileStorage/employee discipline & grievances (692) 10-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employee discipline & grievances (692) 10-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ProductServiceDefinition.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ProductServiceDefinition.pm \
	lib/ULDE/Schema/ULDE/Result/UldeSubCategory.pm \
	blib/lib/ULDE/Schema/ULDE/Result/UldeSubCategory.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplate.pm \
	blib/lib/ULDE/Schema/ULDE/Result/DocumentTemplate.pm \
	lib/ULDE/Component/ReviewServiceResponsibility/._Reviewer.pm \
	blib/lib/ULDE/Component/ReviewServiceResponsibility/._Reviewer.pm \
	lib/ULDE/FileStorage/employee discipline & grievances (741) 9-7-2016.pdf \
	blib/lib/ULDE/FileStorage/employee discipline & grievances (741) 9-7-2016.pdf \
	lib/ULDE/Config.pm \
	blib/lib/ULDE/Config.pm \
	lib/ULDE/Schema/ULDE/Result/HttpSession.pm \
	blib/lib/ULDE/Schema/ULDE/Result/HttpSession.pm \
	lib/ULDE/Schema/ULDE/Result/HttpSessionProduct.pm \
	blib/lib/ULDE/Schema/ULDE/Result/HttpSessionProduct.pm \
	lib/ULDE/Component/DiscountVoucher.pm \
	blib/lib/ULDE/Component/DiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityProductInstance.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ActivityProductInstance.pm \
	lib/ULDE/Component/ReviewServiceResponsibility.pm \
	blib/lib/ULDE/Component/ReviewServiceResponsibility.pm \
	lib/ULDE/FileStorage/sales & marketing (584) 19-4-2016.pdf \
	blib/lib/ULDE/FileStorage/sales & marketing (584) 19-4-2016.pdf \
	lib/ULDE/FileStorage/debt management & collection (751) 16-9-2016.pdf \
	blib/lib/ULDE/FileStorage/debt management & collection (751) 16-9-2016.pdf \
	lib/ULDE/FileStorage/employing staff (730) 20-6-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (730) 20-6-2016.pdf \
	lib/ULDE/Schema/ULDE/Result/ActivityCode.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ActivityCode.pm \
	lib/ULDE/Component/LegalCategory.pm \
	blib/lib/ULDE/Component/LegalCategory.pm \
	lib/ULDE/Component/Customer.pm \
	blib/lib/ULDE/Component/Customer.pm \
	lib/ULDE/FileStorage/._debt management & collection (484) 4-8-2015.pdf \
	blib/lib/ULDE/FileStorage/._debt management & collection (484) 4-8-2015.pdf \
	lib/ULDE/FileStorage/debt management & collection (484) 4-8-2015.pdf \
	blib/lib/ULDE/FileStorage/debt management & collection (484) 4-8-2015.pdf \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibility.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibility.pm \
	lib/ULDE/Component/Referrer.pm \
	blib/lib/ULDE/Component/Referrer.pm \
	lib/ULDE/Web/Model/Web/Component/Form/Reviewer.pm \
	blib/lib/ULDE/Web/Model/Web/Component/Form/Reviewer.pm \
	lib/ULDE/Web/Component/Form/Template/Rename.pm \
	blib/lib/ULDE/Web/Component/Form/Template/Rename.pm \
	lib/ULDE/Component/Address.pm \
	blib/lib/ULDE/Component/Address.pm \
	lib/ULDE/Web/Component/Form/Template.pm \
	blib/lib/ULDE/Web/Component/Form/Template.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewAccountability.pm \
	blib/lib/ULDE/Schema/ULDE/Result/ReviewAccountability.pm \
	lib/ULDE/Schema/ULDE/Result/StatusCode.pm \
	blib/lib/ULDE/Schema/ULDE/Result/StatusCode.pm \
	lib/ULDE/Component/PurchaseTransaction.pm \
	blib/lib/ULDE/Component/PurchaseTransaction.pm \
	lib/ULDE/FileStorage/business startup (726) 20-6-2016.pdf \
	blib/lib/ULDE/FileStorage/business startup (726) 20-6-2016.pdf \
	lib/ULDE/FileStorage/managing staff (748) 25-7-2016.pdf \
	blib/lib/ULDE/FileStorage/managing staff (748) 25-7-2016.pdf \
	lib/ULDE/FileStorage/employing staff (593) 22-4-2016.pdf \
	blib/lib/ULDE/FileStorage/employing staff (593) 22-4-2016.pdf


# --- MakeMaker platform_constants section:
MM_Unix_VERSION = 6.68
PERL_MALLOC_DEF = -DPERL_EXTMALLOC_DEF -Dmalloc=Perl_malloc -Dfree=Perl_mfree -Drealloc=Perl_realloc -Dcalloc=Perl_calloc


# --- MakeMaker tool_autosplit section:
# Usage: $(AUTOSPLITFILE) FileToSplit AutoDirToSplitInto
AUTOSPLITFILE = $(ABSPERLRUN)  -e 'use AutoSplit;  autosplit($$$$ARGV[0], $$$$ARGV[1], 0, 1, 1)' --



# --- MakeMaker tool_xsubpp section:


# --- MakeMaker tools_other section:
SHELL = /bin/sh
CHMOD = chmod
CP = cp
MV = mv
NOOP = $(TRUE)
NOECHO = @
RM_F = rm -f
RM_RF = rm -rf
TEST_F = test -f
TOUCH = touch
UMASK_NULL = umask 0
DEV_NULL = > /dev/null 2>&1
MKPATH = $(ABSPERLRUN) -MExtUtils::Command -e 'mkpath' --
EQUALIZE_TIMESTAMP = $(ABSPERLRUN) -MExtUtils::Command -e 'eqtime' --
FALSE = false
TRUE = true
ECHO = echo
ECHO_N = echo -n
UNINST = 0
VERBINST = 0
MOD_INSTALL = $(ABSPERLRUN) -MExtUtils::Install -e 'install([ from_to => {@ARGV}, verbose => '\''$(VERBINST)'\'', uninstall_shadows => '\''$(UNINST)'\'', dir_mode => '\''$(PERM_DIR)'\'' ]);' --
DOC_INSTALL = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'perllocal_install' --
UNINSTALL = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'uninstall' --
WARN_IF_OLD_PACKLIST = $(ABSPERLRUN) -MExtUtils::Command::MM -e 'warn_if_old_packlist' --
MACROSTART = 
MACROEND = 
USEMAKEFILE = -f
FIXIN = $(ABSPERLRUN) -MExtUtils::MY -e 'MY->fixin(shift)' --


# --- MakeMaker makemakerdflt section:
makemakerdflt : all
	$(NOECHO) $(NOOP)


# --- MakeMaker dist section:
TAR = tar
TARFLAGS = cvf
ZIP = zip
ZIPFLAGS = -r
COMPRESS = gzip --best
SUFFIX = .gz
SHAR = shar
PREOP = $(PERL) -I. "-MModule::Install::Admin" -e "dist_preop(q($(DISTVNAME)))"
POSTOP = $(NOECHO) $(NOOP)
TO_UNIX = $(NOECHO) $(NOOP)
CI = ci -u
RCS_LABEL = rcs -Nv$(VERSION_SYM): -q
DIST_CP = best
DIST_DEFAULT = tardist
DISTNAME = ULDE
DISTVNAME = ULDE-0.01


# --- MakeMaker macro section:


# --- MakeMaker depend section:


# --- MakeMaker cflags section:


# --- MakeMaker const_loadlibs section:


# --- MakeMaker const_cccmd section:


# --- MakeMaker post_constants section:


# --- MakeMaker pasthru section:

PASTHRU = LIBPERL_A="$(LIBPERL_A)"\
	LINKTYPE="$(LINKTYPE)"\
	PREFIX="$(PREFIX)"


# --- MakeMaker special_targets section:
.SUFFIXES : .xs .c .C .cpp .i .s .cxx .cc $(OBJ_EXT)

.PHONY: all config static dynamic test linkext manifest blibdirs clean realclean disttest distdir



# --- MakeMaker c_o section:


# --- MakeMaker xs_c section:


# --- MakeMaker xs_o section:


# --- MakeMaker top_targets section:
all :: pure_all manifypods
	$(NOECHO) $(NOOP)


pure_all :: config pm_to_blib subdirs linkext
	$(NOECHO) $(NOOP)

subdirs :: $(MYEXTLIB)
	$(NOECHO) $(NOOP)

config :: $(FIRST_MAKEFILE) blibdirs
	$(NOECHO) $(NOOP)

help :
	perldoc ExtUtils::MakeMaker


# --- MakeMaker blibdirs section:
blibdirs : $(INST_LIBDIR)$(DFSEP).exists $(INST_ARCHLIB)$(DFSEP).exists $(INST_AUTODIR)$(DFSEP).exists $(INST_ARCHAUTODIR)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists $(INST_SCRIPT)$(DFSEP).exists $(INST_MAN1DIR)$(DFSEP).exists $(INST_MAN3DIR)$(DFSEP).exists
	$(NOECHO) $(NOOP)

# Backwards compat with 6.18 through 6.25
blibdirs.ts : blibdirs
	$(NOECHO) $(NOOP)

$(INST_LIBDIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_LIBDIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_LIBDIR)
	$(NOECHO) $(TOUCH) $(INST_LIBDIR)$(DFSEP).exists

$(INST_ARCHLIB)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHLIB)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_ARCHLIB)
	$(NOECHO) $(TOUCH) $(INST_ARCHLIB)$(DFSEP).exists

$(INST_AUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_AUTODIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_AUTODIR)
	$(NOECHO) $(TOUCH) $(INST_AUTODIR)$(DFSEP).exists

$(INST_ARCHAUTODIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_ARCHAUTODIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_ARCHAUTODIR)
	$(NOECHO) $(TOUCH) $(INST_ARCHAUTODIR)$(DFSEP).exists

$(INST_BIN)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_BIN)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_BIN)
	$(NOECHO) $(TOUCH) $(INST_BIN)$(DFSEP).exists

$(INST_SCRIPT)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_SCRIPT)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_SCRIPT)
	$(NOECHO) $(TOUCH) $(INST_SCRIPT)$(DFSEP).exists

$(INST_MAN1DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN1DIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_MAN1DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN1DIR)$(DFSEP).exists

$(INST_MAN3DIR)$(DFSEP).exists :: Makefile.PL
	$(NOECHO) $(MKPATH) $(INST_MAN3DIR)
	$(NOECHO) $(CHMOD) $(PERM_DIR) $(INST_MAN3DIR)
	$(NOECHO) $(TOUCH) $(INST_MAN3DIR)$(DFSEP).exists



# --- MakeMaker linkext section:

linkext :: $(LINKTYPE)
	$(NOECHO) $(NOOP)


# --- MakeMaker dlsyms section:


# --- MakeMaker dynamic section:

dynamic :: $(FIRST_MAKEFILE) $(INST_DYNAMIC) $(INST_BOOT)
	$(NOECHO) $(NOOP)


# --- MakeMaker dynamic_bs section:

BOOTSTRAP =


# --- MakeMaker dynamic_lib section:


# --- MakeMaker static section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make static"
static :: $(FIRST_MAKEFILE) $(INST_STATIC)
	$(NOECHO) $(NOOP)


# --- MakeMaker static_lib section:


# --- MakeMaker manifypods section:

POD2MAN_EXE = $(PERLRUN) "-MExtUtils::Command::MM" -e pod2man "--"
POD2MAN = $(POD2MAN_EXE)


manifypods : pure_all  \
	script/ulde_web_fastcgi.pl \
	script/ulde_web_create.pl \
	script/ulde_web_server.pl \
	script/ulde_web_cgi.pl \
	script/ulde_web_test.pl \
	lib/ULDE/Schema/ULDE/Result/ProductJurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignProvider.pm \
	lib/ULDE/Web/Controller/Session/Management.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplateJurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/Code.pm \
	lib/ULDE/Schema/ULDE/Result/Address.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceLevel.pm \
	lib/ULDE/Schema/ULDE/Result/EventCode.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinition.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewService.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/PurchaseTransaction.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstanceAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/EventLog.pm \
	lib/ULDE/Schema/ULDE/Result/ProductDiscount.pm \
	lib/ULDE/Schema/ULDE/Result/CategorySubCategoryRelation.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerCustomer.pm \
	lib/ULDE/Schema/ULDE/Result/ShoppingBasket.pm \
	lib/ULDE/Schema/ULDE/Result/Country.pm \
	lib/ULDE/Schema/ULDE/Result/AssociateDiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplateVersion.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionAssociate.pm \
	lib/ULDE/Schema/ULDE/Result/DiscountVoucher.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerAddress.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityCode.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentAssemblyProvider.pm \
	lib/ULDE/Schema/ULDE/Result/Reviewer.pm \
	lib/ULDE/Schema/ULDE/Result/ProductFeeDiscount.pm \
	lib/ULDE/Schema/ULDE/Result/Message.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignAccount.pm \
	lib/ULDE/Schema/ULDE/Result/Associate.pm \
	lib/ULDE/Schema/ULDE/Result/LegalSubCategory.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerAccount.pm \
	lib/ULDE/Schema/ULDE/Result/LegalArea.pm \
	lib/ULDE/Schema/ULDE/Result/CustomerRole.pm \
	lib/ULDE/Schema/ULDE/Result/TemplateInstanceFileStorage.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerResponsibility.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionUrl.pm \
	lib/ULDE/Schema/ULDE/Result/EleServiceOption.pm \
	lib/ULDE/Schema/ULDE/Result/Provider.pm \
	lib/ULDE/Schema/ULDE/Result/FileStorage.pm \
	lib/ULDE/Schema/ULDE/Result/RoleCode.pm \
	lib/ULDE/Schema/ULDE/Result/LegalCategory.pm \
	lib/ULDE/Schema/ULDE/Result/ForeignAccountDetail.pm \
	lib/ULDE/Web/View/JSON.pm \
	lib/ULDE/Schema/ULDE/Result/Product.pm \
	lib/ULDE/Web.pm \
	lib/ULDE/Schema/ULDE/Result/ProductServiceDefinition.pm \
	lib/ULDE/Schema/ULDE/Result/DocumentTemplate.pm \
	lib/ULDE/Schema/ULDE/Result/UldeSubCategory.pm \
	lib/ULDE/Schema/ULDE/Result/ProductDocumentTemplate.pm \
	lib/ULDE/Schema/ULDE/Result/Activity.pm \
	lib/ULDE/Schema/ULDE/Result/ProductServiceLevel.pm \
	lib/ULDE/Schema/ULDE/Result/Jurisdiction.pm \
	lib/ULDE/Schema/ULDE/Result/HttpSessionProduct.pm \
	lib/ULDE/Schema/ULDE/Result/HttpSession.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityProductInstance.pm \
	lib/ULDE/Schema/ULDE/Result/FileFormat.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityTemplateInstance.pm \
	lib/ULDE/Schema/ULDE/Result/TemplateInstance.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstance.pm \
	lib/ULDE/Schema/ULDE/Result/ActivityCode.pm \
	lib/ULDE/Schema/ULDE/Result/Role.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibility.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewerRole.pm \
	lib/ULDE/Web/Model/DB/ULDE.pm \
	lib/ULDE/Schema/ULDE/Result/Communication.pm \
	lib/ULDE/Schema/ULDE/Result/ProductInstancePurchaseTransaction.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionLegalArea.pm \
	lib/ULDE/Schema/ULDE/Result/Customer.pm \
	lib/ULDE/Schema/ULDE/Result/ReviewAccountability.pm \
	lib/ULDE/Schema/ULDE/Result/StatusCode.pm \
	lib/ULDE/Schema/ULDE/Result/ServiceDefinitionDiscountVoucher.pm
	$(NOECHO) $(POD2MAN) --section=1 --perm_rw=$(PERM_RW) \
	  script/ulde_web_fastcgi.pl $(INST_MAN1DIR)/ulde_web_fastcgi.pl.$(MAN1EXT) \
	  script/ulde_web_create.pl $(INST_MAN1DIR)/ulde_web_create.pl.$(MAN1EXT) \
	  script/ulde_web_server.pl $(INST_MAN1DIR)/ulde_web_server.pl.$(MAN1EXT) \
	  script/ulde_web_cgi.pl $(INST_MAN1DIR)/ulde_web_cgi.pl.$(MAN1EXT) \
	  script/ulde_web_test.pl $(INST_MAN1DIR)/ulde_web_test.pl.$(MAN1EXT) 
	$(NOECHO) $(POD2MAN) --section=3 --perm_rw=$(PERM_RW) \
	  lib/ULDE/Schema/ULDE/Result/ProductJurisdiction.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductJurisdiction.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ForeignProvider.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ForeignProvider.$(MAN3EXT) \
	  lib/ULDE/Web/Controller/Session/Management.pm $(INST_MAN3DIR)/ULDE::Web::Controller::Session::Management.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/DocumentTemplateJurisdiction.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::DocumentTemplateJurisdiction.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Code.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Code.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Address.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Address.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ServiceLevel.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ServiceLevel.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/EventCode.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::EventCode.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinition.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ServiceDefinition.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ReviewService.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ReviewService.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityAssociate.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityAssociate.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/PurchaseTransaction.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::PurchaseTransaction.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ProductInstanceAssociate.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductInstanceAssociate.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/EventLog.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::EventLog.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ProductDiscount.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductDiscount.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/CategorySubCategoryRelation.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::CategorySubCategoryRelation.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ReviewerCustomer.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ReviewerCustomer.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ShoppingBasket.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ShoppingBasket.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Country.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Country.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/AssociateDiscountVoucher.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::AssociateDiscountVoucher.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/DocumentTemplateVersion.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::DocumentTemplateVersion.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinitionAssociate.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ServiceDefinitionAssociate.$(MAN3EXT) 
	$(NOECHO) $(POD2MAN) --section=3 --perm_rw=$(PERM_RW) \
	  lib/ULDE/Schema/ULDE/Result/DiscountVoucher.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::DiscountVoucher.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/CustomerAddress.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::CustomerAddress.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityCode.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ReviewServiceResponsibilityCode.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/DocumentAssemblyProvider.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::DocumentAssemblyProvider.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Reviewer.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Reviewer.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ProductFeeDiscount.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductFeeDiscount.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Message.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Message.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ForeignAccount.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ForeignAccount.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Associate.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Associate.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/LegalSubCategory.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::LegalSubCategory.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/CustomerAccount.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::CustomerAccount.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/LegalArea.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::LegalArea.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/CustomerRole.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::CustomerRole.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/TemplateInstanceFileStorage.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::TemplateInstanceFileStorage.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ReviewerResponsibility.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ReviewerResponsibility.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinitionUrl.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ServiceDefinitionUrl.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/EleServiceOption.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::EleServiceOption.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Provider.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Provider.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/FileStorage.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::FileStorage.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/RoleCode.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::RoleCode.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/LegalCategory.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::LegalCategory.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ForeignAccountDetail.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ForeignAccountDetail.$(MAN3EXT) \
	  lib/ULDE/Web/View/JSON.pm $(INST_MAN3DIR)/ULDE::Web::View::JSON.$(MAN3EXT) 
	$(NOECHO) $(POD2MAN) --section=3 --perm_rw=$(PERM_RW) \
	  lib/ULDE/Schema/ULDE/Result/Product.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Product.$(MAN3EXT) \
	  lib/ULDE/Web.pm $(INST_MAN3DIR)/ULDE::Web.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ProductServiceDefinition.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductServiceDefinition.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/DocumentTemplate.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::DocumentTemplate.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/UldeSubCategory.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::UldeSubCategory.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ProductDocumentTemplate.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductDocumentTemplate.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Activity.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Activity.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ProductServiceLevel.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductServiceLevel.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Jurisdiction.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Jurisdiction.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/HttpSessionProduct.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::HttpSessionProduct.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/HttpSession.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::HttpSession.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ActivityProductInstance.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ActivityProductInstance.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/FileFormat.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::FileFormat.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ActivityTemplateInstance.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ActivityTemplateInstance.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/TemplateInstance.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::TemplateInstance.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ProductInstance.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductInstance.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ActivityCode.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ActivityCode.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Role.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Role.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibility.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ReviewServiceResponsibility.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ReviewerRole.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ReviewerRole.$(MAN3EXT) \
	  lib/ULDE/Web/Model/DB/ULDE.pm $(INST_MAN3DIR)/ULDE::Web::Model::DB::ULDE.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Communication.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Communication.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ProductInstancePurchaseTransaction.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ProductInstancePurchaseTransaction.$(MAN3EXT) 
	$(NOECHO) $(POD2MAN) --section=3 --perm_rw=$(PERM_RW) \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinitionLegalArea.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ServiceDefinitionLegalArea.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/Customer.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::Customer.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ReviewAccountability.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ReviewAccountability.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/StatusCode.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::StatusCode.$(MAN3EXT) \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinitionDiscountVoucher.pm $(INST_MAN3DIR)/ULDE::Schema::ULDE::Result::ServiceDefinitionDiscountVoucher.$(MAN3EXT) 




# --- MakeMaker processPL section:


# --- MakeMaker installbin section:

EXE_FILES = script/test.pl script/test_old.pl script/ulde_web_cgi.pl script/ulde_web_create.pl script/ulde_web_fastcgi.pl script/ulde_web_server.pl script/ulde_web_test.pl

pure_all :: $(INST_SCRIPT)/ulde_web_fastcgi.pl $(INST_SCRIPT)/ulde_web_create.pl $(INST_SCRIPT)/ulde_web_server.pl $(INST_SCRIPT)/ulde_web_cgi.pl $(INST_SCRIPT)/test_old.pl $(INST_SCRIPT)/test.pl $(INST_SCRIPT)/ulde_web_test.pl
	$(NOECHO) $(NOOP)

realclean ::
	$(RM_F) \
	  $(INST_SCRIPT)/ulde_web_fastcgi.pl $(INST_SCRIPT)/ulde_web_create.pl \
	  $(INST_SCRIPT)/ulde_web_server.pl $(INST_SCRIPT)/ulde_web_cgi.pl \
	  $(INST_SCRIPT)/test_old.pl $(INST_SCRIPT)/test.pl \
	  $(INST_SCRIPT)/ulde_web_test.pl 

$(INST_SCRIPT)/ulde_web_fastcgi.pl : script/ulde_web_fastcgi.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/ulde_web_fastcgi.pl
	$(CP) script/ulde_web_fastcgi.pl $(INST_SCRIPT)/ulde_web_fastcgi.pl
	$(FIXIN) $(INST_SCRIPT)/ulde_web_fastcgi.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/ulde_web_fastcgi.pl

$(INST_SCRIPT)/ulde_web_create.pl : script/ulde_web_create.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/ulde_web_create.pl
	$(CP) script/ulde_web_create.pl $(INST_SCRIPT)/ulde_web_create.pl
	$(FIXIN) $(INST_SCRIPT)/ulde_web_create.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/ulde_web_create.pl

$(INST_SCRIPT)/ulde_web_server.pl : script/ulde_web_server.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/ulde_web_server.pl
	$(CP) script/ulde_web_server.pl $(INST_SCRIPT)/ulde_web_server.pl
	$(FIXIN) $(INST_SCRIPT)/ulde_web_server.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/ulde_web_server.pl

$(INST_SCRIPT)/ulde_web_cgi.pl : script/ulde_web_cgi.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/ulde_web_cgi.pl
	$(CP) script/ulde_web_cgi.pl $(INST_SCRIPT)/ulde_web_cgi.pl
	$(FIXIN) $(INST_SCRIPT)/ulde_web_cgi.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/ulde_web_cgi.pl

$(INST_SCRIPT)/test_old.pl : script/test_old.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/test_old.pl
	$(CP) script/test_old.pl $(INST_SCRIPT)/test_old.pl
	$(FIXIN) $(INST_SCRIPT)/test_old.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/test_old.pl

$(INST_SCRIPT)/test.pl : script/test.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/test.pl
	$(CP) script/test.pl $(INST_SCRIPT)/test.pl
	$(FIXIN) $(INST_SCRIPT)/test.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/test.pl

$(INST_SCRIPT)/ulde_web_test.pl : script/ulde_web_test.pl $(FIRST_MAKEFILE) $(INST_SCRIPT)$(DFSEP).exists $(INST_BIN)$(DFSEP).exists
	$(NOECHO) $(RM_F) $(INST_SCRIPT)/ulde_web_test.pl
	$(CP) script/ulde_web_test.pl $(INST_SCRIPT)/ulde_web_test.pl
	$(FIXIN) $(INST_SCRIPT)/ulde_web_test.pl
	-$(NOECHO) $(CHMOD) $(PERM_RWX) $(INST_SCRIPT)/ulde_web_test.pl



# --- MakeMaker subdirs section:

# none

# --- MakeMaker clean_subdirs section:
clean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean :: clean_subdirs
	- $(RM_F) \
	  *$(LIB_EXT) core \
	  core.[0-9] $(INST_ARCHAUTODIR)/extralibs.all \
	  core.[0-9][0-9] $(BASEEXT).bso \
	  pm_to_blib.ts MYMETA.json \
	  core.[0-9][0-9][0-9][0-9] MYMETA.yml \
	  $(BASEEXT).x $(BOOTSTRAP) \
	  perl$(EXE_EXT) tmon.out \
	  *$(OBJ_EXT) pm_to_blib \
	  $(INST_ARCHAUTODIR)/extralibs.ld blibdirs.ts \
	  core.[0-9][0-9][0-9][0-9][0-9] *perl.core \
	  core.*perl.*.? $(MAKE_APERL_FILE) \
	  $(BASEEXT).def perl \
	  core.[0-9][0-9][0-9] mon.out \
	  lib$(BASEEXT).def perlmain.c \
	  perl.exe so_locations \
	  $(BASEEXT).exp 
	- $(RM_RF) \
	  blib 
	- $(MV) $(FIRST_MAKEFILE) $(MAKEFILE_OLD) $(DEV_NULL)


# --- MakeMaker realclean_subdirs section:
realclean_subdirs :
	$(NOECHO) $(NOOP)


# --- MakeMaker realclean section:
# Delete temporary files (via clean) and also delete dist files
realclean purge ::  clean realclean_subdirs
	- $(RM_F) \
	  $(MAKEFILE_OLD) $(FIRST_MAKEFILE) 
	- $(RM_RF) \
	  MYMETA.yml $(DISTVNAME) 


# --- MakeMaker metafile section:
metafile :
	$(NOECHO) $(NOOP)


# --- MakeMaker signature section:
signature :
	cpansign -s


# --- MakeMaker dist_basics section:
distclean :: realclean distcheck
	$(NOECHO) $(NOOP)

distcheck :
	$(PERLRUN) "-MExtUtils::Manifest=fullcheck" -e fullcheck

skipcheck :
	$(PERLRUN) "-MExtUtils::Manifest=skipcheck" -e skipcheck

manifest :
	$(PERLRUN) "-MExtUtils::Manifest=mkmanifest" -e mkmanifest

veryclean : realclean
	$(RM_F) *~ */*~ *.orig */*.orig *.bak */*.bak *.old */*.old 



# --- MakeMaker dist_core section:

dist : $(DIST_DEFAULT) $(FIRST_MAKEFILE)
	$(NOECHO) $(ABSPERLRUN) -l -e 'print '\''Warning: Makefile possibly out of date with $(VERSION_FROM)'\''' \
	  -e '    if -e '\''$(VERSION_FROM)'\'' and -M '\''$(VERSION_FROM)'\'' < -M '\''$(FIRST_MAKEFILE)'\'';' --

tardist : $(DISTVNAME).tar$(SUFFIX)
	$(NOECHO) $(NOOP)

uutardist : $(DISTVNAME).tar$(SUFFIX)
	uuencode $(DISTVNAME).tar$(SUFFIX) $(DISTVNAME).tar$(SUFFIX) > $(DISTVNAME).tar$(SUFFIX)_uu

$(DISTVNAME).tar$(SUFFIX) : distdir
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(POSTOP)

zipdist : $(DISTVNAME).zip
	$(NOECHO) $(NOOP)

$(DISTVNAME).zip : distdir
	$(PREOP)
	$(ZIP) $(ZIPFLAGS) $(DISTVNAME).zip $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)

shdist : distdir
	$(PREOP)
	$(SHAR) $(DISTVNAME) > $(DISTVNAME).shar
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)


# --- MakeMaker distdir section:
create_distdir :
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
		-e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"

distdir : create_distdir  
	$(NOECHO) $(NOOP)



# --- MakeMaker dist_test section:
disttest : distdir
	cd $(DISTVNAME) && $(ABSPERLRUN) Makefile.PL 
	cd $(DISTVNAME) && $(MAKE) $(PASTHRU)
	cd $(DISTVNAME) && $(MAKE) test $(PASTHRU)



# --- MakeMaker dist_ci section:

ci :
	$(PERLRUN) "-MExtUtils::Manifest=maniread" \
	  -e "@all = keys %{ maniread() };" \
	  -e "print(qq{Executing $(CI) @all\n}); system(qq{$(CI) @all});" \
	  -e "print(qq{Executing $(RCS_LABEL) ...\n}); system(qq{$(RCS_LABEL) @all});"


# --- MakeMaker distmeta section:
distmeta : create_distdir metafile
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'exit unless -e q{META.yml};' \
	  -e 'eval { maniadd({q{META.yml} => q{Module YAML meta-data (added by MakeMaker)}}) }' \
	  -e '    or print "Could not add META.yml to MANIFEST: $$$${'\''@'\''}\n"' --
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'exit unless -f q{META.json};' \
	  -e 'eval { maniadd({q{META.json} => q{Module JSON meta-data (added by MakeMaker)}}) }' \
	  -e '    or print "Could not add META.json to MANIFEST: $$$${'\''@'\''}\n"' --



# --- MakeMaker distsignature section:
distsignature : create_distdir
	$(NOECHO) cd $(DISTVNAME) && $(ABSPERLRUN) -MExtUtils::Manifest=maniadd -e 'eval { maniadd({q{SIGNATURE} => q{Public-key signature (added by MakeMaker)}}) } ' \
	  -e '    or print "Could not add SIGNATURE to MANIFEST: $$$${'\''@'\''}\n"' --
	$(NOECHO) cd $(DISTVNAME) && $(TOUCH) SIGNATURE
	cd $(DISTVNAME) && cpansign -s



# --- MakeMaker install section:

install :: pure_install doc_install
	$(NOECHO) $(NOOP)

install_perl :: pure_perl_install doc_perl_install
	$(NOECHO) $(NOOP)

install_site :: pure_site_install doc_site_install
	$(NOECHO) $(NOOP)

install_vendor :: pure_vendor_install doc_vendor_install
	$(NOECHO) $(NOOP)

pure_install :: pure_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

doc_install :: doc_$(INSTALLDIRS)_install
	$(NOECHO) $(NOOP)

pure__install : pure_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

doc__install : doc_site_install
	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

pure_perl_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read $(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLARCHLIB)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLPRIVLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
		$(INST_BIN) $(DESTINSTALLBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(SITEARCHEXP)/auto/$(FULLEXT)


pure_site_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLSITEARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLSITELIB) \
		$(INST_ARCHLIB) $(DESTINSTALLSITEARCH) \
		$(INST_BIN) $(DESTINSTALLSITEBIN) \
		$(INST_SCRIPT) $(DESTINSTALLSITESCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLSITEMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLSITEMAN3DIR)
	$(NOECHO) $(WARN_IF_OLD_PACKLIST) \
		$(PERL_ARCHLIB)/auto/$(FULLEXT)

pure_vendor_install :: all
	$(NOECHO) $(MOD_INSTALL) \
		read $(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist \
		write $(DESTINSTALLVENDORARCH)/auto/$(FULLEXT)/.packlist \
		$(INST_LIB) $(DESTINSTALLVENDORLIB) \
		$(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
		$(INST_BIN) $(DESTINSTALLVENDORBIN) \
		$(INST_SCRIPT) $(DESTINSTALLVENDORSCRIPT) \
		$(INST_MAN1DIR) $(DESTINSTALLVENDORMAN1DIR) \
		$(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)

doc_perl_install :: all
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLPRIVLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod

doc_site_install :: all
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLSITELIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod

doc_vendor_install :: all
	$(NOECHO) $(ECHO) Appending installation info to $(DESTINSTALLARCHLIB)/perllocal.pod
	-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
	-$(NOECHO) $(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLVENDORLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(DESTINSTALLARCHLIB)/perllocal.pod


uninstall :: uninstall_from_$(INSTALLDIRS)dirs
	$(NOECHO) $(NOOP)

uninstall_from_perldirs ::
	$(NOECHO) $(UNINSTALL) $(PERL_ARCHLIB)/auto/$(FULLEXT)/.packlist

uninstall_from_sitedirs ::
	$(NOECHO) $(UNINSTALL) $(SITEARCHEXP)/auto/$(FULLEXT)/.packlist

uninstall_from_vendordirs ::
	$(NOECHO) $(UNINSTALL) $(VENDORARCHEXP)/auto/$(FULLEXT)/.packlist


# --- MakeMaker force section:
# Phony target to force checking subdirectories.
FORCE :
	$(NOECHO) $(NOOP)


# --- MakeMaker perldepend section:


# --- MakeMaker makefile section:
# We take a very conservative approach here, but it's worth it.
# We move Makefile to Makefile.old here to avoid gnu make looping.
$(FIRST_MAKEFILE) : Makefile.PL $(CONFIGDEP)
	$(NOECHO) $(ECHO) "Makefile out-of-date with respect to $?"
	$(NOECHO) $(ECHO) "Cleaning current config before rebuilding Makefile..."
	-$(NOECHO) $(RM_F) $(MAKEFILE_OLD)
	-$(NOECHO) $(MV)   $(FIRST_MAKEFILE) $(MAKEFILE_OLD)
	- $(MAKE) $(USEMAKEFILE) $(MAKEFILE_OLD) clean $(DEV_NULL)
	$(PERLRUN) Makefile.PL 
	$(NOECHO) $(ECHO) "==> Your Makefile has been rebuilt. <=="
	$(NOECHO) $(ECHO) "==> Please rerun the $(MAKE) command.  <=="
	$(FALSE)



# --- MakeMaker staticmake section:

# --- MakeMaker makeaperl section ---
MAP_TARGET    = perl
FULLPERL      = /usr/bin/perl

$(MAP_TARGET) :: static $(MAKE_APERL_FILE)
	$(MAKE) $(USEMAKEFILE) $(MAKE_APERL_FILE) $@

$(MAKE_APERL_FILE) : $(FIRST_MAKEFILE) pm_to_blib
	$(NOECHO) $(ECHO) Writing \"$(MAKE_APERL_FILE)\" for this $(MAP_TARGET)
	$(NOECHO) $(PERLRUNINST) \
		Makefile.PL DIR= \
		MAKEFILE=$(MAKE_APERL_FILE) LINKTYPE=static \
		MAKEAPERL=1 NORECURS=1 CCCDLFLAGS=


# --- MakeMaker test section:

TEST_VERBOSE=0
TEST_TYPE=test_$(LINKTYPE)
TEST_FILE = test.pl
TEST_FILES = t/01app.t t/02pod.t t/03podcoverage.t t/controller_Account.t t/controller_API-REST.t t/controller_Product.t t/controller_Session-Authentication.t t/controller_Session-Management.t t/model_Component-Form-Account.t t/model_Component-Session.t t/model_DB-ULDE.t t/view_Mason.t t/view_Mason2.t
TESTDB_SW = -d

testdb :: testdb_$(LINKTYPE)

test :: $(TEST_TYPE) subdirs-test

subdirs-test ::
	$(NOECHO) $(NOOP)


test_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) "-MExtUtils::Command::MM" "-e" "test_harness($(TEST_VERBOSE), 'inc', '$(INST_LIB)', '$(INST_ARCHLIB)')" $(TEST_FILES)

testdb_dynamic :: pure_all
	PERL_DL_NONLAZY=1 $(FULLPERLRUN) $(TESTDB_SW) "-Iinc" "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

test_ : test_dynamic

test_static :: test_dynamic
testdb_static :: testdb_dynamic


# --- MakeMaker ppd section:
# Creates a PPD (Perl Package Description) for a binary distribution.
ppd :
	$(NOECHO) $(ECHO) '<SOFTPKG NAME="$(DISTNAME)" VERSION="$(VERSION)">' > $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <ABSTRACT></ABSTRACT>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <AUTHOR>Catalyst developer</AUTHOR>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    <IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Action::REST" VERSION="1.17" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Action::RenderView" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Authentication::Store::DBIx::Class" VERSION="0.1503" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Helper::Model::DBIC::Schema" VERSION="0.6" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Model::Adaptor" VERSION="0.1" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Model::DBIC::Schema" VERSION="0.65" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Model::Facebook" VERSION="0.101" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Model::Factory" VERSION="0.1" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Authentication" VERSION="0.10021" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Authorization::Roles" VERSION="0.09" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Cache" VERSION="0.12" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::ConfigLoader" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::DateTime" VERSION="0.03" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Session" VERSION="0.35" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Session::State::Cookie" VERSION="0.17" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Session::Store::DBIC" VERSION="0.12" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Session::Store::FastMmap" VERSION="0.16" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Plugin::Static::Simple" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::Runtime" VERSION="5.90015" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::TraitFor::Request::BrowserDetect" VERSION="0.02" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::View::HTML::Mason" VERSION="0.19" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::View::JSON" VERSION="0.33" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Catalyst::View::Mason2" VERSION="0.03" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Class::DBI" VERSION="3" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Config::General" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Config::ZOMG" VERSION="1" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="DBD::Pg" VERSION="2.19" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="DBIx::Class::Schema::Loader" VERSION="0.07025" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Data::Dumper" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Data::Serializer::Raw" VERSION="0.02" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="DateTime::Format::Pg" VERSION="0.1601" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Digest::HMAC_SHA1" VERSION="1.03" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Excel::Writer::XLSX" VERSION="0.49" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Facebook::" VERSION="0.102" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="HTML::FormHandler" VERSION="0.40022" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="HTML::FormHandler::Model::DBIC" VERSION="0.21" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="HTML::Summary" VERSION="0.019" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="HTML::TokeParser" VERSION="3.69" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="HTML::Tree" VERSION="5.03" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="HTTP::Cookies" VERSION="6.01" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="HTTP::Date" VERSION="6.02" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="HTTP::Response" VERSION="6.04" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="JSON::" VERSION="2.9" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="JSON::XS" VERSION="3.01" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="LWP::Protocol::https" VERSION="6.06" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="LWP::UserAgent" VERSION="6.06" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="List::Util" VERSION="1.41" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Moose::" VERSION="2.1402" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="MooseX::ClassAttribute" VERSION="0.27" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="MooseX::MarkAsMethods" VERSION="0.15" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="MooseX::NonMoose" VERSION="0.22" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="MooseX::Traits" VERSION="0.12" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="MooseX::UndefTolerant" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="String::MkPasswd" VERSION="0.05" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="Text::Stripper" VERSION="1.16" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="URI::" VERSION="1.67" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="URI::Escape" VERSION="3.31" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="URL::Encode" VERSION="0.03" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <REQUIRE NAME="namespace::autoclean" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <ARCHITECTURE NAME="x86_64-linux-thread-multi-5.16" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '        <CODEBASE HREF="" />' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '    </IMPLEMENTATION>' >> $(DISTNAME).ppd
	$(NOECHO) $(ECHO) '</SOFTPKG>' >> $(DISTNAME).ppd


# --- MakeMaker pm_to_blib section:

pm_to_blib : $(FIRST_MAKEFILE) $(TO_INST_PM)
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Component/Template.pm blib/lib/ULDE/Component/Template.pm \
	  lib/ULDE/FileStorage/employing staff (656) 25-4-2016.pdf blib/lib/ULDE/FileStorage/employing staff (656) 25-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ForeignProvider.pm blib/lib/ULDE/Schema/ULDE/Result/ForeignProvider.pm \
	  lib/ULDE/FileStorage/business startup (679) 21-6-2016.pdf blib/lib/ULDE/FileStorage/business startup (679) 21-6-2016.pdf \
	  lib/ULDE/Web/Component/Form/Field/TermsOfEngagement.pm blib/lib/ULDE/Web/Component/Form/Field/TermsOfEngagement.pm \
	  lib/ULDE/Web/Controller/Session/Management.pm blib/lib/ULDE/Web/Controller/Session/Management.pm \
	  lib/ULDE/Schema/ULDE/Result/DocumentTemplateJurisdiction.pm blib/lib/ULDE/Schema/ULDE/Result/DocumentTemplateJurisdiction.pm \
	  lib/ULDE/FileStorage/business startup (680) 8-7-2016.pdf blib/lib/ULDE/FileStorage/business startup (680) 8-7-2016.pdf \
	  lib/ULDE/Web/Component/Form/Field/Address.pm blib/lib/ULDE/Web/Component/Form/Field/Address.pm \
	  lib/ULDE/Schema/ULDE.pm blib/lib/ULDE/Schema/ULDE.pm \
	  lib/ULDE/Schema/ULDE/Result/ServiceLevel.pm blib/lib/ULDE/Schema/ULDE/Result/ServiceLevel.pm \
	  lib/ULDE/Schema/ULDE/Result/EventCode.pm blib/lib/ULDE/Schema/ULDE/Result/EventCode.pm \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinition.pm blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinition.pm \
	  lib/ULDE/Web/Component/Form/Account/RegisterByAdmin.pm blib/lib/ULDE/Web/Component/Form/Account/RegisterByAdmin.pm \
	  lib/ULDE/FileStorage/powers of attorney (688) 9-6-2016.pdf blib/lib/ULDE/FileStorage/powers of attorney (688) 9-6-2016.pdf \
	  lib/ULDE/Component/Utilities.pm blib/lib/ULDE/Component/Utilities.pm \
	  lib/ULDE/Component/Role.pm blib/lib/ULDE/Component/Role.pm \
	  lib/ULDE/FileStorage/employing staff (580) 18-4-2016.pdf blib/lib/ULDE/FileStorage/employing staff (580) 18-4-2016.pdf \
	  lib/ULDE/Component/Template/Product.pm blib/lib/ULDE/Component/Template/Product.pm \
	  lib/ULDE/Web/Component/Form/Template/SignOff.pm blib/lib/ULDE/Web/Component/Form/Template/SignOff.pm \
	  lib/ULDE/Web/Service/REST/Client/Response.pm blib/lib/ULDE/Web/Service/REST/Client/Response.pm \
	  lib/ULDE/Schema/ULDE/Result/PurchaseTransaction.pm blib/lib/ULDE/Schema/ULDE/Result/PurchaseTransaction.pm \
	  lib/ULDE/Web/Controller/Widget/Modal.pm blib/lib/ULDE/Web/Controller/Widget/Modal.pm \
	  lib/ULDE/Web/Component/Form/Payment.pm blib/lib/ULDE/Web/Component/Form/Payment.pm \
	  lib/ULDE/Schema/ULDE/Result/EventLog.pm blib/lib/ULDE/Schema/ULDE/Result/EventLog.pm \
	  lib/ULDE/Web/Model/DB/ULDE.pm.new blib/lib/ULDE/Web/Model/DB/ULDE.pm.new \
	  lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/admin_cookie_jar blib/lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/admin_cookie_jar 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Component/ServiceDefinitionUrl.pm blib/lib/ULDE/Component/ServiceDefinitionUrl.pm \
	  lib/ULDE/Component/ServiceLevel.pm blib/lib/ULDE/Component/ServiceLevel.pm \
	  lib/ULDE/Schema/ULDE/Result/Country.pm blib/lib/ULDE/Schema/ULDE/Result/Country.pm \
	  lib/ULDE/Web/Service/REST/Client.pm blib/lib/ULDE/Web/Service/REST/Client.pm \
	  lib/ULDE/Web/Model/Web/Component/Form/Product.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Product.pm \
	  lib/ULDE/FileStorage/employing staff (732) 13-7-2016.pdf blib/lib/ULDE/FileStorage/employing staff (732) 13-7-2016.pdf \
	  lib/ULDE/FileStorage/debt management & collection (674) 10-5-2016.pdf blib/lib/ULDE/FileStorage/debt management & collection (674) 10-5-2016.pdf \
	  lib/ULDE/FileStorage/managing staff (601) 23-4-2016.pdf blib/lib/ULDE/FileStorage/managing staff (601) 23-4-2016.pdf \
	  lib/ULDE/FileStorage/probate (754) 16-9-2016.pdf blib/lib/ULDE/FileStorage/probate (754) 16-9-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ForeignAccount.pm blib/lib/ULDE/Schema/ULDE/Result/ForeignAccount.pm \
	  lib/ULDE/Web/Component/Form/Account/Update.pm blib/lib/ULDE/Web/Component/Form/Account/Update.pm \
	  lib/ULDE/FileStorage/employing staff (592) 22-4-2016.pdf blib/lib/ULDE/FileStorage/employing staff (592) 22-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/LegalArea.pm blib/lib/ULDE/Schema/ULDE/Result/LegalArea.pm \
	  lib/ULDE/FileStorage/sales & marketing (600) 22-4-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (600) 22-4-2016.pdf \
	  lib/ULDE/Web/Model/Web/Component/Form/Payment/Basket.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Payment/Basket.pm \
	  lib/ULDE/Schema/ULDE/Result/TemplateInstanceFileStorage.pm blib/lib/ULDE/Schema/ULDE/Result/TemplateInstanceFileStorage.pm \
	  lib/ULDE/FileStorage/business startup (664) 26-4-2016.pdf blib/lib/ULDE/FileStorage/business startup (664) 26-4-2016.pdf \
	  lib/ULDE/Web/Controller/Root.pm blib/lib/ULDE/Web/Controller/Root.pm \
	  lib/ULDE/Web/Component/Form/._Template.pm blib/lib/ULDE/Web/Component/Form/._Template.pm \
	  lib/ULDE/FileStorage/dealing with an estate (663) 25-4-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (663) 25-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/FileStorage.pm blib/lib/ULDE/Schema/ULDE/Result/FileStorage.pm \
	  lib/ULDE/FileStorage/managing staff (697) 13-6-2016.pdf blib/lib/ULDE/FileStorage/managing staff (697) 13-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/RoleCode.pm blib/lib/ULDE/Schema/ULDE/Result/RoleCode.pm \
	  lib/ULDE/Web/Service/WebSite/ELE/Response.pm blib/lib/ULDE/Web/Service/WebSite/ELE/Response.pm \
	  lib/ULDE/FileStorage/wills (662) 25-4-2016.pdf blib/lib/ULDE/FileStorage/wills (662) 25-4-2016.pdf 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/FileStorage/employing staff (711) 3-7-2016.pdf blib/lib/ULDE/FileStorage/employing staff (711) 3-7-2016.pdf \
	  lib/ULDE/FileStorage/probate (758) 16-9-2016.pdf blib/lib/ULDE/FileStorage/probate (758) 16-9-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/Product.pm blib/lib/ULDE/Schema/ULDE/Result/Product.pm \
	  lib/ULDE/Component/Code.pm blib/lib/ULDE/Component/Code.pm \
	  lib/ULDE/Web/Model/Web/Component/Form/Template.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Template.pm \
	  lib/ULDE/FileStorage/wills (721) 15-6-2016.pdf blib/lib/ULDE/FileStorage/wills (721) 15-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/Activity.pm blib/lib/ULDE/Schema/ULDE/Result/Activity.pm \
	  lib/ULDE/Web/Component/Form/Field/TermsOfUseAndMerchantNotice.pm blib/lib/ULDE/Web/Component/Form/Field/TermsOfUseAndMerchantNotice.pm \
	  lib/ULDE/FileStorage/probate (734) 21-6-2016.pdf blib/lib/ULDE/FileStorage/probate (734) 21-6-2016.pdf \
	  lib/ULDE/FileStorage/managing staff (736) 2-7-2016.pdf blib/lib/ULDE/FileStorage/managing staff (736) 2-7-2016.pdf \
	  lib/ULDE/Component/LegalSubCategory.pm blib/lib/ULDE/Component/LegalSubCategory.pm \
	  lib/ULDE/Schema/ULDE/Result/FileFormat.pm blib/lib/ULDE/Schema/ULDE/Result/FileFormat.pm \
	  lib/ULDE/Web/Component/Form/Product.pm blib/lib/ULDE/Web/Component/Form/Product.pm \
	  lib/ULDE/Component/Associate.pm blib/lib/ULDE/Component/Associate.pm \
	  lib/ULDE.pm blib/lib/ULDE.pm \
	  lib/ULDE/Schema/ULDE/Result/ProductInstance.pm blib/lib/ULDE/Schema/ULDE/Result/ProductInstance.pm \
	  lib/ULDE/Component/Account/Provider.pm blib/lib/ULDE/Component/Account/Provider.pm \
	  lib/ULDE/Web/Model/Web/Component/Session.pm blib/lib/ULDE/Web/Model/Web/Component/Session.pm \
	  lib/ULDE/FileStorage/sales & marketing (738) 8-7-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (738) 8-7-2016.pdf \
	  lib/ULDE/FileStorage/dealing with an estate (703) 13-6-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (703) 13-6-2016.pdf \
	  lib/ULDE/Component/Product/Template_org.pm blib/lib/ULDE/Component/Product/Template_org.pm \
	  lib/ULDE/Schema/ULDE/Result/ReviewerRole.pm blib/lib/ULDE/Schema/ULDE/Result/ReviewerRole.pm \
	  lib/ULDE/Web/Model/DB/ULDE.pm blib/lib/ULDE/Web/Model/DB/ULDE.pm \
	  lib/ULDE/FileStorage/managing staff (684) 9-6-2016.pdf blib/lib/ULDE/FileStorage/managing staff (684) 9-6-2016.pdf \
	  lib/ULDE/Web/View/Mason.pm blib/lib/ULDE/Web/View/Mason.pm \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinitionDiscountVoucher.pm blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinitionDiscountVoucher.pm \
	  lib/ULDE/Web/Model/Component/Product/Instance.pm blib/lib/ULDE/Web/Model/Component/Product/Instance.pm 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Schema/ULDE/Result/ProductJurisdiction.pm blib/lib/ULDE/Schema/ULDE/Result/ProductJurisdiction.pm \
	  lib/ULDE/Component/ForeignAccount.pm blib/lib/ULDE/Component/ForeignAccount.pm \
	  lib/ULDE/Web/Component/Form/Field/Telephone.pm blib/lib/ULDE/Web/Component/Form/Field/Telephone.pm \
	  lib/ULDE/FileStorage/business startup (664) 28-4-2016.pdf blib/lib/ULDE/FileStorage/business startup (664) 28-4-2016.pdf \
	  lib/ULDE/Component/ServiceDefinition.pm blib/lib/ULDE/Component/ServiceDefinition.pm \
	  lib/ULDE/Component/Product/Session.pm blib/lib/ULDE/Component/Product/Session.pm \
	  lib/ULDE/FileStorage/dealing with an estate (653) 24-4-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (653) 24-4-2016.pdf \
	  lib/ULDE/FileStorage/employing staff (733) 21-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (733) 21-6-2016.pdf \
	  lib/ULDE/FileStorage/debt management & collection (647) 24-4-2016.pdf blib/lib/ULDE/FileStorage/debt management & collection (647) 24-4-2016.pdf \
	  lib/ULDE/Web/Component/Form/Account/Register.pm blib/lib/ULDE/Web/Component/Form/Account/Register.pm \
	  lib/ULDE/FileStorage/dealing with an estate (710) 3-7-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (710) 3-7-2016.pdf \
	  lib/ULDE/Component.pm blib/lib/ULDE/Component.pm \
	  lib/ULDE/FileStorage/probate (685) 9-6-2016.pdf blib/lib/ULDE/FileStorage/probate (685) 9-6-2016.pdf \
	  lib/ULDE/Interface/DocumentAssembler.pm blib/lib/ULDE/Interface/DocumentAssembler.pm \
	  lib/ULDE/Web/Model/Web/Component/Form/Account/Register.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Account/Register.pm \
	  lib/ULDE/FileStorage/sales & marketing (585) 19-4-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (585) 19-4-2016.pdf \
	  lib/ULDE/FileStorage/probate (747) 19-7-2016.pdf blib/lib/ULDE/FileStorage/probate (747) 19-7-2016.pdf \
	  lib/ULDE/Web/Model/Web/Component/Form/Account/Update.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Account/Update.pm \
	  lib/ULDE/Web/Component/Form/Login.pm blib/lib/ULDE/Web/Component/Form/Login.pm \
	  lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityAssociate.pm blib/lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityAssociate.pm \
	  lib/ULDE/FileStorage/employing staff (670) 29-4-2016.pdf blib/lib/ULDE/FileStorage/employing staff (670) 29-4-2016.pdf \
	  lib/ULDE/FileStorage/wills (661) 25-4-2016.pdf blib/lib/ULDE/FileStorage/wills (661) 25-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/CategorySubCategoryRelation.pm blib/lib/ULDE/Schema/ULDE/Result/CategorySubCategoryRelation.pm \
	  lib/ULDE/Component/Provider.pm blib/lib/ULDE/Component/Provider.pm 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/FileStorage/powers of attorney (715) 14-6-2016.pdf blib/lib/ULDE/FileStorage/powers of attorney (715) 14-6-2016.pdf \
	  lib/ULDE/FileStorage/changing a will (716) 14-6-2016.pdf blib/lib/ULDE/FileStorage/changing a will (716) 14-6-2016.pdf \
	  lib/ULDE/Web/Model/Component/Account/Customer.pm blib/lib/ULDE/Web/Model/Component/Account/Customer.pm \
	  lib/ULDE/FileStorage/sales & marketing (714) 14-6-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (714) 14-6-2016.pdf \
	  lib/ULDE/Component/ReviewServiceResponsibility/Reviewer.pm blib/lib/ULDE/Component/ReviewServiceResponsibility/Reviewer.pm \
	  lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityCode.pm blib/lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibilityCode.pm \
	  lib/ULDE/Schema/ULDE/Result/Reviewer.pm blib/lib/ULDE/Schema/ULDE/Result/Reviewer.pm \
	  lib/ULDE/Component/Reviewer.pm blib/lib/ULDE/Component/Reviewer.pm \
	  lib/ULDE/Web/Service/REST/Client/Serializer.pm blib/lib/ULDE/Web/Service/REST/Client/Serializer.pm \
	  lib/ULDE/FileStorage/employing staff (669) 28-4-2016.pdf blib/lib/ULDE/FileStorage/employing staff (669) 28-4-2016.pdf \
	  lib/ULDE/FileStorage/probate (755) 16-9-2016.pdf blib/lib/ULDE/FileStorage/probate (755) 16-9-2016.pdf \
	  lib/ULDE/Component/Activity.pm blib/lib/ULDE/Component/Activity.pm \
	  lib/ULDE/Utilities.pm blib/lib/ULDE/Utilities.pm \
	  lib/ULDE/Schema/ULDE/Result/LegalSubCategory.pm blib/lib/ULDE/Schema/ULDE/Result/LegalSubCategory.pm \
	  lib/ULDE/FileStorage/managing staff (709) 14-6-2016.pdf blib/lib/ULDE/FileStorage/managing staff (709) 14-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/CustomerRole.pm blib/lib/ULDE/Schema/ULDE/Result/CustomerRole.pm \
	  lib/ULDE/Web/Component/Form/Field/Postcode.pm blib/lib/ULDE/Web/Component/Form/Field/Postcode.pm \
	  lib/ULDE/Web/Model/Component/Product.pm blib/lib/ULDE/Web/Model/Component/Product.pm \
	  lib/ULDE/Schema/ULDE/Result/ReviewerResponsibility.pm blib/lib/ULDE/Schema/ULDE/Result/ReviewerResponsibility.pm \
	  lib/ULDE/Component/Country.pm blib/lib/ULDE/Component/Country.pm \
	  lib/ULDE/FileStorage/dealing with an estate (740) 9-7-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (740) 9-7-2016.pdf \
	  lib/ULDE/FileStorage/business startup (679) 15-6-2016.pdf blib/lib/ULDE/FileStorage/business startup (679) 15-6-2016.pdf \
	  lib/ULDE/Web/Model/Web/Component/Form/Account.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Account.pm \
	  lib/ULDE/Schema/ULDE/Result/ForeignAccountDetail.pm blib/lib/ULDE/Schema/ULDE/Result/ForeignAccountDetail.pm \
	  lib/ULDE/FileStorage/wills (724) 17-6-2016.pdf blib/lib/ULDE/FileStorage/wills (724) 17-6-2016.pdf 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/FileStorage/probate (749) 1-8-2016.pdf blib/lib/ULDE/FileStorage/probate (749) 1-8-2016.pdf \
	  lib/ULDE/Web/Model/Component/Template/Instance.pm blib/lib/ULDE/Web/Model/Component/Template/Instance.pm \
	  lib/ULDE/FileStorage/business startup (678) 19-5-2016.pdf blib/lib/ULDE/FileStorage/business startup (678) 19-5-2016.pdf \
	  lib/ULDE/FileStorage/dealing with an estate (710) 10-7-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (710) 10-7-2016.pdf \
	  lib/ULDE/FileStorage/probate (695) 10-6-2016.pdf blib/lib/ULDE/FileStorage/probate (695) 10-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ProductServiceLevel.pm blib/lib/ULDE/Schema/ULDE/Result/ProductServiceLevel.pm \
	  lib/ULDE/Component/Product/ServiceDefinition.pm blib/lib/ULDE/Component/Product/ServiceDefinition.pm \
	  lib/ULDE/FileStorage/employee discipline & grievances (677) 13-6-2016.pdf blib/lib/ULDE/FileStorage/employee discipline & grievances (677) 13-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ActivityTemplateInstance.pm blib/lib/ULDE/Schema/ULDE/Result/ActivityTemplateInstance.pm \
	  lib/ULDE/Web/Component/Session.pm blib/lib/ULDE/Web/Component/Session.pm \
	  lib/ULDE/Schema/ULDE/Result/TemplateInstance.pm blib/lib/ULDE/Schema/ULDE/Result/TemplateInstance.pm \
	  lib/ULDE/FileStorage/employee discipline & grievances (693) 10-6-2016.pdf blib/lib/ULDE/FileStorage/employee discipline & grievances (693) 10-6-2016.pdf \
	  lib/ULDE/Web/Model/Component/FileStorage.pm blib/lib/ULDE/Web/Model/Component/FileStorage.pm \
	  lib/ULDE/FileStorage/employing staff (689) 9-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (689) 9-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/Role.pm blib/lib/ULDE/Schema/ULDE/Result/Role.pm \
	  lib/ULDE/Web/Component/Form.pm blib/lib/ULDE/Web/Component/Form.pm \
	  lib/ULDE/Web/Controller/Product.pm blib/lib/ULDE/Web/Controller/Product.pm \
	  lib/ULDE/FileStorage/managing staff (750) 19-8-2016.pdf blib/lib/ULDE/FileStorage/managing staff (750) 19-8-2016.pdf \
	  lib/ULDE/FileStorage/business startup (594) 22-4-2016.pdf blib/lib/ULDE/FileStorage/business startup (594) 22-4-2016.pdf \
	  lib/ULDE/Web/Controller/Admin/Root.pm blib/lib/ULDE/Web/Controller/Admin/Root.pm \
	  lib/ULDE/Schema/ULDE/Result/ProductInstancePurchaseTransaction.pm blib/lib/ULDE/Schema/ULDE/Result/ProductInstancePurchaseTransaction.pm \
	  lib/ULDE/FileStorage/employing staff (725) 15-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (725) 15-6-2016.pdf \
	  lib/ULDE/Component/Template/Instance.pm blib/lib/ULDE/Component/Template/Instance.pm \
	  lib/ULDE/Web/Service/WebSite/bin/refresh_session_cookies.pl blib/lib/ULDE/Web/Service/WebSite/bin/refresh_session_cookies.pl 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Web/Model/Web/Component/Form/Product/MainCategory.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Product/MainCategory.pm \
	  lib/ULDE/Component/LegalArea.pm blib/lib/ULDE/Component/LegalArea.pm \
	  lib/ULDE/Schema/ULDE/Result/Code.pm blib/lib/ULDE/Schema/ULDE/Result/Code.pm \
	  lib/ULDE/Web/Component/Form/Field/ContactDetails.pm blib/lib/ULDE/Web/Component/Form/Field/ContactDetails.pm \
	  lib/ULDE/Web/Model/Web/Component/Form/Template/Rename.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Template/Rename.pm \
	  lib/ULDE/Web/Component/Form/Account.pm blib/lib/ULDE/Web/Component/Form/Account.pm \
	  lib/ULDE/Component/Account.pm blib/lib/ULDE/Component/Account.pm \
	  lib/ULDE/FileStorage/debt management & collection (657) 25-4-2016.pdf blib/lib/ULDE/FileStorage/debt management & collection (657) 25-4-2016.pdf \
	  lib/ULDE/FileStorage/dealing with an estate (652) 24-4-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (652) 24-4-2016.pdf \
	  lib/ULDE/Web/Model/Component/DiscountVoucher.pm blib/lib/ULDE/Web/Model/Component/DiscountVoucher.pm \
	  lib/ULDE/Component/DocumentAssemblyProvider.pm blib/lib/ULDE/Component/DocumentAssemblyProvider.pm \
	  lib/ULDE/FileStorage/dealing with an estate (651) 24-4-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (651) 24-4-2016.pdf \
	  lib/ULDE/Web/Controller/Session/Authentication.pm blib/lib/ULDE/Web/Controller/Session/Authentication.pm \
	  lib/ULDE/FileStorage/employing staff (725) 17-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (725) 17-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ProductInstanceAssociate.pm blib/lib/ULDE/Schema/ULDE/Result/ProductInstanceAssociate.pm \
	  lib/ULDE/Component/ServiceLevel/Product_org.pm blib/lib/ULDE/Component/ServiceLevel/Product_org.pm \
	  lib/ULDE/Web/Controller/DocumentProduction.pm blib/lib/ULDE/Web/Controller/DocumentProduction.pm \
	  lib/ULDE/Interface.pm blib/lib/ULDE/Interface.pm \
	  lib/ULDE/FileStorage/powers of attorney (687) 9-6-2016.pdf blib/lib/ULDE/FileStorage/powers of attorney (687) 9-6-2016.pdf \
	  lib/ULDE/FileStorage/debt management & collection (675) 15-6-2016.pdf blib/lib/ULDE/FileStorage/debt management & collection (675) 15-6-2016.pdf \
	  lib/ULDE/Web/Component/Form/Reviewer.pm blib/lib/ULDE/Web/Component/Form/Reviewer.pm \
	  lib/ULDE/Web/Model/Component/Customer.pm blib/lib/ULDE/Web/Model/Component/Customer.pm \
	  lib/ULDE/Schema/ULDE/Result/ShoppingBasket.pm blib/lib/ULDE/Schema/ULDE/Result/ShoppingBasket.pm \
	  lib/ULDE/FileStorage/employing staff (666) 28-4-2016.pdf blib/lib/ULDE/FileStorage/employing staff (666) 28-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/AssociateDiscountVoucher.pm blib/lib/ULDE/Schema/ULDE/Result/AssociateDiscountVoucher.pm 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinitionAssociate.pm blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinitionAssociate.pm \
	  lib/ULDE/Schema/ULDE/Result/CustomerAddress.pm blib/lib/ULDE/Schema/ULDE/Result/CustomerAddress.pm \
	  lib/ULDE/Schema/ULDE/Result/DocumentAssemblyProvider.pm blib/lib/ULDE/Schema/ULDE/Result/DocumentAssemblyProvider.pm \
	  lib/ULDE/Component/Product/ServiceDefinition_org.pm blib/lib/ULDE/Component/Product/ServiceDefinition_org.pm \
	  lib/ULDE/FileStorage/sales & marketing (701) 13-6-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (701) 13-6-2016.pdf \
	  lib/ULDE/FileStorage/debt management & collection (746) 18-7-2016.pdf blib/lib/ULDE/FileStorage/debt management & collection (746) 18-7-2016.pdf \
	  lib/ULDE/Component/Communication.pm blib/lib/ULDE/Component/Communication.pm \
	  lib/ULDE/FileStorage/sales & marketing (601) 23-4-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (601) 23-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinitionUrl.pm blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinitionUrl.pm \
	  lib/ULDE/Component/FileStorage.pm blib/lib/ULDE/Component/FileStorage.pm \
	  lib/ULDE/Schema/ULDE/Result/Provider.pm blib/lib/ULDE/Schema/ULDE/Result/Provider.pm \
	  lib/ULDE/Component/Template/Product_org.pm blib/lib/ULDE/Component/Template/Product_org.pm \
	  lib/ULDE/Web/Model/Interface/DocumentAssembler.pm blib/lib/ULDE/Web/Model/Interface/DocumentAssembler.pm \
	  lib/ULDE/Component/ReviewServiceResponsibility/._Code.pm blib/lib/ULDE/Component/ReviewServiceResponsibility/._Code.pm \
	  lib/ULDE/Web/View/Mason2.pm blib/lib/ULDE/Web/View/Mason2.pm \
	  lib/ULDE/FileStorage/business startup (707) 15-6-2016.pdf blib/lib/ULDE/FileStorage/business startup (707) 15-6-2016.pdf \
	  lib/ULDE/FileStorage/managing staff (712) 14-6-2016.pdf blib/lib/ULDE/FileStorage/managing staff (712) 14-6-2016.pdf \
	  lib/ULDE/Web/Model/Web/Component/Form/Account/RegisterByAdmin.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Account/RegisterByAdmin.pm \
	  lib/ULDE/Schema/ULDE/Result/ProductDocumentTemplate.pm blib/lib/ULDE/Schema/ULDE/Result/ProductDocumentTemplate.pm \
	  lib/ULDE/FileStorage/employing staff (723) 15-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (723) 15-6-2016.pdf \
	  lib/ULDE/Web/Component/Form/Field/CardDetails.pm blib/lib/ULDE/Web/Component/Form/Field/CardDetails.pm \
	  lib/ULDE/Schema/ULDE/Result/Jurisdiction.pm blib/lib/ULDE/Schema/ULDE/Result/Jurisdiction.pm \
	  lib/ULDE/FileStorage/employee discipline & grievances (708) 14-6-2016.pdf blib/lib/ULDE/FileStorage/employee discipline & grievances (708) 14-6-2016.pdf \
	  lib/ULDE/Web/Component/Form/Field/Country.pm blib/lib/ULDE/Web/Component/Form/Field/Country.pm 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Component/Session.pm blib/lib/ULDE/Component/Session.pm \
	  lib/ULDE/FileStorage/debt management & collection (650) 24-4-2016.pdf blib/lib/ULDE/FileStorage/debt management & collection (650) 24-4-2016.pdf \
	  lib/ULDE/FileStorage/employing staff (690) 10-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (690) 10-6-2016.pdf \
	  lib/ULDE/Web/Component/Form/Field/Customer.pm blib/lib/ULDE/Web/Component/Form/Field/Customer.pm \
	  lib/ULDE/Component/Product.pm blib/lib/ULDE/Component/Product.pm \
	  lib/ULDE/FileStorage/managing staff (735) 26-6-2016.pdf blib/lib/ULDE/FileStorage/managing staff (735) 26-6-2016.pdf \
	  lib/ULDE/FileStorage/probate (759) 16-9-2016.pdf blib/lib/ULDE/FileStorage/probate (759) 16-9-2016.pdf \
	  lib/ULDE/FileStorage/probate (752) 16-9-2016.pdf blib/lib/ULDE/FileStorage/probate (752) 16-9-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/Communication.pm blib/lib/ULDE/Schema/ULDE/Result/Communication.pm \
	  lib/ULDE/Schema/ULDE/Result/Customer.pm blib/lib/ULDE/Schema/ULDE/Result/Customer.pm \
	  lib/ULDE/Schema/ULDE/Result/ServiceDefinitionLegalArea.pm blib/lib/ULDE/Schema/ULDE/Result/ServiceDefinitionLegalArea.pm \
	  lib/ULDE/FileStorage/managing staff (742) 10-7-2016.pdf blib/lib/ULDE/FileStorage/managing staff (742) 10-7-2016.pdf \
	  lib/ULDE/FileStorage/employee discipline & grievances (713) 14-6-2016.pdf blib/lib/ULDE/FileStorage/employee discipline & grievances (713) 14-6-2016.pdf \
	  lib/ULDE/Web/Service/SOAP/Ineus.pm blib/lib/ULDE/Web/Service/SOAP/Ineus.pm \
	  lib/ULDE/FileStorage/employee discipline & grievances (683) 9-6-2016.pdf blib/lib/ULDE/FileStorage/employee discipline & grievances (683) 9-6-2016.pdf \
	  lib/ULDE/Web/Service/SOAP/Server/Ineus.pm blib/lib/ULDE/Web/Service/SOAP/Server/Ineus.pm \
	  lib/ULDE/Component/Product/Instance.pm blib/lib/ULDE/Component/Product/Instance.pm \
	  lib/ULDE/Web/Model/Component/ServiceDefinition.pm blib/lib/ULDE/Web/Model/Component/ServiceDefinition.pm \
	  lib/ULDE/FileStorage/powers of attorney (717) 15-6-2016.pdf blib/lib/ULDE/FileStorage/powers of attorney (717) 15-6-2016.pdf \
	  lib/ULDE/FileStorage/managing staff (706) 13-6-2016.pdf blib/lib/ULDE/FileStorage/managing staff (706) 13-6-2016.pdf \
	  lib/ULDE/Component/Account/Customer.pm blib/lib/ULDE/Component/Account/Customer.pm \
	  lib/ULDE/FileStorage/probate (649) 24-4-2016.pdf blib/lib/ULDE/FileStorage/probate (649) 24-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/Address.pm blib/lib/ULDE/Schema/ULDE/Result/Address.pm \
	  lib/ULDE/Component/Jurisdiction.pm blib/lib/ULDE/Component/Jurisdiction.pm \
	  lib/ULDE/Web/Controller/HelpCentre.pm blib/lib/ULDE/Web/Controller/HelpCentre.pm 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/FileStorage/sales & marketing (696) 13-6-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (696) 13-6-2016.pdf \
	  lib/ULDE/Web/Component/Form/Template/._Rename.pm blib/lib/ULDE/Web/Component/Form/Template/._Rename.pm \
	  lib/ULDE/Schema/ULDE/Result/ReviewService.pm blib/lib/ULDE/Schema/ULDE/Result/ReviewService.pm \
	  lib/ULDE/Web/Service/REST/ELE.pm blib/lib/ULDE/Web/Service/REST/ELE.pm \
	  lib/ULDE/FileStorage/employing staff (725) 20-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (725) 20-6-2016.pdf \
	  lib/ULDE/FileStorage/probate (756) 16-9-2016.pdf blib/lib/ULDE/FileStorage/probate (756) 16-9-2016.pdf \
	  lib/ULDE/Component/ForeignProvider.pm blib/lib/ULDE/Component/ForeignProvider.pm \
	  lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/ragnar@signal.bz - bbggttrr blib/lib/ULDE/Web/Service/WebSite/ELE/CookieJarStorage/ragnar@signal.bz - bbggttrr \
	  lib/ULDE/Schema/ULDE/Result/ProductDiscount.pm blib/lib/ULDE/Schema/ULDE/Result/ProductDiscount.pm \
	  lib/ULDE/FileStorage/powers of attorney (665) 27-4-2016.pdf blib/lib/ULDE/FileStorage/powers of attorney (665) 27-4-2016.pdf \
	  lib/ULDE/Web/Controller/Account.pm blib/lib/ULDE/Web/Controller/Account.pm \
	  lib/ULDE/FileStorage/managing staff (599) 22-4-2016.pdf blib/lib/ULDE/FileStorage/managing staff (599) 22-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ReviewerCustomer.pm blib/lib/ULDE/Schema/ULDE/Result/ReviewerCustomer.pm \
	  lib/ULDE/Web/Component/Form/Payment/Basket.pm blib/lib/ULDE/Web/Component/Form/Payment/Basket.pm \
	  lib/ULDE/Web/Model/Component/Reviewer.pm blib/lib/ULDE/Web/Model/Component/Reviewer.pm \
	  lib/ULDE/Web/Component/Form/Product/MainCategory.pm blib/lib/ULDE/Web/Component/Form/Product/MainCategory.pm \
	  lib/ULDE/Component/Product/Template.pm blib/lib/ULDE/Component/Product/Template.pm \
	  lib/ULDE/FileStorage/employing staff (763) 29-9-2016.pdf blib/lib/ULDE/FileStorage/employing staff (763) 29-9-2016.pdf \
	  lib/ULDE/FileStorage/dealing with an estate (698) 14-6-2016.pdf blib/lib/ULDE/FileStorage/dealing with an estate (698) 14-6-2016.pdf \
	  lib/ULDE/Web/Component/Form/Product/._MainCategory.pm blib/lib/ULDE/Web/Component/Form/Product/._MainCategory.pm \
	  lib/ULDE/FileStorage/employing staff (691) 10-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (691) 10-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/DocumentTemplateVersion.pm blib/lib/ULDE/Schema/ULDE/Result/DocumentTemplateVersion.pm \
	  lib/ULDE/FileStorage/employee discipline & grievances (586) 19-4-2016.pdf blib/lib/ULDE/FileStorage/employee discipline & grievances (586) 19-4-2016.pdf \
	  lib/ULDE/FileStorage/managing staff (646) 24-4-2016.pdf blib/lib/ULDE/FileStorage/managing staff (646) 24-4-2016.pdf 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Schema/ULDE/Result/DiscountVoucher.pm blib/lib/ULDE/Schema/ULDE/Result/DiscountVoucher.pm \
	  lib/ULDE/Component/ServiceLevel/Product.pm blib/lib/ULDE/Component/ServiceLevel/Product.pm \
	  lib/ULDE/Web/Component/Form/Field/Mobile.pm blib/lib/ULDE/Web/Component/Form/Field/Mobile.pm \
	  lib/ULDE/FileStorage/business startup (664) 27-4-2016.pdf blib/lib/ULDE/FileStorage/business startup (664) 27-4-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/Message.pm blib/lib/ULDE/Schema/ULDE/Result/Message.pm \
	  lib/ULDE/Schema/ULDE/Result/ProductFeeDiscount.pm blib/lib/ULDE/Schema/ULDE/Result/ProductFeeDiscount.pm \
	  lib/ULDE/FileStorage/probate (753) 16-9-2016.pdf blib/lib/ULDE/FileStorage/probate (753) 16-9-2016.pdf \
	  lib/ULDE/Web/Model/Web/Component/Form/Login.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Login.pm \
	  lib/ULDE/Web/Controller/API/REST.pm blib/lib/ULDE/Web/Controller/API/REST.pm \
	  lib/ULDE/FileStorage/business startup (680) 15-6-2016.pdf blib/lib/ULDE/FileStorage/business startup (680) 15-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/Associate.pm blib/lib/ULDE/Schema/ULDE/Result/Associate.pm \
	  lib/ULDE/Schema/ULDE/Result/CustomerAccount.pm blib/lib/ULDE/Schema/ULDE/Result/CustomerAccount.pm \
	  lib/ULDE/FileStorage/sales & marketing (660) 25-4-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (660) 25-4-2016.pdf \
	  lib/ULDE/FileStorage/managing staff (673) 9-5-2016.pdf blib/lib/ULDE/FileStorage/managing staff (673) 9-5-2016.pdf \
	  lib/ULDE/Component/Message.pm blib/lib/ULDE/Component/Message.pm \
	  lib/ULDE/Schema/ULDE/Result/EleServiceOption.pm blib/lib/ULDE/Schema/ULDE/Result/EleServiceOption.pm \
	  lib/ULDE/Web/Service/WebSite/ELE.pm blib/lib/ULDE/Web/Service/WebSite/ELE.pm \
	  lib/ULDE/Component/ReviewServiceResponsibility/Code.pm blib/lib/ULDE/Component/ReviewServiceResponsibility/Code.pm \
	  lib/ULDE/Web/Model/Component/Code.pm blib/lib/ULDE/Web/Model/Component/Code.pm \
	  lib/ULDE/Schema/ULDE/Result/LegalCategory.pm blib/lib/ULDE/Schema/ULDE/Result/LegalCategory.pm \
	  lib/ULDE/Web/View/JSON.pm blib/lib/ULDE/Web/View/JSON.pm \
	  lib/ULDE/Web/Model/Web/Component/Form/Template/SignOff.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Template/SignOff.pm \
	  lib/ULDE/Web.pm blib/lib/ULDE/Web.pm \
	  lib/ULDE/FileStorage/employing staff (725) 16-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (725) 16-6-2016.pdf \
	  lib/ULDE/FileStorage/employee discipline & grievances (692) 10-6-2016.pdf blib/lib/ULDE/FileStorage/employee discipline & grievances (692) 10-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ProductServiceDefinition.pm blib/lib/ULDE/Schema/ULDE/Result/ProductServiceDefinition.pm 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Schema/ULDE/Result/UldeSubCategory.pm blib/lib/ULDE/Schema/ULDE/Result/UldeSubCategory.pm \
	  lib/ULDE/Schema/ULDE/Result/DocumentTemplate.pm blib/lib/ULDE/Schema/ULDE/Result/DocumentTemplate.pm \
	  lib/ULDE/Component/ReviewServiceResponsibility/._Reviewer.pm blib/lib/ULDE/Component/ReviewServiceResponsibility/._Reviewer.pm \
	  lib/ULDE/FileStorage/employee discipline & grievances (741) 9-7-2016.pdf blib/lib/ULDE/FileStorage/employee discipline & grievances (741) 9-7-2016.pdf \
	  lib/ULDE/Config.pm blib/lib/ULDE/Config.pm \
	  lib/ULDE/Schema/ULDE/Result/HttpSession.pm blib/lib/ULDE/Schema/ULDE/Result/HttpSession.pm \
	  lib/ULDE/Schema/ULDE/Result/HttpSessionProduct.pm blib/lib/ULDE/Schema/ULDE/Result/HttpSessionProduct.pm \
	  lib/ULDE/Component/DiscountVoucher.pm blib/lib/ULDE/Component/DiscountVoucher.pm \
	  lib/ULDE/Schema/ULDE/Result/ActivityProductInstance.pm blib/lib/ULDE/Schema/ULDE/Result/ActivityProductInstance.pm \
	  lib/ULDE/Component/ReviewServiceResponsibility.pm blib/lib/ULDE/Component/ReviewServiceResponsibility.pm \
	  lib/ULDE/FileStorage/sales & marketing (584) 19-4-2016.pdf blib/lib/ULDE/FileStorage/sales & marketing (584) 19-4-2016.pdf \
	  lib/ULDE/FileStorage/debt management & collection (751) 16-9-2016.pdf blib/lib/ULDE/FileStorage/debt management & collection (751) 16-9-2016.pdf \
	  lib/ULDE/FileStorage/employing staff (730) 20-6-2016.pdf blib/lib/ULDE/FileStorage/employing staff (730) 20-6-2016.pdf \
	  lib/ULDE/Schema/ULDE/Result/ActivityCode.pm blib/lib/ULDE/Schema/ULDE/Result/ActivityCode.pm \
	  lib/ULDE/Component/LegalCategory.pm blib/lib/ULDE/Component/LegalCategory.pm \
	  lib/ULDE/Component/Customer.pm blib/lib/ULDE/Component/Customer.pm \
	  lib/ULDE/FileStorage/._debt management & collection (484) 4-8-2015.pdf blib/lib/ULDE/FileStorage/._debt management & collection (484) 4-8-2015.pdf \
	  lib/ULDE/FileStorage/debt management & collection (484) 4-8-2015.pdf blib/lib/ULDE/FileStorage/debt management & collection (484) 4-8-2015.pdf \
	  lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibility.pm blib/lib/ULDE/Schema/ULDE/Result/ReviewServiceResponsibility.pm \
	  lib/ULDE/Component/Referrer.pm blib/lib/ULDE/Component/Referrer.pm \
	  lib/ULDE/Web/Model/Web/Component/Form/Reviewer.pm blib/lib/ULDE/Web/Model/Web/Component/Form/Reviewer.pm \
	  lib/ULDE/Web/Component/Form/Template/Rename.pm blib/lib/ULDE/Web/Component/Form/Template/Rename.pm \
	  lib/ULDE/Component/Address.pm blib/lib/ULDE/Component/Address.pm \
	  lib/ULDE/Web/Component/Form/Template.pm blib/lib/ULDE/Web/Component/Form/Template.pm \
	  lib/ULDE/Schema/ULDE/Result/ReviewAccountability.pm blib/lib/ULDE/Schema/ULDE/Result/ReviewAccountability.pm 
	$(NOECHO) $(ABSPERLRUN) -MExtUtils::Install -e 'pm_to_blib({@ARGV}, '\''$(INST_LIB)/auto'\'', q[$(PM_FILTER)], '\''$(PERM_DIR)'\'')' -- \
	  lib/ULDE/Schema/ULDE/Result/StatusCode.pm blib/lib/ULDE/Schema/ULDE/Result/StatusCode.pm \
	  lib/ULDE/Component/PurchaseTransaction.pm blib/lib/ULDE/Component/PurchaseTransaction.pm \
	  lib/ULDE/FileStorage/business startup (726) 20-6-2016.pdf blib/lib/ULDE/FileStorage/business startup (726) 20-6-2016.pdf \
	  lib/ULDE/FileStorage/managing staff (748) 25-7-2016.pdf blib/lib/ULDE/FileStorage/managing staff (748) 25-7-2016.pdf \
	  lib/ULDE/FileStorage/employing staff (593) 22-4-2016.pdf blib/lib/ULDE/FileStorage/employing staff (593) 22-4-2016.pdf 
	$(NOECHO) $(TOUCH) pm_to_blib


# --- MakeMaker selfdocument section:


# --- MakeMaker postamble section:


# End.
# Postamble by Module::Install 1.19
# --- Module::Install::Admin::Makefile section:

realclean purge ::
	$(RM_F) $(DISTVNAME).tar$(SUFFIX)
	$(RM_F) MANIFEST.bak _build
	$(PERL) "-Ilib" "-MModule::Install::Admin" -e "remove_meta()"
	$(RM_RF) inc

reset :: purge

upload :: test dist
	cpan-upload -verbose $(DISTVNAME).tar$(SUFFIX)

grok ::
	perldoc Module::Install

distsign ::
	cpansign -s

# --- Module::Install::AutoInstall section:

config :: installdeps
	$(NOECHO) $(NOOP)

checkdeps ::
	$(PERL) Makefile.PL --checkdeps

installdeps ::
	$(NOECHO) $(NOOP)

installdeps_notest ::
	$(NOECHO) $(NOOP)

upgradedeps ::
	$(PERL) Makefile.PL --config= --upgradedeps=Test::More,0.88,Catalyst::Runtime,5.90015,Catalyst::Plugin::ConfigLoader,0,Catalyst::Plugin::Static::Simple,0,Catalyst::Plugin::Cache,0.12,Catalyst::Action::RenderView,0,Moose,2.1402,MooseX::ClassAttribute,0.27,namespace::autoclean,0,Config::General,0,Catalyst::View::Mason2,0.03,Catalyst::View::JSON,0.33,Catalyst::Model::Adaptor,0.10,Catalyst::Model::Factory,0.10,Digest::HMAC_SHA1,1.03,HTTP::Date,6.02,HTTP::Response,6.04,LWP::UserAgent,6.06,HTML::TokeParser,3.69,HTML::Summary,0.019,HTML::Tree,5.03,LWP::Protocol::https,6.06,HTTP::Cookies,6.01,URL::Encode,0.03,URI::Escape,3.31,URI,1.67,DBD::Pg,2.19.2,Class::DBI,3.0.17,Data::Serializer::Raw,0.02,MooseX::Traits,0.12,Catalyst::Helper::Model::DBIC::Schema,0.60,Catalyst::Model::DBIC::Schema,0.65,MooseX::MarkAsMethods,0.15,MooseX::NonMoose,0.22,MooseX::UndefTolerant,0,Catalyst::Plugin::Authentication,0.10021,Catalyst::Authentication::Store::DBIx::Class,0.1503,Catalyst::Plugin::Authorization::Roles,0.09,Catalyst::Plugin::Session,0.35,Catalyst::Plugin::Session::State::Cookie,0.17,Catalyst::Plugin::Session::Store::DBIC,0.12,Catalyst::Plugin::DateTime,0.03,Catalyst::Action::REST,1.17,Excel::Writer::XLSX,0.49,Facebook,0.102,Catalyst::Model::Facebook,0.101,Catalyst::Plugin::Session::Store::FastMmap,0.16,HTML::FormHandler,0.40022,HTML::FormHandler::Model::DBIC,0.21,Data::Dumper,0,Config::ZOMG,1.0,DateTime::Format::Pg,0.16010,Text::Stripper,1.16,List::Util,1.41,JSON,2.90,JSON::XS,3.01,String::MkPasswd,0.05,Catalyst::TraitFor::Request::BrowserDetect,0.02

upgradedeps_notest ::
	$(PERL) Makefile.PL --config=notest,1 --upgradedeps=Test::More,0.88,Catalyst::Runtime,5.90015,Catalyst::Plugin::ConfigLoader,0,Catalyst::Plugin::Static::Simple,0,Catalyst::Plugin::Cache,0.12,Catalyst::Action::RenderView,0,Moose,2.1402,MooseX::ClassAttribute,0.27,namespace::autoclean,0,Config::General,0,Catalyst::View::Mason2,0.03,Catalyst::View::JSON,0.33,Catalyst::Model::Adaptor,0.10,Catalyst::Model::Factory,0.10,Digest::HMAC_SHA1,1.03,HTTP::Date,6.02,HTTP::Response,6.04,LWP::UserAgent,6.06,HTML::TokeParser,3.69,HTML::Summary,0.019,HTML::Tree,5.03,LWP::Protocol::https,6.06,HTTP::Cookies,6.01,URL::Encode,0.03,URI::Escape,3.31,URI,1.67,DBD::Pg,2.19.2,Class::DBI,3.0.17,Data::Serializer::Raw,0.02,MooseX::Traits,0.12,Catalyst::Helper::Model::DBIC::Schema,0.60,Catalyst::Model::DBIC::Schema,0.65,MooseX::MarkAsMethods,0.15,MooseX::NonMoose,0.22,MooseX::UndefTolerant,0,Catalyst::Plugin::Authentication,0.10021,Catalyst::Authentication::Store::DBIx::Class,0.1503,Catalyst::Plugin::Authorization::Roles,0.09,Catalyst::Plugin::Session,0.35,Catalyst::Plugin::Session::State::Cookie,0.17,Catalyst::Plugin::Session::Store::DBIC,0.12,Catalyst::Plugin::DateTime,0.03,Catalyst::Action::REST,1.17,Excel::Writer::XLSX,0.49,Facebook,0.102,Catalyst::Model::Facebook,0.101,Catalyst::Plugin::Session::Store::FastMmap,0.16,HTML::FormHandler,0.40022,HTML::FormHandler::Model::DBIC,0.21,Data::Dumper,0,Config::ZOMG,1.0,DateTime::Format::Pg,0.16010,Text::Stripper,1.16,List::Util,1.41,JSON,2.90,JSON::XS,3.01,String::MkPasswd,0.05,Catalyst::TraitFor::Request::BrowserDetect,0.02

listdeps ::
	@$(PERL) -le "print for @ARGV" 

listalldeps ::
	@$(PERL) -le "print for @ARGV" Test::More Catalyst::Runtime Catalyst::Plugin::ConfigLoader Catalyst::Plugin::Static::Simple Catalyst::Plugin::Cache Catalyst::Action::RenderView Moose MooseX::ClassAttribute namespace::autoclean Config::General Catalyst::View::Mason2 Catalyst::View::JSON Catalyst::Model::Adaptor Catalyst::Model::Factory Digest::HMAC_SHA1 HTTP::Date HTTP::Response LWP::UserAgent HTML::TokeParser HTML::Summary HTML::Tree LWP::Protocol::https HTTP::Cookies URL::Encode URI::Escape URI DBD::Pg Class::DBI Data::Serializer::Raw MooseX::Traits Catalyst::Helper::Model::DBIC::Schema Catalyst::Model::DBIC::Schema MooseX::MarkAsMethods MooseX::NonMoose MooseX::UndefTolerant Catalyst::Plugin::Authentication Catalyst::Authentication::Store::DBIx::Class Catalyst::Plugin::Authorization::Roles Catalyst::Plugin::Session Catalyst::Plugin::Session::State::Cookie Catalyst::Plugin::Session::Store::DBIC Catalyst::Plugin::DateTime Catalyst::Action::REST Excel::Writer::XLSX Facebook Catalyst::Model::Facebook Catalyst::Plugin::Session::Store::FastMmap HTML::FormHandler HTML::FormHandler::Model::DBIC Data::Dumper Config::ZOMG DateTime::Format::Pg Text::Stripper List::Util JSON JSON::XS String::MkPasswd Catalyst::TraitFor::Request::BrowserDetect

