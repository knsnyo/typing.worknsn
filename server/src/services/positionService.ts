import Position from '@/models/Position';
import { NotFoundError, ParamsError } from '@/utils/Error';

const positionService = {
  level: (level: string): string => {
    const lv: number = parseInt(level);
    if (isNaN(lv)) {
      throw new ParamsError('PARAMS IS NOT NUMBER');
    }
    const letter: string = Position.select(lv);
    if (!letter) {
      throw new NotFoundError(`LETTER IS NOT FOUND`);
    }
    return letter;
  },
};

export default positionService;
