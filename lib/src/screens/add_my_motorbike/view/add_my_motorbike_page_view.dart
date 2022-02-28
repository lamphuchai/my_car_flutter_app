import 'package:flutter/material.dart';
import 'package:my_car_flutter_app/src/screens/add_my_motorbike/cubit/add_my_motorbike_cubit.dart';
import 'package:my_car_flutter_app/src/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMyMotorbikePageView extends StatelessWidget {
  const AddMyMotorbikePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Thêm vào"),
        actions: [
          IconButton(
              splashRadius: 24, icon: const Icon(Icons.done), onPressed: () {})
        ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Tên gọi",
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Builder(builder: (context) {
                  final tmp =
                      context.watch<AddMyMotorbikeCubit>().state.nameMotorbike;
                  return Text(tmp);
                }),
              ),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => _buildModalTextField(context,
                  onChanged: (value) => context
                      .read<AddMyMotorbikeCubit>()
                      .changeNameMotorbike(value)),
            ),
            ListTile(
              title: Text(
                "Số km đã đi được",
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Builder(builder: (context) {
                  final tmp =
                      context.watch<AddMyMotorbikeCubit>().state.numberKm;
                  return Text(tmp.toString() + " km");
                }),
              ),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => _buildModalTextField(context,
                  textInputType: TextInputType.number,
                  onChanged: (value) => context
                      .read<AddMyMotorbikeCubit>()
                      .changeNumberKm(int.parse(value)),
                  onEditingComplete: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }

  _buildModalTextField(BuildContext context,
      {required Function(String) onChanged,
      TextInputType? textInputType,
      Function()? onEditingComplete}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Nhập thông tin",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    TextField(
                      onEditingComplete: onEditingComplete,
                      style: const TextStyle(fontSize: 17),
                      keyboardType: textInputType,
                      onChanged: onChanged,
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppButtonLong(
                              color: Colors.red[200],
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Thoát",
                                style: Theme.of(context).textTheme.button,
                              )),
                          AppButtonLong(
                              color: Colors.green,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "OK",
                                style: Theme.of(context).textTheme.button,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
