#!/bin/sh

#https://sourceforge.net/p/net-snmp/code/ci/master/tree/local/passtest

#echo "ARG1" $1 >> /tmp/passtest.log
#echo "ARG2" $2 >> /tmp/passtest.log

PLACE=".1.3.6.1.4.1.25728.911"   # NET-SNMP-PASS-MIB::netSnmpPassExamples
REQ="$2"                         # Requested OID

#
#  Process SET requests by simply logging the assigned value
#      Note that such "assignments" are not persistent,
#      nor is the syntax or requested value validated 
#  
if [ "$1" = "-s" ]; then
  case "$2" in
    $PLACE.1.0)  if [ "$3" = integer ]; then 
      if [ "$4" = 1 ]; then 
	echo "reboot"
	reboot;	exit 0;    # npSoftReboot.0
      fi
    fi;;
    $PLACE.2.0)  if [ "$3" = integer ]; then 
      if [ "$4" = 1 ]; then 
	echo "network restart"
	/etc/init.d/network restart; exit 0;	    # npResetStack.0
      fi
    fi;;

    *)         	    exit 0 ;;
  esac

fi

#
#  GETNEXT requests - determine next valid instance
#
if [ "$1" = "-n" ]; then
#  echo "REQ" $REQ >> /tmp/passtest.log
  case "$REQ" in
    $PLACE|		\
    $PLACE.0|		\
    $PLACE.0.*|		\
    $PLACE.1)       RET=$PLACE.1.0;;     # netSnmpPassString.0
    $PLACE.1.*|		\
    $PLACE.2|		\
    $PLACE.2)     RET=$PLACE.2.0;;     # netSnmpPassString.0
    *)         	  RET=".1.3.6.1.4.1.25728.3800.1"; exit 0 ;;
  esac
else
#
#  GET requests - check for valid instance
#
	echo "check valid instance" >> /tmp/passtest.log
# echo "$REQ" >> /tmp/passtest.log
    case "$REQ" in
      $PLACE.1.0|	\
      $PLACE.2.0)     RET=$REQ ;;     # netSnmpPassString.0
      *)        	    exit 0 ;;
    esac

fi

#
#  "Process" GET* requests - return hard-coded value
#
echo "$RET"
case "$RET" in
  $PLACE.1.0)     echo "integer";   echo "0"; exit 0 ;;
  $PLACE.2.0)     echo "integer";   echo "0"; exit 0 ;;
  *)              echo "string";    echo "ack... $RET $REQ";                   exit 0 ;;  # Should not happen
esac



