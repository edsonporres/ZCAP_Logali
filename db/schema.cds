namespace com.logali;

type ZDE_MEINS : String(2);

entity zorden_EP {
  key id           : String(36) not null;
      email        : String(30);
      firstname    : String(30);
      lastname     : String(30);
      country      : String(30);
      createon     : Date default $now;
      deliverydate : DateTime;
      orderstatus  : Integer enum {
        Open     = 1;
        Accepted = 2;
        Refused  = 3;
      };
      imageurl     : String;
      ItemsID      : String(4) not null;
      Items        : Association to zitems_EP
                     on Items.id_item = ItemsID;
}

entity zitems_EP {
  key id               : String(36) not null;
  key id_item          : String(4) not null;
      name             : localized String(40);
      description      : localized String(40);
      releasedate      : Date;
      discontinueddate : Date;
      price            : Decimal(12, 2);
      height           : Decimal(15, 3);
      width            : Decimal(13, 3);
      depth            : Decimal(12, 2);
      quantity         : Decimal(16, 2);
      unitofmeasure    : ZDE_MEINS;
      Orders           : Association to zorden_EP;
}

entity SelOrden     as select * from zorden_EP;
entity SelItems     as select * from zitems_EP;
entity ProjSelOrden as projection on zorden_EP;
entity ProjSelItems as projection on zitems_EP;
