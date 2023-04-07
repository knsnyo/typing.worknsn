import server from '@/server';
import { SERVER_PORT, SERVER_URL } from '@/constants/constants';

server.listen(parseInt(SERVER_PORT!), SERVER_URL!);
