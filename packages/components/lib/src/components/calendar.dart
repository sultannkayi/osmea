import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/typography.dart';
import '../theme/component_dimensions.dart';

enum OsmeaCalendarViewType { day, week, month, year }

enum OsmeaCalendarSelectionMode { single, range, multi }

class OsmeaCalendarEvent {
  final String title;
  final String? description;
  final DateTime start;
  final DateTime? end;
  final Color? color;
  final bool isAllDay;

  const OsmeaCalendarEvent({
    required this.title,
    this.description,
    required this.start,
    this.end,
    this.color,
    this.isAllDay = false,
  });

  bool isOnDate(DateTime date) {
    final DateTime startDate = DateTime(start.year, start.month, start.day);
    final DateTime compareDate = DateTime(date.year, date.month, date.day);

    if (end != null) {
      final DateTime endDate = DateTime(end!.year, end!.month, end!.day);
      return (compareDate.isAtSameMomentAs(startDate) ||
              compareDate.isAfter(startDate)) &&
          (compareDate.isAtSameMomentAs(endDate) ||
              compareDate.isBefore(endDate));
    }

    return compareDate.isAtSameMomentAs(startDate);
  }
}

class OsmeaCalendar extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final ValueChanged<DateTime>? onDateSelected;
  final ValueChanged<List<DateTime>>? onMultiDateSelected;
  final ValueChanged<DateTimeRange>? onRangeSelected;
  final List<OsmeaCalendarEvent>? events;
  final OsmeaCalendarViewType initialViewType;
  final OsmeaCalendarSelectionMode selectionMode;
  final ThemeType themeType;
  final bool showEventIndicator;
  final bool showWeekdays;
  final bool showViewSwitcher;
  final Map<DateTime, List<OsmeaCalendarEvent>>? eventsByDay;
  final Widget Function(BuildContext, OsmeaCalendarEvent)? eventBuilder;
  final Widget Function(BuildContext, DateTime, bool)? dayBuilder;
  final List<DateTime>? selectedDates;
  final DateTimeRange? selectedRange;
  final bool compactMode;

  const OsmeaCalendar({
    Key? key,
    this.initialDate,
    this.minDate,
    this.maxDate,
    this.onDateSelected,
    this.onMultiDateSelected,
    this.onRangeSelected,
    this.events,
    this.initialViewType = OsmeaCalendarViewType.month,
    this.selectionMode = OsmeaCalendarSelectionMode.single,
    required this.themeType,
    this.showEventIndicator = true,
    this.showWeekdays = true,
    this.showViewSwitcher = true,
    this.eventsByDay,
    this.eventBuilder,
    this.dayBuilder,
    this.selectedDates,
    this.selectedRange,
    this.compactMode = false,
  }) : super(key: key);

  @override
  State<OsmeaCalendar> createState() => _OsmeaCalendarState();
}

class _OsmeaCalendarState extends State<OsmeaCalendar> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;
  late List<DateTime> _selectedDates;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late OsmeaCalendarViewType _currentViewType;
  Map<DateTime, List<OsmeaCalendarEvent>> _eventsByDay = {};

  @override
  void initState() {
    super.initState();
    _currentMonth = widget.initialDate ?? DateTime.now();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _selectedDates = widget.selectedDates ?? [_selectedDate];

    if (widget.selectedRange != null) {
      _rangeStart = widget.selectedRange!.start;
      _rangeEnd = widget.selectedRange!.end;
    }

    _currentViewType = widget.initialViewType;

    _initializeEventsByDay();
  }

  void _initializeEventsByDay() {
    if (widget.eventsByDay != null) {
      _eventsByDay = widget.eventsByDay!;
    } else if (widget.events != null) {
      for (var event in widget.events!) {
        DateTime eventDate =
            DateTime(event.start.year, event.start.month, event.start.day);

        if (event.end != null && event.end != event.start) {
          // Multi-day event
          DateTime date = eventDate;
          DateTime endDate =
              DateTime(event.end!.year, event.end!.month, event.end!.day);

          while (date.isBefore(endDate) || date.isAtSameMomentAs(endDate)) {
            if (_eventsByDay[date] == null) {
              _eventsByDay[date] = [];
            }
            _eventsByDay[date]!.add(event);
            date = date.add(Duration(days: 1));
          }
        } else {
          // Single day event
          if (_eventsByDay[eventDate] == null) {
            _eventsByDay[eventDate] = [];
          }
          _eventsByDay[eventDate]!.add(event);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // View Switcher
        if (widget.showViewSwitcher) _buildViewSwitcher(),

        // Calendar Header (Month/Year selector)
        _buildCalendarHeader(),

        // Weekdays Row (for month view)
        if (widget.showWeekdays &&
            _currentViewType == OsmeaCalendarViewType.month)
          _buildWeekdays(),

        // Main Calendar Content
        _buildCalendarBody(),
      ],
    );
  }

  Widget _buildViewSwitcher() {
    return Padding(
      padding: EdgeInsets.only(bottom: ComponentDimensions.spaceS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildViewButton(OsmeaCalendarViewType.day, "Day"),
          SizedBox(width: ComponentDimensions.spaceS),
          _buildViewButton(OsmeaCalendarViewType.week, "Week"),
          SizedBox(width: ComponentDimensions.spaceS),
          _buildViewButton(OsmeaCalendarViewType.month, "Month"),
          SizedBox(width: ComponentDimensions.spaceS),
          _buildViewButton(OsmeaCalendarViewType.year, "Year"),
        ],
      ),
    );
  }

  Widget _buildViewButton(OsmeaCalendarViewType viewType, String label) {
    final isSelected = _currentViewType == viewType;

    return InkWell(
      onTap: () {
        setState(() {
          _currentViewType = viewType;
        });
      },
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ComponentDimensions.spaceS,
          vertical: ComponentDimensions.spaceXXS,
        ),
        decoration: BoxDecoration(
          color: isSelected ? OsmeaColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isSelected
                ? OsmeaColors.primary
                : OsmeaColors.border(widget.themeType),
            width: 0.5,
          ),
        ),
        child: Text(
          label,
          style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
            color: isSelected
                ? Colors.white
                : OsmeaColors.onSurface(widget.themeType),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    String headerText;

    switch (_currentViewType) {
      case OsmeaCalendarViewType.day:
        headerText = DateFormat.yMMMMd().format(_currentMonth);
        break;
      case OsmeaCalendarViewType.week:
        // Get the first day of the week
        final firstDayOfWeek = _getFirstDayOfWeek(_currentMonth);
        final lastDayOfWeek = firstDayOfWeek.add(Duration(days: 6));

        if (firstDayOfWeek.month == lastDayOfWeek.month) {
          // Same month
          headerText =
              "${DateFormat.MMMM().format(firstDayOfWeek)} ${firstDayOfWeek.year}";
        } else if (firstDayOfWeek.year == lastDayOfWeek.year) {
          // Different months, same year
          headerText =
              "${DateFormat.MMM().format(firstDayOfWeek)} - ${DateFormat.MMM().format(lastDayOfWeek)} ${lastDayOfWeek.year}";
        } else {
          // Different months, different years
          headerText =
              "${DateFormat.MMM().format(firstDayOfWeek)} ${firstDayOfWeek.year} - ${DateFormat.MMM().format(lastDayOfWeek)} ${lastDayOfWeek.year}";
        }
        break;
      case OsmeaCalendarViewType.month:
        headerText = DateFormat.yMMMM().format(_currentMonth);
        break;
      case OsmeaCalendarViewType.year:
        headerText = _currentMonth.year.toString();
        break;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.compactMode
            ? ComponentDimensions.spaceXS
            : ComponentDimensions.spaceS,
        horizontal: widget.compactMode
            ? ComponentDimensions.spaceXS
            : ComponentDimensions.spaceM,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: OsmeaColors.onSurface(widget.themeType),
            ),
            onPressed: _previousPeriod,
          ),
          Text(
            headerText,
            style: widget.compactMode
                ? OsmeaTypography.bodyLarge(widget.themeType).copyWith(
                    fontWeight: FontWeight.w600,
                  )
                : OsmeaTypography.h5(widget.themeType),
          ),
          IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: OsmeaColors.onSurface(widget.themeType),
            ),
            onPressed: _nextPeriod,
          ),
        ],
      ),
    );
  }

  Widget _buildWeekdays() {
    final locale = Localizations.localeOf(context).languageCode;
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ComponentDimensions.spaceXXS,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(7, (index) {
          final weekday = firstDayOfWeek.add(Duration(days: index));
          String weekdayName;

          try {
            weekdayName = DateFormat.E(locale).format(weekday);
          } catch (e) {
            // Fallback for locale issues
            const weekdayNames = [
              'Mon',
              'Tue',
              'Wed',
              'Thu',
              'Fri',
              'Sat',
              'Sun'
            ];
            weekdayName = weekdayNames[index % 7];
          }

          return Expanded(
            child: Center(
              child: Text(
                widget.compactMode ? weekdayName[0] : weekdayName,
                style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                  fontWeight: FontWeight.w500,
                  color: OsmeaColors.textSecondary(widget.themeType),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCalendarBody() {
    switch (_currentViewType) {
      case OsmeaCalendarViewType.day:
        return _buildDayView();
      case OsmeaCalendarViewType.week:
        return _buildWeekView();
      case OsmeaCalendarViewType.month:
        return _buildMonthView();
      case OsmeaCalendarViewType.year:
        return _buildYearView();
    }
  }

  Widget _buildDayView() {
    final events = _eventsByDay[DateTime(
          _currentMonth.year,
          _currentMonth.month,
          _currentMonth.day,
        )] ??
        [];

    return Column(
      children: [
        // Day number and day of week
        Container(
          padding:
              EdgeInsets.all(ComponentDimensions.spaceM), // spaceMd -> spaceM
          decoration: BoxDecoration(
            color: OsmeaColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(
                ComponentDimensions.radiusS), // radiusSm -> radiusS
          ),
          child: Column(
            children: [
              Text(
                _currentMonth.day.toString(),
                style: OsmeaTypography.h3(widget.themeType).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat.EEEE().format(_currentMonth),
                style: OsmeaTypography.bodyMedium(widget.themeType),
              ),
            ],
          ),
        ),

        SizedBox(height: ComponentDimensions.spaceM), // spaceMd -> spaceM

        // Events for the day
        if (events.isEmpty)
          Padding(
            padding:
                EdgeInsets.all(ComponentDimensions.spaceM), // spaceMd -> spaceM
            child: Text(
              'Bu gün için etkinlik yok',
              style: OsmeaTypography.bodyMedium(widget.themeType).copyWith(
                color: OsmeaColors.textSecondary(widget.themeType),
              ),
              textAlign: TextAlign.center,
            ),
          )
        else
          Column(
            children: events.map((event) => _buildEventItem(event)).toList(),
          ),
      ],
    );
  }

  Widget _buildWeekView() {
    final firstDayOfWeek = _getFirstDayOfWeek(_currentMonth);

    return Column(
      children: [
        // Weekday header
        Row(
          children: List.generate(7, (index) {
            final date = firstDayOfWeek.add(Duration(days: index));
            final isToday = _isToday(date);
            final isSelected = _isDateSelected(date);

            return Expanded(
              child: GestureDetector(
                onTap: () => _onDayTapped(date),
                child: Container(
                  padding: EdgeInsets.all(
                      ComponentDimensions.spaceXS), // spaceXs -> spaceXS
                  decoration: BoxDecoration(
                    color: isSelected
                        ? OsmeaColors.primary
                        : isToday
                            ? OsmeaColors.primary.withOpacity(0.1)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                        ComponentDimensions.radiusS), // radiusSm -> radiusS
                  ),
                  child: Column(
                    children: [
                      Text(
                        DateFormat.E().format(date)[0],
                        style: OsmeaTypography.bodySmall(widget.themeType)
                            .copyWith(
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : OsmeaColors.textSecondary(widget.themeType),
                        ),
                      ),
                      Text(
                        date.day.toString(),
                        style: OsmeaTypography.bodyLarge(widget.themeType)
                            .copyWith(
                          fontWeight: isToday || isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? Colors.white
                              : OsmeaColors.onSurface(widget.themeType),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),

        SizedBox(height: ComponentDimensions.spaceM), // spaceMd -> spaceM

        // Events for the selected day
        ..._buildEventsForWeek(firstDayOfWeek),
      ],
    );
  }

  List<Widget> _buildEventsForWeek(DateTime firstDayOfWeek) {
    final List<Widget> eventWidgets = [];
    final selectedDate =
        widget.selectionMode == OsmeaCalendarSelectionMode.single
            ? _selectedDate
            : firstDayOfWeek;

    final events = _eventsByDay[DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
        )] ??
        [];

    if (events.isEmpty) {
      eventWidgets.add(
        Padding(
          padding:
              EdgeInsets.all(ComponentDimensions.spaceM), // spaceMd -> spaceM
          child: Text(
            'Seçili gün için etkinlik yok',
            style: OsmeaTypography.bodyMedium(widget.themeType).copyWith(
              color: OsmeaColors.textSecondary(widget.themeType),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      eventWidgets.addAll(
        events.map((event) => _buildEventItem(event)).toList(),
      );
    }

    return eventWidgets;
  }

  Widget _buildMonthView() {
    final daysInMonth =
        _getDaysInMonth(_currentMonth.year, _currentMonth.month);
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: widget.compactMode ? 2 : 4,
        crossAxisSpacing: widget.compactMode ? 2 : 4,
      ),
      itemCount: daysInMonth.length,
      itemBuilder: (context, index) {
        final date = daysInMonth[index];
        final isCurrentMonth = date.month == _currentMonth.month;
        final isToday = _isToday(date);
        final isSelected = _isDateSelected(date);
        final isInRange = _isDateInRange(date);
        final isRangeStart = _isRangeStart(date);
        final isRangeEnd = _isRangeEnd(date);

        return widget.dayBuilder != null
            ? widget.dayBuilder!(context, date, isSelected)
            : _buildDay(date, isCurrentMonth, isToday, isSelected, isInRange,
                isRangeStart, isRangeEnd);
      },
    );
  }

  Widget _buildYearView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        mainAxisSpacing: widget.compactMode ? 8 : 12,
        crossAxisSpacing: widget.compactMode ? 8 : 12,
      ),
      itemCount: 12, // 12 months
      itemBuilder: (context, index) {
        final month = index + 1; // 1-based month
        final date = DateTime(_currentMonth.year, month, 1);
        final isCurrentMonth = DateTime.now().year == date.year &&
            DateTime.now().month == date.month;
        final isSelected = _selectedDate.year == date.year &&
            _selectedDate.month == date.month;

        return GestureDetector(
          onTap: () {
            setState(() {
              _currentMonth = date;
              _currentViewType = OsmeaCalendarViewType.month;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? OsmeaColors.primary
                  : isCurrentMonth
                      ? OsmeaColors.primary.withOpacity(0.1)
                      : OsmeaColors.surface(widget.themeType),
              borderRadius: BorderRadius.circular(
                  ComponentDimensions.radiusS), // radiusSm -> radiusS
              border: Border.all(
                color: OsmeaColors.border(widget.themeType),
                width: 0.5,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              DateFormat.MMM().format(date),
              style: OsmeaTypography.bodyLarge(widget.themeType).copyWith(
                fontWeight: isCurrentMonth || isSelected
                    ? FontWeight.w600
                    : FontWeight.normal,
                color: isSelected
                    ? Colors.white
                    : OsmeaColors.onSurface(widget.themeType),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEventItem(OsmeaCalendarEvent event) {
    final Color eventColor = event.color ?? OsmeaColors.primary;

    return Container(
      margin: EdgeInsets.only(bottom: ComponentDimensions.spaceS),
      padding: EdgeInsets.all(ComponentDimensions.spaceS),
      decoration: BoxDecoration(
        color: OsmeaColors.surface(widget.themeType),
        borderRadius: BorderRadius.circular(
            ComponentDimensions.radiusS), // radiusSm -> radiusS
        border: Border.all(
          color: OsmeaColors.border(widget.themeType),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 36,
            decoration: BoxDecoration(
              color: eventColor,
              borderRadius: BorderRadius.circular(ComponentDimensions.radiusXS),
            ),
          ),
          SizedBox(width: ComponentDimensions.spaceS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: OsmeaTypography.bodyMedium(widget.themeType).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (event.description != null) ...[
                  SizedBox(height: 2),
                  Text(
                    event.description!,
                    style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
                      color: OsmeaColors.textSecondary(widget.themeType),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          Text(
            event.isAllDay
                ? 'Tüm gün'
                : (event.end != null
                    ? '${DateFormat.Hm().format(event.start)} - ${DateFormat.Hm().format(event.end!)}'
                    : DateFormat.Hm().format(event.start)),
            style: OsmeaTypography.bodySmall(widget.themeType).copyWith(
              color: OsmeaColors.textSecondary(widget.themeType),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDay(DateTime date, bool isCurrentMonth, bool isToday,
      bool isSelected, bool isInRange, bool isRangeStart, bool isRangeEnd) {
    final hasEvents =
        _eventsByDay.containsKey(DateTime(date.year, date.month, date.day));

    // Determine background color based on selection state
    Color backgroundColor = Colors.transparent;
    Color textColor = isCurrentMonth
        ? OsmeaColors.onSurface(widget.themeType)
        : OsmeaColors.textSecondary(widget.themeType).withOpacity(0.5);

    BoxDecoration decoration;

    if (isSelected || isRangeStart || isRangeEnd) {
      backgroundColor = OsmeaColors.primary;
      textColor = Colors.white;
      decoration = BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      );
    } else if (isInRange) {
      backgroundColor = OsmeaColors.primary.withOpacity(0.2);
      decoration = BoxDecoration(
        color: backgroundColor,
      );
    } else if (isToday) {
      decoration = BoxDecoration(
        border: Border.all(
          color: OsmeaColors.primary,
          width: 1,
        ),
        shape: BoxShape.circle,
      );
    } else {
      decoration = BoxDecoration();
    }

    return InkWell(
      onTap: isCurrentMonth ? () => _onDayTapped(date) : null,
      borderRadius: BorderRadius.circular(
          ComponentDimensions.radiusCircular), // radiusFull -> radiusCircular
      child: Container(
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${date.day}',
              style: OsmeaTypography.bodyMedium(widget.themeType).copyWith(
                color: textColor,
                fontWeight: isToday || isSelected ? FontWeight.w600 : null,
              ),
            ),
            if (hasEvents && widget.showEventIndicator)
              Container(
                margin: EdgeInsets.only(top: 2),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.white : OsmeaColors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<DateTime> _getDaysInMonth(int year, int month) {
    final firstDayOfMonth = DateTime(year, month, 1);

    // Calculate the first day to show (might be from previous month)
    // Get the weekday of the first day (1 = Monday, 7 = Sunday)
    int firstWeekday = firstDayOfMonth.weekday;
    // If first day is Monday, no need to show days from previous month
    // Otherwise, show days from previous month
    final firstDayToShow =
        firstDayOfMonth.subtract(Duration(days: firstWeekday - 1));

    // Calculate the last day to show (might be from next month)
    // We need to show 42 days (6 weeks) to ensure consistent calendar size
    final daysToShow = 42; // 6 weeks

    // Generate all days
    List<DateTime> days = [];
    for (int i = 0; i < daysToShow; i++) {
      days.add(firstDayToShow.add(Duration(days: i)));
    }

    return days;
  }

  DateTime _getFirstDayOfWeek(DateTime date) {
    // Get the weekday (1 = Monday, 7 = Sunday)
    int weekday = date.weekday;
    // Subtract days to get to Monday
    return date.subtract(Duration(days: weekday - 1));
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isDateSelected(DateTime date) {
    if (widget.selectionMode == OsmeaCalendarSelectionMode.single) {
      return date.year == _selectedDate.year &&
          date.month == _selectedDate.month &&
          date.day == _selectedDate.day;
    } else if (widget.selectionMode == OsmeaCalendarSelectionMode.multi) {
      return _selectedDates.any((selectedDate) =>
          selectedDate.year == date.year &&
          selectedDate.month == date.month &&
          selectedDate.day == date.day);
    }
    return false;
  }

  bool _isDateInRange(DateTime date) {
    if (widget.selectionMode != OsmeaCalendarSelectionMode.range ||
        _rangeStart == null ||
        _rangeEnd == null) {
      return false;
    }

    return (date.isAfter(_rangeStart!) || _isSameDay(date, _rangeStart!)) &&
        (date.isBefore(_rangeEnd!) || _isSameDay(date, _rangeEnd!));
  }

  bool _isRangeStart(DateTime date) {
    if (widget.selectionMode != OsmeaCalendarSelectionMode.range ||
        _rangeStart == null) {
      return false;
    }

    return _isSameDay(date, _rangeStart!);
  }

  bool _isRangeEnd(DateTime date) {
    if (widget.selectionMode != OsmeaCalendarSelectionMode.range ||
        _rangeEnd == null) {
      return false;
    }

    return _isSameDay(date, _rangeEnd!);
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void _onDayTapped(DateTime date) {
    switch (widget.selectionMode) {
      case OsmeaCalendarSelectionMode.single:
        setState(() {
          _selectedDate = date;
          // If we're in day or week view, also update the current month
          if (_currentViewType == OsmeaCalendarViewType.day ||
              _currentViewType == OsmeaCalendarViewType.week) {
            _currentMonth = date;
          }
        });
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(date);
        }
        break;

      case OsmeaCalendarSelectionMode.multi:
        setState(() {
          if (_selectedDates
              .any((selectedDate) => _isSameDay(selectedDate, date))) {
            _selectedDates
                .removeWhere((selectedDate) => _isSameDay(selectedDate, date));
          } else {
            _selectedDates.add(date);
          }
        });
        if (widget.onMultiDateSelected != null) {
          widget.onMultiDateSelected!(_selectedDates);
        }
        break;

      case OsmeaCalendarSelectionMode.range:
        setState(() {
          if (_rangeStart == null ||
              (_rangeStart != null && _rangeEnd != null)) {
            _rangeStart = date;
            _rangeEnd = null;
          } else if (_rangeEnd == null && date.isAfter(_rangeStart!)) {
            _rangeEnd = date;
            if (widget.onRangeSelected != null) {
              widget.onRangeSelected!(
                  DateTimeRange(start: _rangeStart!, end: _rangeEnd!));
            }
          } else if (_rangeEnd == null && !date.isAfter(_rangeStart!)) {
            // If user selects a date before the start date, swap them
            _rangeEnd = _rangeStart;
            _rangeStart = date;
            if (widget.onRangeSelected != null) {
              widget.onRangeSelected!(
                  DateTimeRange(start: _rangeStart!, end: _rangeEnd!));
            }
          }
        });
        break;
    }
  }

  void _previousPeriod() {
    setState(() {
      switch (_currentViewType) {
        case OsmeaCalendarViewType.day:
          _currentMonth = _currentMonth.subtract(Duration(days: 1));
          break;
        case OsmeaCalendarViewType.week:
          _currentMonth = _currentMonth.subtract(Duration(days: 7));
          break;
        case OsmeaCalendarViewType.month:
          _currentMonth =
              DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
          break;
        case OsmeaCalendarViewType.year:
          _currentMonth = DateTime(_currentMonth.year - 1, 1, 1);
          break;
      }
    });
  }

  void _nextPeriod() {
    setState(() {
      switch (_currentViewType) {
        case OsmeaCalendarViewType.day:
          _currentMonth = _currentMonth.add(Duration(days: 1));
          break;
        case OsmeaCalendarViewType.week:
          _currentMonth = _currentMonth.add(Duration(days: 7));
          break;
        case OsmeaCalendarViewType.month:
          _currentMonth =
              DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
          break;
        case OsmeaCalendarViewType.year:
          _currentMonth = DateTime(_currentMonth.year + 1, 1, 1);
          break;
      }
    });
  }
}

// Helper class for date picker
class OsmeaDatePicker extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime>? onDateSelected;
  final ThemeType themeType;
  final bool isCompact;
  final String? label;

  const OsmeaDatePicker({
    Key? key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    required this.themeType,
    this.isCompact = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveInitialDate = initialDate ?? DateTime.now();
    final effectiveFirstDate = firstDate ?? DateTime(1900);
    final effectiveLastDate = lastDate ?? DateTime(2100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: OsmeaTypography.bodySmall(themeType).copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: ComponentDimensions.spaceXXS),
        ],
        InkWell(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: effectiveInitialDate,
              firstDate: effectiveFirstDate,
              lastDate: effectiveLastDate,
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: OsmeaColors.primary,
                      onPrimary: Colors.white,
                      surface: OsmeaColors.surface(themeType),
                      onSurface: OsmeaColors.onSurface(themeType),
                    ),
                    dialogBackgroundColor: OsmeaColors.surface(themeType),
                  ),
                  child: child!,
                );
              },
            );

            if (picked != null && onDateSelected != null) {
              onDateSelected!(picked);
            }
          },
          borderRadius: BorderRadius.circular(13), // Match button radius
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ComponentDimensions.spaceS, // spaceSm -> spaceS
              vertical: isCompact
                  ? ComponentDimensions.spaceXXS
                  : ComponentDimensions
                      .spaceXS, // space2xs -> spaceXXS, spaceXs -> spaceXS
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: OsmeaColors.border(themeType),
                width: 0.5, // Match button stroke
              ),
              borderRadius: BorderRadius.circular(13), // Match button radius
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: OsmeaColors.textSecondary(themeType),
                ),
                SizedBox(width: ComponentDimensions.spaceXS),
                Text(
                  DateFormat.yMMMd().format(effectiveInitialDate),
                  style: OsmeaTypography.bodyMedium(themeType),
                ),
                SizedBox(width: ComponentDimensions.spaceXS),
                Icon(
                  Icons.arrow_drop_down,
                  color: OsmeaColors.textSecondary(themeType),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
