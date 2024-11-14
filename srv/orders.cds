using com.training as training from '../db/training';

service ManageOrders {
    type cancelOrderReturn {
        status  : String enum {
            Succeeded;
            Failed;
        };
        message : String
    };

    entity GetOrders   as projection on training.zorden_EP;
    entity CreateOrder as projection on training.zorden_EP;
    entity UpdateOrder as projection on training.zorden_EP;
    entity DeleteOrder as projection on training.zorden_EP;
  //  action cancelOrder(id : String(36)) returns cancelOrderReturn;
}
