package baigiangdongbo;

public class SuDungPhong extends Thread {
	private static Phong phong;
	static {
		phong = new Phong();
		phong.setTrong(true);
	}

	@Override
	public void run() {
		synchronized (phong) {
			while (!phong.isTrong()) {
				System.out.println(Thread.currentThread().getName() + " cho doi");
				try {
					phong.wait();
				} catch (InterruptedException e) {
				}
			}
			System.out.println(Thread.currentThread().getName() + " su dung phong");
			phong.setTrong(false);
			// gia dinh thoi gian su dung phong:
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
			}
			// thong bao cho cac threads dang cho doi
			// biet viec tra phong:
			phong.setTrong(true);
			// phong.notifyAll();
			phong.notify();
		}
	}

	public static void main(String args[]) {
		for (int i = 1; i < 6; i++) {
			SuDungPhong lop = new SuDungPhong();
			lop.setName("Lop " + i);
			lop.start();
		}
	}
}
