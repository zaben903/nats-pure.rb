# Copyright 2021 The NATS Authors
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module NATS

  class Error < StandardError; end

  module IO

    class Error < ::NATS::Error; end

    # When the NATS server sends us an 'ERR' message.
    class ServerError < Error; end

    # When we detect error on the client side.
    class ClientError < Error; end

    # When we cannot connect to the server (either initially or after a reconnect).
    class ConnectError < Error; end

    # When we cannot connect to the server because authorization failed.
    class AuthError < ConnectError; end

    # When we cannot connect since there are no servers available.
    class NoServersError < ConnectError; end

    # When there are no subscribers available to respond.
    class NoRespondersError < ConnectError; end

    # When the connection exhausts max number of pending pings replies.
    class StaleConnectionError < Error; end

    # When we do not get a result within a specified time.
    class Timeout < Error; end

    # When there is an i/o timeout with the socket.
    class SocketTimeoutError < Error; end

    # When we use an invalid subject.
    class BadSubject < Error; end

    # When a subscription hits the pending messages limit.
    class SlowConsumer < Error; end
  end
end
