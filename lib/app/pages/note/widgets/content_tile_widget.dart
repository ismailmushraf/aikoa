import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Dayly/app/pages/note/note_form/note_form_bloc.dart';
import 'package:Dayly/app/core/components/smart_editor/smart_editor.dart';


class ContentTile extends StatelessWidget {
  ContentTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<NoteFormBloc, NoteFormState>(
        // buildWhen: (p, c) => p.note.child != c.note.child,
        builder: (context, state) {
          return state.note.child.fold(
            () => TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Add text...',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.only(top: 8, bottom: 8),
              ),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            (childId) => SmartTextEditor(pid: childId)
          );
        }
      ),
    );
  }
}