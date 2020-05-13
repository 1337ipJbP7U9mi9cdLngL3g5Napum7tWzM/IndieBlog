import 'css/post_index';
import 'css/post_show';


const importAll = (r) => r.keys().map(r)
importAll(require.context('../images', false, /\.(png|jpe?g|svg)$/));
