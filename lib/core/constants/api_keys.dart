class ApiKeys {
  ApiKeys._();

  /// base url
  static const String baseUrl = 'https://dev2.osaned.com:8055/';

  /// main branches
  static const String _api = 'Api/';
  static const String _v1 = '${_api}V1/';
  static const String _auth = '${_v1}Authentication/';
  static const String report = '${_api}report/';
  static const String purchase = '${_api}purchase/';
  static const String receive = '${_api}GRN/';

  /// auth
  static const String login = '${_auth}SignIn';
  static const String sendEmail = '${_auth}SendResetPasswordCode';
  static const String verifyCodeUrl = '${_auth}ConfirmResetPasswordCode';
  static const String resetPassword = '${_auth}ResetPassword';

  //preventive maintenance
  static const String preventiveMaintenanceScenarios =
      '${_v1}PreventiveMaintenanceScenarios/Get';
  static const String getEmployee =
      '${_v1}PreventiveMaintenanceScenarios/GetEmployess';
  static const String deletePreventiveMaintenance =
      '${_v1}PreventiveMaintenanceScenarios/Delete';
   static const String savePreventiveMaintenance =
      '${_v1}PreventiveMaintenanceScenarios/Save';
  static const String updatePreventiveMaintenance =
      '${_v1}PreventiveMaintenanceScenarios/Update';


//New Services Order
  static const String getOrderSelect =
      '${_v1}GetPagesSelect/NewOrderSelect';

  static const String savePrefix =
      '${_v1}ServicesOrderPrefix/Save';
  static const String getCustomer =
      '${_v1}GetPagesSelect/GetDynamicCustomer';
  static const String getInstillationGroup =
      '${_v1}GetPagesSelect/GetDynamicInstilationGroup';
  static const String getItem =
      '${_v1}GetPagesSelect/GetDynamicAllItems';
  static const String getSerialNumber =
      '${_v1}GetPagesSelect/GetDynamicSerialNumber';
//Customer

  static const String getCustomerSelect = '${_v1}Customer/GetSelectList';
  static const String getCity= '${_v1}Customer/GetCityList';
  static const String saveCustomer= '${_v1}Customer/Save';
// item
  static const String getItemSelect = '${_v1}Item/GetSelectList';
  static const String saveItem  = '${_v1}Item/Save';
  // item


  static const String saveSerialNumber  = '${_v1}SerializedItem/Save';


//InstallationGroup
  static const String saveInstallationGroup= '${_v1}InstallationGroup/Save';
  //Services Order
  static const String getServicesOrder = '${_v1}ServicesOrder/Get';
  static const String saveServicesOrder = '${_v1}ServicesOrder/Save';
  static const String deleteServicesOrder = '${_v1}ServicesOrder/Delete';
  static const String updateStatus = '${_v1}ServicesOrder/UpdateStatus';
  static const String getServicesOrderActivities =
      '${_v1}ServicesOrderActivities/Get';
  static const String deleteServicesOrderActivities =
      '${_v1}ServicesOrderActivities/Delete';
  static const String saveServicesOrderActivities =
      '${_v1}ServicesOrderActivities/Save';
  static const String updateServicesOrderActivities =
      '${_v1}ServicesOrderActivities/Update';
  static const String getServicesOrderMaterial  =
      '${_v1}ServicesOrderMaterial/Get';
  static const String deleteServicesOrderMaterial =
      '${_v1}ServicesOrderMaterial/Delete';
  static const String saveServicesOrderMaterial =
      '${_v1}ServicesOrderMaterial/Save';
  static const String updateServicesOrderMaterial =
      '${_v1}ServicesOrderMaterial/Update';
  static const String getServicesOrderAssignments =
      '${_v1}ServicesOrderAssignments/Get';
  static const String getAssignmentSelect =
      '${_v1}GetPagesSelect/GetNewAssignmentSelect';
  static const String deleteServicesOrderAssignments =
      '${_v1}ServicesOrderAssignments/Delete';
  static const String saveServicesOrderAssignments =
      '${_v1}ServicesOrderAssignments/Save';
  static const String updateServicesOrderAssignments =
      '${_v1}ServicesOrderAssignments/Update';
  static const String getServicesOrderOther = '${_v1}ServicesOrderOther/Get';
  static const String deleteServicesOrderOther =
      '${_v1}ServicesOrderOther/Delete';
  static const String saveServicesOrderOther = '${_v1}ServicesOrderOther/Save';
  static const String updateServicesOrderOther =
      '${_v1}ServicesOrderOther/Update';
  static const String getItemInformation =
      '${_v1}ServicesOrderMaterial/GetItemDetail';


  //insights analytics
  static const String getMaintenanceCosts =
      '${_v1}InsightsAnalytics/MaintenanceCosts';
  static const String getBreakdownData =
      '${_v1}InsightsAnalytics/BreakdownData';

  static const String getGenerateMaintenanceDetails =
      '${_v1}GenerateMaintenance/GetSelect';
  static const String getReferenceActivitiesPM =
      '${_v1}PreventiveMaintenanceScenarioLines/Get';
  static const String deleteReferenceActivitiesPM =
      '${_v1}PreventiveMaintenanceScenarioLines/Delete';
  static const String saveReferenceActivitiesPM =
      '${_v1}PreventiveMaintenanceScenarioLines/Save';
  static const String updateReferenceActivitiesPM =
      '${_v1}PreventiveMaintenanceScenarioLines/Update';

  /// note

  static const String getServiceOrderActivityNotes =
      '${_v1}AddNote/GetServiceOrderActivityNotes';
  static const String getServiceOrderAssignmentNotes =
      '${_v1}AddNote/GetServiceOrderAssignmentNotes';
  static const String addServiceOrderActivityNotes =
      '${_v1}AddNote/AddServiceOrderActivityNotes';
  static const String addServiceOrderAssignmentNotes =
      '${_v1}AddNote/AddServiceOrderAssignmentNotes';
  static const String getServiceOrderOtherNotes =
      '${_v1}AddNote/GetServiceOrderOtherNotes';
  static const String addServiceOrderOtherNotes =
      '${_v1}AddNote/AddServiceOrderOtherNotes';
  static const String getServiceOrderMaterialNotes =
      '${_v1}AddNote/GetServiceOrderMaterialNotes';
  static const String addServiceOrderMaterialNotes =
      '${_v1}AddNote/AddServiceOrderMaterialNotes';
  static const String getGetServiceOrederNotes =
      '${_v1}AddNote/GetServiceOrederNotes';
  static const String addServiceOrderNotes =
      '${_v1}AddNote/AddServiceOrderNotes';
}
