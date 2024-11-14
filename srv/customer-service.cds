using {com.logali as logali} from '../db/schema';

service SaleOrder {

    entity zorden_EP as projection on logali.zorden_EP;
    entity zitems_EP as projection on logali.zitems_EP;

}
