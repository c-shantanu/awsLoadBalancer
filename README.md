# awsLoadBalancer


## Difference between Public & Private LoadBalancer

| **Feature**                        | **Internal Load Balancer**                                     | **External Load Balancer**                                     |
|------------------------------------|----------------------------------------------------------------|----------------------------------------------------------------|
| **Visibility**                     | Only accessible within a VPC (private)                         | Accessible over the internet (public)                          |
| **Purpose**                        | Typically used for internal applications, backend services, or microservices within a VPC | Used for public-facing applications accessible to external users |
| **Access Control**                 | Restricted to VPC or specific peering connections              | Accessible by any device on the internet, unless restricted by security groups or firewalls |
| **Security Groups**                | Security groups can restrict traffic within the VPC            | Security groups are used to restrict traffic from the internet |
| **DNS Naming**                     | Provides a DNS name that resolves to private IPs within the VPC | Provides a DNS name that resolves to public IPs |
| **Use Cases**                      | Databases, internal APIs, application servers, microservices   | Web servers, public APIs, mobile app backends |
| **Example AWS Service**            | AWS Internal Application Load Balancer (ALB), Network Load Balancer (NLB) | AWS External Application Load Balancer (ALB), Network Load Balancer (NLB) |
| **Traffic Source**                 | Instances, services, and resources within the VPC              | Users, devices, and services from outside the VPC (internet)   |
| **Cost**                           | Often cheaper due to reduced data transfer charges (within VPC) | May incur additional data transfer charges (internet-bound)    |
| **Subnet Requirements**            | Placed in private subnets                                      | Placed in public subnets                                        |

***

## Difference between ALB & NLB

| **Feature**                      | **Application Load Balancer (ALB)**                             | **Network Load Balancer (NLB)**                                |
|----------------------------------|----------------------------------------------------------------|---------------------------------------------------------------|
| **Protocol Support**             | HTTP, HTTPS, WebSocket                                         | TCP, UDP, TLS, TCP_UDP                                        |
| **Layer**                        | Operates at Layer 7 (Application Layer)                        | Operates at Layer 4 (Transport Layer)                         |
| **Routing**                      | Content-based routing (host, path, headers)                    | Connection-based routing (source IP, destination IP, ports)   |
| **Performance**                  | Suitable for web applications, supports slow start mode        | High performance, suitable for real-time, low-latency apps    |
| **Health Checks**                | Supports HTTP/HTTPS health checks with detailed options        | Basic TCP/SSL health checks                                   |
| **TLS Termination**              | Supports TLS termination                                       | Supports TLS pass-through and TLS termination                 |
| **Target Types**                 | Instances, IP addresses, Lambda functions                      | Instances, IP addresses, Application Load Balancers           |
| **Sticky Sessions**              | Supports sticky sessions (session affinity)                    | Sticky sessions not supported                                 |
| **Logging**                      | Supports detailed request logging                              | Supports flow logs                                            |
| **Use Cases**                    | Web applications, microservices, containerized apps            | High-performance apps, gaming, real-time communications       |
| **Cross-Zone Load Balancing**    | Enabled by default                                             | Optional, can be enabled or disabled                          |
| **Connection Handling**          | Handles up to millions of requests per second                  | Handles millions of requests per second with ultra-low latency|
| **IP Address Type**              | Supports IPv4 and IPv6                                          | Supports IPv4 and IPv6                                        |
| **Pricing**                      | Based on Load Balancer Capacity Units (LCUs)                    | Based on Load Balancer Capacity Units (LCUs), usually lower due to simpler operations |

***

