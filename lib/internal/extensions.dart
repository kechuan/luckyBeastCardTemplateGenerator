extension ImmutableCollectionExtension<E> on Iterable<E> {
  List<E> copyWithAdd(E element, {int? index}) {
    final list = toList(); // 拷贝原集合
    if (index != null) {
      list.insert(index, element);
    } else {
      list.add(element);
    }
    return list;
  }

  List<E> copyWithAddAll(List<E> element, {int? index}) {
    final list = toList(); // 拷贝原集合
    if (index != null) {
      list.insertAll(index, element);
    } 
    
    else {
      list.addAll(element);
    }
    return list;
  }

  List<E> copyWithRemove({E? element, int? index}) {
    final list = toList(); // 拷贝原集合
    if (index != null) {
      if (index >= 0 && index < list.length) {
        list.removeAt(index);
      }
    } else if (element != null) {
      list.remove(element);
    }
    return list;
  }

  List<E> copyWithReplace(int index, E newElement) {
    final list = toList();
    if (index >= 0 && index < list.length) {
      list[index] = newElement;
    }
    return list;
  }
}

extension ListExtension<E extends num> on List<E> {
  
  num count(){
    num count = 0;
    for(E num in this){
      count+=num;
    }

    return count;
  }
}