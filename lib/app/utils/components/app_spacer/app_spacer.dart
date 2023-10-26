import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Space extends LeafRenderObjectWidget {
  const Space(this.space, {super.key});

  final double space;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderSpace(space: space);

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderSpace renderObject,) =>
      renderObject.space = space;
}

class RenderSpace extends RenderBox {
  RenderSpace({required double space}) : _space = space;

  double get space => _space;
  double _space;

  set space(double space) {
    if (space == _space) {
      return;
    }
    _space = space;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final direction = (parent as RenderFlex?)?.direction;
    assert(direction != null,
    'Space should not be used outside of a Flex (Row, Column)',);
    if (direction == null) {
      size = Size.zero;
    } else {
      size = Size(direction == Axis.horizontal ? space : 0,
        direction == Axis.vertical ? space : 0,);
    }
  }
}
