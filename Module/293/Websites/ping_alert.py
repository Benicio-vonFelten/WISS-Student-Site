import os
import platform

def notify(title, message):
    if platform.system() == "Darwin":
        # macOS
        os.system(f"osascript -e 'display notification \"{message}\" with title \"{title}\"'")
    elif platform.system() == "Linux":
        # Linux
        os.system(f"notify-send \"{title}\" \"{message}\"")
    elif platform.system() == "Windows":
        # Windows
        from win10toast import ToastNotifier
        toaster = ToastNotifier()
        toaster.show_toast(title, message, duration=10)

if __name__ == "__main__":
    notify("Ping Alert", "Your laptop has been pinged!")
