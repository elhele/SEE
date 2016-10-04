package LegoNXT;

import lejos.nxt.Motor;
import lejos.nxt.SensorPort;
import lejos.robotics.navigation.DifferentialPilot;
import lejos.robotics.navigation.MoveController;
import lejos.util.Delay;
import lejos.nxt.LightSensor;

public class goLeft {

        public static void main(String[] args) {
                double arcRad = 30;
                double angle = 90;
                LightSensor lightSens1 = new LightSensor(SensorPort.S1);
                LightSensor lightSens2 = new LightSensor(SensorPort.S2);
                DifferentialPilot dp = new DifferentialPilot(MoveController.WHEEL_SIZE_NXT1, 18, Motor.B, Motor.C, true);

                lightSens1.setHigh(100);
                lightSens2.setHigh(100);
                Delay.msDelay(5000);
                dp.setTravelSpeed(10);
                dp.arc(-arcRad, angle);
                dp.stop();
                Delay.msDelay(10000);
        }

}
