import { Good, GoodBrand, GoodType } from "../../database/relations";
import ErrorException from "../error/ErrorException";
import ModelException from "../error/ModelException";
import { isModelExists } from "../functions/checkModel";

export default class GoodService {
    static async createGood(goodParams) {
        const goodType = goodParams.type
        const goodBrand = goodParams.brand
        if(!goodType || !goodBrand) throw ErrorException.NotFound('Data was not transmitted')

        const type = await GoodType.findOne({ where: { goodType: goodType } });
        const brand = await GoodBrand.findOne({where: {goodBrand: goodBrand }})
        if (!type || !brand) throw ModelException.ModelNotFound("This type or brand does not exist");

        const good = await Good.create({
            ...goodParams,
            goodTypeId: type.dataValues.id,
            goodBrandId: brand.dataValues.id
        });

        return good;
    }

    static async getGood(goodId) {
        const good = await Good.findOne({where: {id: goodId}})

        return good
    }

    static async getGoods() {
        const goods = await Good.findAndCountAll({include: [GoodType, GoodBrand]});
        return goods;
    }
}
