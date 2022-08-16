package Timer;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {
  set serializer => '';
  content_type 'text/html';
  template 'index' => { 'title' => 'Timer' };
};

get '/timer' => sub {
  return [{
    id => 'abcde',
    dir => 'up',
    start => '2022-08-07T15:58:30',
  }, {
    id => 'bcdef',
    dir => 'down',
    start => '2022-08-01T00:00:00',
  }];
};

get '/timer/:id' => sub {
  return {
    id => 'abcde',
    dir => 'up',
    start => '2022-08-07T15:58:30',
  };
};

post '/timer' => sub {
  return {
    status => 200,
    id     => 'abcde',
  };
};

true;
