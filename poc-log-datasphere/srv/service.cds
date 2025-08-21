using poc_log_datasphere.db as servicepoclog from '../db/schema';

@requires: 'authenticated-user'
@cds.query.limit.max: 1000000
service pocdatasphere {
    entity Logs as projection on servicepoclog.Logs;
}