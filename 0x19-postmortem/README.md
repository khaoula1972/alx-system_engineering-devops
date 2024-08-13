**Postmortem: Outage of User Authentication Service**

![WELL..](https://drive.google.com/file/d/1-uPxzRKqNZmkY5OvAVUxhLx06Yq2ddf2/view?usp=sharing)

**Issue Summary:**

- **Duration:** August 12, 2024, 14:00 - 16:30 UTC
- **Impact:** The User Authentication Service was down, affecting approximately 70% of users. Users experienced errors during login attempts, and no new accounts could be created.
- **Root Cause:** A misconfigured load balancer was directing traffic to an unresponsive backend server.

**Timeline:**

- **14:00 UTC** - Issue detected when multiple users reported login failures via the support channel.
- **14:05 UTC** - Monitoring alerts flagged a high rate of 5xx errors on the authentication service.
- **14:15 UTC** - Initial investigation revealed the load balancer was routing requests to the wrong server cluster. Assumed root cause was a potential misconfiguration in the load balancer settings.
- **14:30 UTC** - Misleading investigation paths included checking the database connection and application logs, which showed no issues.
- **14:45 UTC** - Incident escalated to the infrastructure team for deeper investigation into load balancer configurations.
- **15:00 UTC** - The infrastructure team identified that a recent change to the load balancer configuration had inadvertently excluded a key server pool from traffic routing.
- **15:30 UTC** - The load balancer configuration was corrected, and traffic was properly routed to the responsive servers.
- **16:00 UTC** - Service was restored, and the authentication functionality was fully operational again.
- **16:30 UTC** - Post-incident verification confirmed that all systems were stable and functioning normally.

**Root Cause and Resolution:**

![HUH! not my issue](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0MrLjQqaNCeOBo2X7bZhgGKusEKqsfRg1_g&s)

- **Root Cause:** The outage was caused by a misconfigured load balancer setting. A recent change to the load balancer configuration inadvertently excluded a critical backend server pool from receiving traffic. This resulted in the majority of requests being directed to a non-responsive server.
- **Resolution:** The load balancer configuration was corrected to include the previously excluded server pool. Once this was done, traffic was properly distributed, and the User Authentication Service resumed normal operations.

**Corrective and Preventative Measures:**

- **Improvements/Fixes:**
  - Implement a more rigorous review process for configuration changes to prevent inadvertent exclusions of critical server pools.
  - Enhance monitoring and alerting to include notifications for unusual patterns in load balancer traffic and backend server response rates.

- **Tasks:**
  - Review and update the load balancer configuration change process to include additional checks and validations.
  - Add a pre-deployment checklist to verify that all server pools are correctly included in traffic routing configurations.
  - Implement additional monitoring for load balancer configurations and set up alerts for deviations from expected traffic patterns.
  - Conduct a post-mortem review of recent configuration changes to ensure no similar issues are present elsewhere in the system.


![I want a vacay](https://i.chzbgr.com/full/9799536384/h52C13B5E/animal-going-on-vacation-take-with)
