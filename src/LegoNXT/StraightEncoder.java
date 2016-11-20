package LegoNXT;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import lejos.nxt.Button;
import lejos.robotics.navigation.DifferentialPilot;
import lejos.robotics.navigation.MoveController;
import lejos.util.Delay;
import lejos.nxt.Motor;


public class StraightEncoder {
        public static void main(String args[]) {
                System.out.println("Please press right button!");
                Button.RIGHT.waitForPressAndRelease();

                FileOutputStream out = null;
                File data = new File("tacho1.dat");

                try {
                        out = new FileOutputStream(data);
                } catch (IOException e) {
                        System.err.println("Failed to create output stream");
                        System.exit(1);
                }
                double arcRad = 40;
                double angle = 90;
                double arcLen = Math.PI * 2 * arcRad * angle / 360;
                int getEncoderB;
                int getEncoderC;
                double trackWidth = 12;
                int encoderDelay = 500;

                DataOutputStream dataOut = new DataOutputStream(out);

                DifferentialPilot dp = new DifferentialPilot(MoveController.WHEEL_SIZE_NXT1, trackWidth, Motor.B, Motor.C, true);
                for (int j = 0; j < 2; j++) {
                        for (int i = 0; i < 2; i++) {
                                dp.setTravelSpeed(10);
                                dp.travel(-arcLen, true);
                                while(dp.isMoving()){
                                        getEncoderB = Motor.B.getTachoCount();
                                        getEncoderC = Motor.C.getTachoCount();

                                        try {
                                                dataOut.writeInt(getEncoderB);
                                                dataOut.writeInt(getEncoderC);
                                                Delay.msDelay(encoderDelay);
                                        } catch (IOException e) {
                                                e.printStackTrace();
                                        }
                                }
                                Delay.msDelay(3000);
                        }
                        dp.rotate(180, true);
                        while(dp.isMoving()){
                                getEncoderB = Motor.B.getTachoCount();
                                getEncoderC = Motor.C.getTachoCount();

                                try {
                                        dataOut.writeInt(getEncoderB);
                                        dataOut.writeInt(getEncoderC);
                                } catch (IOException e) {
                                        e.printStackTrace();
                                }
                        }
                }

                try {
                        dataOut.close();
                } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
        }
}
