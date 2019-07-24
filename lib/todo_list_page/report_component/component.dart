import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

export 'state.dart';

class ResportComponent extends Component<ReportState> {
  ResportComponent()
    : super(
        view: buildView,
    );
}